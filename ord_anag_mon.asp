<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
 error = request ("error")
 'nrord = request("nrordine")
 'pdfordine = "ordineHD_"&nrord
 'nrord1 = request("NumOrdine")

 'response.write nrord
 'response.write "--" & pdfordine
 'response.write NumOrdine
 'response.write nrord1
 'response.end

 'response.write pdfordine

'if request("nrordine") = 99  then

'sss =  "SELECT Numord FROM ORD_Arrivi WHERE IDArr = (SELECT MAX(IDarr)  FROM ORD_Arrivi)"
'Set rs = dbConn.Execute(sss)

'nrord = rs("Numord")
'pdfordine = rs("Numord")
'pdfordine = "ordineHD_"&pdfordine


'response.write sss
'response.write pdfordine

'end if


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
                    <div class="col-lg-4  text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">

                            	<legend>Gestione Kit da monitorare per Learning Center</legend>

                            </div>
                                <div class="block-content collapse in">
                                <div class="span12">
                                    <form name="P2" method="post" class="form-horizontal" Action="ord_anag_mon_barcode.asp" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Codice Articolo
                                          <input name="barcode" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                              </div></label> 
                                        
                                             <input type="radio" name="code" value="bar" checked >&nbsp;Barcode &nbsp;&nbsp;<input type="radio" name="code" value="hd">&nbsp;Codice HD
                                          <br><br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Cerca</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                          
                                      </fieldset>
                                    </form>
                                    <p>
                                   <% If request("error")= 98 then %>
                                    <div class="alert alert-danger">
                                        <strong>Attenzione!</strong> Non sono presenti in magazzino articoli con il codice inserito.
                                    </div>
                                    <%end if%>



                                    <div align="right">
                                    <a href="main.asp"><button type="button" class="btn btn-success" align="right">Torna alla home</button></a>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend> Elenco Articoli da Monitorare</legend> 
                                 
                            </div>

                                   <% If request("Del") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Articolo da monitorare eliminato con successo.</strong>
                                    </div>
                                    <%end if%>

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Codice Articolo</th>
												<th>Barcode </th>
												<th>Articolo</th>
                                                <th>Qta Minima</th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
                                                'storico articoli per il nr ordine
                                               sss ="SELECT * FROM ORD_MONITORING"
                                               ' response.write sss
                                                Set rsmon = dbConn.Execute(sss)
                                               'response.end

													While Not rsmon.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
		
														<td><%= rsmon("Codart") %></td>
														<td><%= rsmon("Barcode") %></td>
                                                        <td><%= rsmon("Nomart") %></td>
                                                        <td><%= rsmon("Qtamin") %></td>
                                                        <td>
                                                        
                                                        <a href="ord_anag_mon_elimina.asp?USER=<%= session("usr") %>&Codart=<%=  rsmon("Codart") %>&Barcode=<%= rsmon("Barcode") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/buttondelete.png" width="32" height="32" title="Elimina Articolo da lista"></a>
                                                        
                                                        </td>

													</tr>
													<%
													rsmon.MoveNext
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
