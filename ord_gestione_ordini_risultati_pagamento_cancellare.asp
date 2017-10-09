<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->

<%
Dim s, i, s1

dim dataordine

dataordine = request.form("data_ord")

response.write dataordine

'response.end

i = 1
										
s =  "SELECT * FROM ORD_Richieste WHERE Statoordine =2"
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

response.write s
'response.end

%>

<!DOCTYPE html>
<html lang="it">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--#include virtual file="include/title.asp"-->
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
	    <!--#include virtual file="include/menu.asp"-->
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12" id="content">
                     <div class="row-fluid">
                         
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Articoli &nbsp;&nbsp;
                        	        <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro">
                                </legend>
                            </div>
                            <div class="block-content collapse in">
                                 <!--#include virtual file="ord_controlpanelmagazzino.asp"-->
                                <div class="span8">
  									
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>LC</th>
												<th>Qta Rich</th>
												<th>Qta Ricev</th>
												<th>Qta Diff</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>&nbsp;</th>
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
                                                    Response.write rs2("QtaRich")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
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
                                                <td>
												
                                           <div class="control-group">
                                          <div class="controls">
                                            <input type="text"  value ="<%=date() %>" class="input-xlarge" id="date01"  placeholder="GG/MM/AAAA" name="Data_Pagamento" style="width:120px; height: 30px">
                                            </div>
                                        </div>	
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
                                                <td>

                                                    <!-- SONO QUI-->

												<a href="ord_update_data_pagamento.asp?NUMORD=<%= rs2("Numord") %>&LC=<%= rs2("LC") %>&Date=<%value=("Data_Pagamento")%>"<button type="button" class="btn btn-success">Registra</button>
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
                        <!-- /block -->
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
      <div class="modal-body">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <p><div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form method="post" Action="ord_gestione_ordini_risultati._pagamento.asp" class="form-horizontal">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Codice Ordine </label>
                                          <div class="controls">
                                          	<input name="cod_ord" class="input-small focused" id="focusedInput" type="text" style="width:200px;">
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Barcode</label>
                                          <div class="controls">
                                          	<input name="barcode" class="input-small focused" id="focusedInput" type="text" style="width:200px;">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Learning Center</label>
                                          <div class="controls">
                                          <select id="selectError" name="id_lc">
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
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"> Numero Ordine </label>
                                          <div class="controls">
                                          <select id="selectError" name="data_ord">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT Distinct NUMORD FROM ORD_Richieste WHERE Statoordine =2 ORDER BY NUMORD")
                                              While Not rs1.EOF
	                                                response.write "<option value='" & rs1("NUMORD") & "'>" & rs1("NUMORD") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput">Stato Ordine </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDStatoOrdine">
                                              <option value=""></option>
                                              <%
                                              Set rs9 = dbConn.Execute("SELECT * FROM ORD_StatoOrdini ORDER BY StatoORDINE")
                                              While Not rs9.EOF
	                                                response.write "<option value='" & rs9("ID_StatoORDINE") & "'>" & rs9("StatoORDINE") & "</option>"
		                                     rs9.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
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
          </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
            <hr>
		    <!--#include virtual file="include/piede.asp"-->
        </div>
        <!--/.fluid-container-->

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script>
        $(function() {
            
        });
        </script>
        <script>
        $(function() {
            $('.tooltip').tooltip();	
			$('.tooltip-left').tooltip({ placement: 'left' });	
			$('.tooltip-right').tooltip({ placement: 'right' });	
			$('.tooltip-top').tooltip({ placement: 'top' });	
			$('.tooltip-bottom').tooltip({ placement: 'bottom' });

			$('.popover-left').popover({placement: 'left', trigger: 'hover'});
			$('.popover-right').popover({placement: 'right', trigger: 'hover'});
			$('.popover-top').popover({placement: 'top', trigger: 'hover'});
			$('.popover-bottom').popover({placement: 'bottom', trigger: 'hover'});

			$('.notification').click(function() {
				var $id = $(this).attr('id');
				switch($id) {
					case 'notification-sticky':
						$.jGrowl("Stick this!", { sticky: true });
					break;

					case 'notification-header':
						$.jGrowl("A message with a header", { header: 'Important' });
					break;

					default:
						$.jGrowl("Hello world!");
					break;
				}
			});
        });
        </script>
    </body>
</html>
<%
Set rs = Nothing
Set rs1 = Nothing
Set rs2 = Nothing
Set dbconn = Nothing
%>