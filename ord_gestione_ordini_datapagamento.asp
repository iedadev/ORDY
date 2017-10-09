<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss, i 

'response.write sss3
'response.write sss2

learningcenter = request("id_lc")
codord = request("cod_ord")


response.write learningcenter
response.write codord
'response.write sss2
'response.endlearningcenter
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
                            	<legend>Registrazione Data Pagamento  </legend>
                                 <form name="P2" method="post" Action="ord_update_datapagamento.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>

                                          <div class="alert alert-info">
                                                    <strong>Info!</strong> Sono presenti i seguenti ordini con le condizioni richieste 
                                          </div>

                                           <% if learningcenter <> "" then%>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Learning Center </label>
                                          <div class="controls">
                                            <input name="learning_center" class="input-large focused" id="focusedInput" readonly type="text" value=<%=learningcenter%> style="width:200px;">
                                          
                                           </div>
                                        </div> 
                                          <%s =  "SELECT * FROM ORD_Richieste WHERE Statoordine =2  "& "AND LC = '" & request("id_lc") & "'" 
                                         ' response.write s   
                                          Set rs2 = dbConn.Execute(s)
                                         'response.end
                                          %>
                                          <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine 
                                                   <input hidden name="nr_ordine" class="input-large focused" id="focusedInput" readonly type="text" value=<%= rs2("numord")%> style="width:200px;">
                                                </th>
                                                <th>Codice Articolo</th>
                                                <th>Learning Center</th>
                                                <th>Barcode</th>
                                                <th>Data Ordine</th>
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
                                                    Response.write rs2("numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("codart")
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
                                                    Response.write rs2("barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                      <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("dataordine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                           <%end if  %>
                                           
                                           <% if codord <> "" then%>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Numero Ordine</label>
                                          <div class="controls">
                                            <input name="nr_ordine" class="input-large focused" id="focusedInput" readonly type="text" value=<%=codord%> style="width:80px; height: 30px">
                                            </div>
                                        </div>
                                          <%s =  "SELECT * FROM ORD_Richieste WHERE Statoordine =2 AND Numord = "& request("cod_ord") 
                                          'response.write s   
                                          Set rs2 = dbConn.Execute(s)
                                         'response.end
                                          %>
                                          <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Codice Articolo</th>
                                                <th>Learning Center</th>
                                                <th>Barcode</th>
                                                <th>Data Ordine</th>
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
                                                    Response.write rs2("numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("codart")
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
                                                    Response.write rs2("barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                      <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("dataordine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                           <%end if  %>

                                            <% if learningcenter = "" then
                                                       if codord = "" then%>

                                          <div class="alert alert-danger">
                                                    <strong>Attenzione!</strong> Per tutti gli ordini selezionati sarà aggiornata la data di pagamento
                                          </div>

                                          <%s =  "SELECT * FROM ORD_Richieste WHERE Statoordine =2" 
                                          'response.write s   
                                          Set rs2 = dbConn.Execute(s)
                                         'response.end
                                          %>
                                          <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Codice Articolo</th>
                                                <th>Learning Center</th>
                                                <th>Barcode</th>
                                                <th>Data Ordine</th>
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
                                                    Response.write rs2("numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("codart")
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
                                                    Response.write rs2("barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                      <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("dataordine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                  </tr>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                          <% end if%>  
                                          <% end if%>  

                                         <br>
                                           Inserire data pagamento: <input name="data_pagamento" class="input-large focused" id="focusedInput"  type="text" value=<%=Date()%> style="width:80px; height: 30px">
                                          <br>
                                          <br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-success">Conferma Pagamento</button>&nbsp;
                                          <a href="ord_gestione_ordini_risultati.asp"><button type="button" class="btn btn-primary tooltip-top">Nuova Ricerca</button></a>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
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
                                    <!--<form method="post" Action="ord_gestione_ordini_risultati_pagamento.asp" class="form-horizontal">-->
                                        <form method="post" Action="ord_gestione_ordini_datapagamento.asp" class="form-horizontal">
                                      <fieldset>
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
                                          <select id="selectError" name="cod_ord">
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
                                            <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Cerca</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
          </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
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
