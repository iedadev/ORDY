<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

Dim sss, i , test

codice= request("code")
'nrordine= request("nrordine")

bcode= request("barcode")

response.write codice
response.write bcode

if request("code")= "bar" then

sss6 = "SELECT COUNT(*) as Totale FROM ORD_Articoli WHERE Barcode = '" & request("BARCODE") & "'"
			Set rs6 = dbConn.Execute(sss6)
			response.write sss6
            'response.end
           If rs6("Totale") = 0 Then
                'response.write "Il totale è 0"
		        response.redirect "ord_anag_mon.asp?Error=98"
                 response.write "oAAA"
                ' inserire gestione errori per articolo non trovato
            End If
else
sss6 = "SELECT COUNT(*) as Totale FROM ORD_Articoli WHERE Codart = " & request("BARCODE")
			Set rs6 = dbConn.Execute(sss6)
			'response.write sss6
            'response.end
            If rs6("Totale") = 0 Then
                'response.write "Il totale è 0"
		       'response.redirect "ord_gestione_articoliIN.asp?nrordine=98"
               response.write "oBBB"
                ' inserire gestione errori per articolo non trovato
           End If
end if

if request("code")= "bar" then

sss =  "SELECT * FROM ORD_Articoli WHERE BARCODE = '" & request("BARCODE") & "'"
Set rs = dbConn.Execute(sss)

else

sss =  "SELECT * FROM ORD_Articoli WHERE CODART = " & request("BARCODE")
Set rs = dbConn.Execute(sss)
'response.write sss
'response.end
end if

'qtaprenotata
'sqpr = "SELECT SUM (qtadiff) as totpr FROM ORD_Assegnazioni WHERE BARCODE = '" & request("BARCODE") & "'"
'Set rsqpr = dbConn.Execute(sqpr)

%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.barcode.value == "")
			{
			alert("Attenzione! Inserire il Codice articolo. Dato Obbligatorio");
			document.P2.barcode.style.backgroundColor = 'Yellow';
			document.P2.barcode.focus();
			return false;
			}
		}
		//-->
		</script>

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <!--#include virtual file="include/navigation.asp"-->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                 <!--#include virtual file="include/heading.asp"--> 
               
                 <!-- /.row -->

<div class="row">
                    <div class="col-lg-6 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Scheda Kit Articolo da Monitorare                          
                                 <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro"></a>
                                </legend>
                            </div>
                                <div class="span8">
                                <form method="post" class="form-horizontal" Action="ord_anag_mon_qtamin.asp?code=<%=request("code")%>&codart=<%= rs("Codart") %>&barcode=<%= request("barcode") %>&nomart=<%= rs("Nomart") %>&qtamin=<%= request("qta_min") %>"> 
                                </div>
                                <table class="table table-condensed">
									<tbody>
                                        <tr>
											<th>Codice Articolo</th>
                                            <th>Barcode</th>
											<th>Nome Articolo</th>
										</tr>
                                        <tr>
										    <td><%= rs("Codart") %></td>
                                            <td><%= rs("Barcode") %></td>
											<td><%= rs("Nomart") %></td>
										</tr>
                                           <tr>    
                                        <!-- mettere condizione di If che visualizza la parte sotto dopo aver inserito il barcode-->
											<th>Quantità Minima da acquistare</th>
										</tr>
                                <tr>                           
											<td>
                                            <div class="form-group">
                                          <label  for="focusedInput">
                                          <input name="qta_min" class="form-control" id="focusedInput"  type="number" min="0" max="999" maxlength="3" value="<%= rs("Qtamin") %>"style="width:80px;">
                                           </div></label> 
                                           </td>
                                            <td>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-success" data-original-title="Inserisci Articolo">Inserisci </button>&nbsp;
                                                <button type="reset" class="btn btn-default">Annulla</button>&nbsp;
                                             </div>
                                             </form>
                                            </td>
								</tr>
                            </tbody>
								</table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Articoli con qta minime da ordinare </legend>
                            </div> 
                                
                                 <% If request("Del") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Articolo da monitorare eliminato con successo.</strong>
                                    </div>
                                    <%end if%>

                                <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Codice</th>
												<th>Barcode</th>
												<th>Articolo</th>
                                                <th>Qta Minima</th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                codart = rs("Codart")
                                                'Response.Write(Session("id_usr"))

                                                sss = "SELECT * FROM ORD_Monitoring "
                                                Set rs = dbConn.Execute(sss)

                                                if Rs.eof then 
                                                %><br>
                                                <div class="alert alert-info span10">
                                                  <strong>Info!</strong> Non vi sono ancora articoli da monitorare
                                                </div>
                                                <%
                                                 End if
												'Response.Write sss
                                                'Response.Write rs("POS")

													While Not rs.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
		
														<td><%= rs("Codart") %></td>
														<td><%= rs("Barcode") %></td>
                                                        <td><%= rs("Nomart") %></td>
                                                        <td><%= rs("Qtamin") %></td>
                                                        <td>

                                                        <a href="ord_anag_mon_elimina.asp?Codart=<%=  rs("Codart") %>"><img src="images/buttondelete.png" width="32" height="32" title="Elimina Articolo da lista"></a>
                                                        
                                                        </td>
													</tr>
													<%
													rs.MoveNext
													Wend
													%>

										</tbody>
									</table>
                            </div>
                        </div>
                    </div>
</div>
                            
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
