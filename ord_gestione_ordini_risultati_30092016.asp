<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1

dim dataordine

dataordine = request.form("data_ord")

i = 1
									
s =  "SELECT * FROM ORD_Richieste WHERE 1=1"
'sss = sss & " ORDER BY Datain"

'session("sss") = sss

										    If request("cod_ord") <> "" Then
												s = s & " AND Numord =" & request("cod_ord")
											End if
                                            'response.write ("Query MCAT: " & sss)
                                            'response.end
                                            
                                            If request("barcode") <> "" Then
												s = s & " AND Barcode ='" & request("barcode") & "'"
											End if
                                            'response.write ("Query MCAT: " & sss)
                                            'response.end
											If request("id_lc") <> "" Then
												s = s & " AND LC='" & request("id_lc") & "'"
											End If
                                            'response.write ("Query CAT: " & sss)
                                            'response.end

											If request("data_ord") <> "" Then
												s = s & " AND DataOrdine LIKE '" & request("data_ord") & "'"
											End If
											'response.write ("Query SCAT: " & sss)
                                            'response.end                                         													
                                            
                                            If request("IDStatoOrdine") <> "" Then
												s = s & " AND StatoOrdine=" & request("IDStatoOrdine")
											End If

Set rs2 = dbConn.Execute(s)


'barcode1=rs2("BARCODE")
'response.write barcode1

'ss =  "SELECT Nomart FROM ORD_Articoli WHERE Barcode ='" & barcode1 & "'"
'Set rs3 = dbConn.Execute(ss)

'response.write ss
'response.end



'response.write s
'response.end

%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

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

   <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P3.cod_ord.value == "")
			{
			alert("Attenzione! Inserire Codice Ordine Dato Obbligatorio");
			document.P3.cod_ord.style.backgroundColor = 'Yellow';
			document.P3.cod_ord.focus();
			return false;
			}
		}
		//-->
		</script>


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
 <div class="col-lg-12 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Situazione Stato Ordini  </legend>
                                 <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro">
                                    <!-- fare insert in tabella ORD_COMPLETI eliminandoli da tabella ORD_RICHIESTE-->
                                    <a href="ord_gestione_completi.asp"><button type="button" class="btn btn-success">Archivia Ordini Completati</button></a>
                                     <!--19092016 Archivia gli ordini con Consegna Parziale-->
                                    <a href="ord_gestione_consegna_parziale.asp"><button type="button" class="btn btn-default">Archivia Ordini Consegna Parziale</button></a>
                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">Registra Data pagamento</button>
									<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal2">Modifica Ordine</button>
                            </div>

                              <%if request("del") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong>Ordini archiviati con successo</strong>
                                            </div>
                                     <%end if%>

                               <%if request("del") =2 then %> 
                                            <div class="alert alert-success">
                                              <strong>Articolo Eliminato con successo</strong>
                                            </div>
                                     <%end if%>
									 
								<%if request("new") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong>Articolo Aggiunto con successo</strong>
                                            </div>
                                     <%end if%>	 

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>LC</th>
												<th>Articolo</th>
												<th>Qta Richiesta</th>
                                                <th>Qta Assegnata</th>
												<th>Qta Diff</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>Stato Ordine</th>
                                             </tr>
										</thead>
										<tbody>
											<%
											While Not rs2.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
                                               <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Nomart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>													
												<td>
                                                <%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("QtaRich")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>

                                                 <% if rs2("Statoordine") <> 1 then %>
												<td>
												<%
												If Not rs2.eof Then
													Response.write rs2("QtaRice")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("QtaDiff")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <%else%>
                                                <td><%
												If Not rs2.eof Then
													Response.write rs2("QtaRich")
												Else
													Response.write "&nbsp;"
												End If
												%></td>
                                                <td>
                                                <%
												If Not rs2.eof Then
													Response.write "&nbsp;"
												End If
												%>
                                                </td>
                                                <%end if%>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataPagamento")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataOrdine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td><!-- 2016.2 se la qtarichiesta  è uguale a quella ricevuta valorizzo lo stato ordine a completato altrimenti metto incpmpleto -->
												<%
												If Not rs2.eof Then %>
													<% if rs2("Statoordine") = 1 then %>
                                                   <button type="button" class="btn btn-success">Completo</button>
                                                    <%else 
                                                      if rs2("Statoordine") = 2 then %>
                                                   <button type="button" class="btn btn-warning">Attesa pagamento</button>
                                                    <%else%>
                                                    <button type="button" class="btn btn-danger">Incompleto</button>
                                                   <% end if%>

                                                <%end if %>  
												<% Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
													Response.write "&nbsp;"
												%>
												</td>
                                                </tr>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                            </div>
                          </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Registra Data Pagamento</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <!--<form method="post" Action="ord_gestione_ordini_risultati_pagamento.asp" class="form-horizontal">-->
                                        <form method="post" Action="ord_gestione_ordini_datapagamento.asp" class="form-horizontal">
                                      <fieldset>

                                           <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="id_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                             Set rs0 = dbConn.Execute("SELECT DISTINCT LC FROM ORD_Richieste WHERE Statoordine =2 ORDER BY LC")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("LC") & "'>" & rs0("LC") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>
                                           </div>

                                          <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine
                                          <div class="controls">
                                          <select id="selectError" name="cod_ord" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT Distinct NUMORD FROM ORD_Richieste WHERE Statoordine =2 ORDER BY NUMORD")
                                              While Not rs1.EOF
	                                                response.write "<option value='" & rs1("NUMORD") & "'>" & rs1("NUMORD") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottonecerca)%>"><%=response.write (testobottonecerca)%></button>&nbsp;
                                          <button type="reset" class="btn"><%=response.write (testobottoneannulla)%></button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>    
    
    <!-- Modal 2-->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modifica Ordini</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                        <form name="P3" method="post" Action="ord_gestione_articoli_modifica.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                           <b>Selezionare il numero d'ordine da modificare</b>
                                          <br><br>
                                          <div class="form-group">
                                          <label  for="focusedInput">
                                          <div class="controls">
                                          <select id="selectError" name="cod_ord" class="form-control" type="text" style="width: auto;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT DISTINCT NUMORD FROM ORD_Richieste WHERE Statoordine =2 ORDER BY NUMORD")
                                              While Not rs1.EOF
	                             response.write "<option value='" & rs1("NUMORD") & "'>" & rs1("NUMORD") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Modifica">Modifica</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
