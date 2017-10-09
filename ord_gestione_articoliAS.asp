<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
Dim s, i, s1,dataordine

codart = request("CODART")
'response.write " +++ "
'Response.Write codart

'response.end

NODISP = request("NODISP")
'response.write " +++ "
'Response.Write NODISP
'response.write " +++ "


i = 1

If request("CODART") <> 1 Then

'response.write "passo diverso da 1   "
'response.write "cancello da Assegnazioni   "

del = "DELETE FROM ORD_Assegnazioni"
Set rsdel = dbConn.Execute(del)
	
'response.write "inserisco in Assegnazioni   "    
    					
ins =  "INSERT INTO ORD_Assegnazioni (Numord,Codart,Barcode,LC,Qtarich,Qtarice,Qtadiff,DataPagamento,Dataordine) "
ins = ins &" SELECT Numord,Codart,Barcode,LC,Qtarich,Qtarice,Qtadiff,datapagamento,dataordine FROM ORD_Richieste WHERE 1=1 "
ins = ins & "AND DATAPAGAMENTO IS NOT NULL AND STATOORDINE = 0"
Set rs3 = dbConn.Execute(ins)

'response.write ins

'Inserire qui la creazione della mail di ORDINE COMPLETO

end if

'response.end

'response.write "passo di qui"

'modificata in data 07/09/2016 per visualizzare il nome articolo 

s =  "SELECT * FROM ORD_Assegnazioni, ORD_Articoli"
s = s & " WHERE ORD_Assegnazioni.codart =  ORD_Articoli.codart"
s = s & " ORDER BY Datapagamento ASC, Numord ASC"
Set rs2 = dbConn.Execute(s)


'originale 
's =  "SELECT * FROM ORD_Assegnazioni"
's = s & " ORDER BY Datapagamento ASC, Numord ASC"
'Set rs2 = dbConn.Execute(s)




'var1 =  "SELECT * FROM ORD_Articoli WHERE 1=1"
's = s & " ORDER BY DataOrdine"


'response.write s

if request("CODART") = 1 then
'response.write "SCRIVI LA MAIL"
end if

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
                            	<legend>Assegnazioni Richieste Materiale Learning Center</legend>
                                  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Articolo da assegnare</button>
                            </div>
<!--'modificata in data 15/09/2016 per visualizzare qta disponibile a magazzino e codice articolo -->

                                <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>Codice</th>
                                                <th>Articolo</th>
                                                <th>LC</th>
                                                <th>Qta in Magazzino</th>
												<th>Qta Richiesta</th>
												<th>Qta Ricevuta</th>
                                                <th>Qta Consegnata</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>Stato Ordine</th>
											</tr>
										</thead>
										
                                        <%

                                            if request("NODISP")  <> ""  then %>
                                                <div class="alert alert-danger">
                                                  <strong>Attenzione!</strong> La disponibilità attuale non permette il completamento dell'ordine, effettuare il riordino del materiale.
                                                </div>
                                       <% end if%>

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
                                                    Response.write rs2("Codart")
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
                                                    Response.write rs2("Qtadisp")
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
                                                        s =  "SELECT * FROM ORD_Cons_Parziali "
                                                        s = s & " WHERE NUMORD=" & rs2("numord") &" AND CODART  = '" & rs2("codart") & "'" 
                                                        Set rs3 = dbConn.Execute(s)
                                                        'Response.write s
                                                        'response.end

                                                 If Not rs3.eof Then
													'Response.write sss
                                                    Response.write rs3("qtacons")
												Else
													Response.write "&nbsp;"
												End If%>
                                                    </td>
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
                                                    <td>
												<%
												If Not rs2.eof Then
                                                'Response.write rs2("Statoordine")
                                                            if rs2("Statoordine") = 1 then
                                                            %><button type="button" class="btn btn-success">Completo</button>
                                                            <% else %>
                                                           <button type="button" class="btn btn-danger">Incompleto</button>
                                                           <% end if
                                                else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                               <td>
                                                       <%
                                                             dim disponibile                   
                                                             disponibile= rs2("QtaDisp")
                                                             if disponibile <0 then
                                                             response.write "&nbsp;"
                                                            else
                                                       %>

                                                                                 <%
                                                                                      dim completa                   
                                                                                      completa= rs2("QtaDiff")
                                                                                     'response.write abc                                  
                                                                                if completa < 0  then
                                                                                %>
                                                                               <a href="ord_articoli_assegnazioni_reload.asp?CODART=<%= rs2("codart") %>&NUMORD=<%= rs2("Numord") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="Assegna Quantità"></a> 
                                                                            <%else %>

                                                                              <% if  rs2("QtaRich") =  rs2("QtaRice")  then
                                                                                    response.write "&nbsp;"%>
                                                                               <%else%>
                                                                                <a href="ord_articoli_assegnazioni_reload.asp?CODART=<%= rs2("codart") %>&NUMORD=<%= rs2("Numord") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="Assegna Quantità"></a>
                                                                               <%end if%>

                                                                                 <%end if%>
                                                    <% end if%>

                                                                                <td>
                                                                                <!--15092016 consegna parziale dell'ordine-->
                                                                                <%
                                                                                dim parziale  
                                                                                QTACONS = request("QTACONS")                 
                                                                                      parziale= rs2("QtaRice")
                                                                                      ordcompl =  rs2("QtaRich") - rs2("QtaRice")
                                                                                      'response.write ordcompl
                                                                                      'response.end
                                                                                       if parziale > 0 and ordcompl >0 then
                                                                               %>
                                                                                   <a href="ord_articoli_assegnazioni_parziale.asp?CODART=<%= rs2("codart") %>&NUMORD=<%= rs2("Numord") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/segnalationkit.png" width="32" height="32" title="Consegna Parziale"></a>   
                                                                             <%end if %>
                                                                             </td>

                                                    <% if codart = 1 then
                                                    'Response.write "Email"
                                                    'ins =  "INSERT INTO ORD_COMUNICAZIONI (Data,LC,Statoordine,nrordine) VALUES (Date(), '" & rs2("LC") & "', 2, "& rs2("Numord") &")"
                                                    upd= "UPDATE ORD_COMUNICAZIONI SET STATOORDINE = 2 , INCOMPLETO =1 WHERE LC = '" & rs2("LC") & "' AND NRORDINE =  "& rs2("Numord")
                                                    'Set rs3 = dbConn.Execute(ins)
                                                    Set rs3 = dbConn.Execute(upd)
                                                    'response.write ins

                                                end if
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
        <h4 class="modal-title">Articolo da assegnare</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <!--<form method="post" Action="ord_gestione_ordini_risultati_pagamento.asp" class="form-horizontal">-->
                                        <form method="post" Action="ord_gestione_articoliAS_wip.asp" class="form-horizontal">
                                      <fieldset>

                                           <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="id_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                             Set rs0 = dbConn.Execute("SELECT DISTINCT LC FROM ORD_Assegnazioni, ORD_Articoli WHERE ORD_Assegnazioni.codart =  ORD_Articoli.codart")
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
                                          <label  for="focusedInput">Articolo
                                          <div class="controls">
                                          <select id="selectError" name="cod_ord" class="form-control" type="text" style="width:400px;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT * FROM ORD_Assegnazioni, ORD_Articoli WHERE ORD_Assegnazioni.codart =  ORD_Articoli.codart")
                                              While Not rs1.EOF
	                                                response.write "<option value='" & rs1("CODART") & "'>" & rs1("NOMART") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

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
