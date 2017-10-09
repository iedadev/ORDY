<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

 nrord = request("nrordine")
 pdfordine = "ordineHD_"&nrord
 'nrord1 = request("NumOrdine")

 'response.write nrord
 'response.write "--" & pdfordine
 'response.write NumOrdine
 'response.write nrord1
 'response.end

 'response.write pdfordine

if request("nrordine") = 99  then

sss =  "SELECT Numord, Dataarr FROM ORD_Arrivi WHERE IDArr = (SELECT MAX(IDarr)  FROM ORD_Arrivi) ORDER BY DATAARR ASC"
Set rs = dbConn.Execute(sss)

nrord = rs("Numord")
pdfordine = rs("Numord")
pdfordine = "ordineHD_"&pdfordine


'response.write sss
'response.write pdfordine

end if


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

     <!--Intestazione-->
	
	<!--#include virtual file="include/title.asp"-->

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
                            	<% if request("nrordine") = 98  then%>

                            	<legend>Gestione Ordini da Helen Doron</legend>

                                <%else%>

                                <legend>Gestione Ordini <%=response.write (nrord)%> da Helen Doron</legend>

                                <%end if%>
                            </div>
                                <div class="block-content collapse in">
                                <div class="span12">
								
                                        <%if request("Err")  = 3 then %>
                                                <div class="alert alert-danger">
                                                  <strong>Attenzione!</strong>Articolo già inserito in questo ordine.
                                                </div>
                                       <% end if%>
								
								
                                      <%If nrord <> " " then%>
                                    <form name="P2" method="post" class="form-horizontal" Action="ord_gestione_articoli_barcode.asp?nrordine=<%response.write (nrord)%>" onsubmit="return controllo()">
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
                                    <div align="right">
                                    <a href="main.asp"><button type="button" class="btn btn-success" align="right">Torna alla home</button></a>
                                    </div>
                                <%End if%> 
                                

                                <% if request("nrordine") = 98  then%>

                                   <div class="alert alert-danger">
                                      <strong>Attenzione!</strong> Il codice inserito non è presente tra gli articoli di magazzino.
                                    </div>

                                    <%end if%>


                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
							 
							         <% if request("nrordine") = 98  then%>

                            	<legend>Articoli Ordine</legend>

                                <%else%>

								     <legend> Articoli Ordine  <%=response.write (nrord)%> &nbsp; &nbsp; &nbsp; &nbsp;

                                <%end if%>
							 
                            	
                                 <a href="ord_gestione_nrordine.asp"><button type="button" class="btn btn-success" align="right">Torna Elenco ordini</button></a>
                                </legend> 
                                 
                            </div>

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Codice Articolo</th>
												<th>Qta arrivata</th>
												<th>Data arrivo</th>
                                               <th>Nome Articolo</th>
                                               <th>Prezzo </th>
												<th>#</th>
											</tr>
										</thead>
										<tbody>
											<%
                                                'storico articoli per il nr ordine
												i = 1
												iduser=session("id_usr")
                                                'codart = rsnord("Codart")
                                                'codart = rs("Numord")
                                                codart = request("nrordine")
                                                'Response.Write(Session("id_usr"))
                                                if request("nrordine") <> ""  then
                                               ' sss = "SELECT Codart,Qtaarr,Dataarr,Numord FROM ORD_arrivi WHERE numord=" & codart
                                               sss ="SELECT ORD_Arrivi.NumOrd, ORD_Arrivi.Qtaarr, ORD_Arrivi.Codart, ORD_Articoli.Nomart, ORD_arrivi.Dataarr, "
                                               sss = sss & "ORD_Articoli.Przart FROM ORD_Arrivi INNER JOIN ORD_Articoli ON ORD_Arrivi.Codart = ORD_Articoli.Codart WHERE ORD_Arrivi.NumOrd=" & codart 
                                               'response.write sss
                                                Set rsnord = dbConn.Execute(sss)
                                               'response.end
                                                
                                                if rsnord.eof then 
                                                %><br>
                                                <div class="alert alert-info span10">
                                                  <strong>Info!</strong> Non hai ancora caricato nessun articolo per questo codice
                                                </div>
                                                <%
                                                 End if
												'Response.Write sss
                                                'Response.Write rs("POS")

													While Not rsnord.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
		
														<td><%= rsnord("Codart") %></td>
														<td><%= rsnord("Qtaarr") %></td>
                                                        <td><%= rsnord("Dataarr") %></td>
                                                        <td><%= rsnord("Nomart") %></td>
                                                        <td><%
																dim Numero
																Numero = rsnord("Przart")
																Response.write "Euro: " & FormatNumber (Numero,2,,,-1) %>
														</td>
														<td><a href="ord_articoli_ordine_modifica.asp?NUMORD=<%=rsnord("Numord")%>&codart=<%= rsnord("Codart") %>"<i class="fa fa-pencil fa-2x" title="Modifica"></i></a>

													</tr>
													<%
													rsnord.MoveNext
													Wend
													%>

										</tbody>
									</table>
                                 <%else
                                        Response.write "nulla"
                                      end if
                                %>
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
