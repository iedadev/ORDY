<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
Dim s, i, s1,dataordine

codart = request("cod_ord")
response.write " +++ "
response.Write codart

LC = request("id_lc")
response.write " +++ "
response.Write LC

'response.end

NODISP = request("NODISP")
'response.write " +++ "
'Response.Write NODISP
'response.write " +++ "


i = 1

'If request("CODART") <> 1 Then

'response.write "passo diverso da 1   "
'response.write "cancello da Assegnazioni   "

'del = "DELETE FROM ORD_Assegnazioni"
'Set rsdel = dbConn.Execute(del)
	
'response.write "inserisco in Assegnazioni   "    
    					
'ins =  "INSERT INTO ORD_Assegnazioni (Numord,Codart,Barcode,LC,Qtarich,Qtarice,Qtadiff,DataPagamento,Dataordine) "
'ins = ins &" SELECT Numord,Codart,Barcode,LC,Qtarich,Qtarice,Qtadiff,datapagamento,dataordine FROM ORD_Richieste WHERE 1=1 "
'ins = ins & "AND DATAPAGAMENTO IS NOT NULL AND STATOORDINE = 0"
'Set rs3 = dbConn.Execute(ins)

'response.write ins

'Inserire qui la creazione della mail di ORDINE COMPLETO

'end if

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


response.write s

'if request("CODART") = 1 then
'response.write "SCRIVI LA MAIL"
'end if

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
                            </div>
<!--'modificata in data 15/09/2016 per visualizzare qta disponibile a magazzino e codice articolo -->

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">


<div class="block-content collapse in">
                                <div class="span12">
  									<table class="table table-condensed">
						              <tbody>
						              <%
                                            ss2 =  "SELECT DISTINCT Codart, Numord, LC FROM ORD_Richieste WHERE 1=1"
                                           
                                            If request("cod_ord") <> "" Then
												s = s & " AND Codart ='" & request("cod_ord") &"'"
											End if




						                response.write ss2
                                        response.end
						              Set rs = dbConn.Execute(ss2)
						              While Not rs.EOF
						              %>
						              	<%
						              	s =  "SELECT * FROM ORD_Richieste WHERE 1=1"
                                       
                                            If request("cod_ord") <> "" Then
												s = s & " AND Codart ='" & request("cod_ord") &"'"
											End if
                                            'response.write ("Query MCAT: " & sss)
                                            'response.end
                                            
                                           ' If request("barcode") <> "" Then
											'	s = s & " AND Barcode ='" & request("barcode") & "'"
											'End if
                                            'response.write ("Query MCAT: " & sss)
                                            'response.end
											If request("id_lc") <> "" Then
												s = s & " AND LC='" & request("id_lc") & "'"
											End If
                                            'response.write ("Query CAT: " & sss)
                                            'response.end

										'	If request("data_ord") <> "" Then
										'		s = s & " AND DataOrdine LIKE '" & request("data_ord") & "'"
										'	End If
											'response.write ("Query SCAT: " & sss)
                                            'response.end                                         													
                                            
                                      '     If request("IDStatoOrdine") <> "" Then
										'		s = s & " AND StatoOrdine=" & request("IDStatoOrdine")
									'		End If      
                                       
                                       
                                        response.write s
                                        'response.end
						              	Set rs1 = dbConn.Execute(s)
						              	If Not rs1.EOF Then
							              	response.write "<tr class='success'>"
							              	response.write "<td colspan='6'><div class='muted pull-left'>" & rs("Numord") & " " & rs("LC") & "</div></td>"
							              	response.write "</tr>"
							                response.write "<tr>"
							                response.write "<th>Barcode</th>"
							                response.write "<th>Codice</th>"
							                response.write "<th>Articolo</th>"
                                            response.write "<th>Qta in Magazzino</th>"
                                            response.write "<th>Qta Richiesta</th>"
                                            response.write "<th>Qta Ricevuta</th>"
                                            response.write "<th>Qta Consegnata</th>"
                                            response.write "<th>Data Pagamento</th>"
                                            response.write "<th>Data Ordine</th>"
                                            response.write "<th>Stato Ordine</th>"
							                response.write "<th>&nbsp;</th>"
							                response.write "</tr>"
						              	End If
						              	While Not rs1.EOF
						              	%>
                                          <tr>
                                          <td><%response.write rs1("Barcode")%></td>
                                          <td><%response.write rs1("Codart")%></td>
                                          <td><%response.write rs1("Nomart")%></td>
                                          <td><%response.write rs1("LC")%></td>
                                          <td><%response.write rs1("QtaRich")%></td>
                                          <td><%response.write rs1("QtaRice")%></td>
                                          <td><%response.write rs1("LC")%></td>
                                          <td><%response.write rs1("DataPagamento")%></td>
                                          <td><%response.write rs1("DataOrdine")%></td>



                                           <td>
												<%
												If Not rs1.eof Then %>
													<% if rs1("Statoordine") = 1 then %>
                                                   <button type="button" class="btn btn-success">Completo</button>
                                                    <%else 
                                                      if rs1("Statoordine") = 2 then %>
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
                                          </tr>

						                <%
						                rs1.MoveNext
						                Wend
						                %>
						               <%
						               rs.MoveNext
						               Wend
						               %>
						              </tbody>
                                </table>

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









                                <!-- kkkkkkkkkkkkkkkkkkkk -->
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
