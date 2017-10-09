<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file="config.asp"-->
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'response.end

'Ordini presi in carico
oinc =  "SELECT Distinct DATA,LC,NRORDINE FROM ORD_COMUNICAZIONI WHERE STATOORDINE =1 ORDER BY DATA"
Set rsoinc = dbConn.Execute(oinc)
'response.write oinc

'Ordini completi
ocom =  "SELECT Distinct DATA,LC,NRORDINE FROM ORD_COMUNICAZIONI WHERE STATOORDINE =2 ORDER BY DATA"
Set rsocom = dbConn.Execute(ocom)
'response.write ocom

'Ordini in attesa di pagamento
opag =  "SELECT Distinct DATAORDINE ,LC,NUMORD FROM ORD_RICHIESTE WHERE DATAPAGAMENTO IS NULL ORDER BY DATAORDINE"
Set rsopag = dbConn.Execute(opag)
'response.write ocom

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
        <link href="vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


    </head>
    <body>
              <!--#include virtual file="include/menu.asp"--> 
         <div class="container-fluid">
            <div class="row-fluid">
                <div class="span4" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div align="center" class="block">
                            <div  class="navbar navbar-inner block-header">
                            	<legend>MordyAN - Gestionale Magazzino</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span8" align="center">
                                    <table align="center" border="0">
                                        <td align="center"><a href="ord_anagrafiche.asp"> <img src="images/icon/anagrafiche.png" width="128" height="128" title="Gestione Anagrafiche"></a></td>
                                        <td align="center"><a href="ord_magazzino.asp"><img src="images/icon//magazzino.png" width="128" height="128" title="Gestione Magazzino"></a></td>
                                      </tr>
                                      <tr align="center">
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">Anagrafiche</font></td>
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">Magazzino</font></td>
                                      </tr>
                                       <tr align="center">
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">&nbsp;</font></td>
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">&nbsp;</font></td>
                                       </tr>
                                      </table>
                                </div>
                            </div>
                        </div>
                            </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                         <div class="container-fluid">
            <div class="row-fluid">
                <div class="span8" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                         <!-- block -->
                          <div align="center" class="block">
                            <div  class="navbar navbar-inner block-header">
                            	<legend>Comunicazioni</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                        <div class="container" align ="left">
                                          <ul class="nav nav-pills">
                                            <li class="active"><a data-toggle="pill" href="#home">Ordini presi in carico</a></li>
                                            <li><a data-toggle="pill" href="#menu1">Ordini Completi</a></li>
                                            <li><a data-toggle="pill" href="#menu2">Ordini in attesa di Pagamento</a></li>
                                            <li><a data-toggle="pill" href="#menu3">Menu 3</a></li>
                                          </ul>
  
                                          <div class="tab-content">
                                            <div id="home" class="tab-pane fade in active">
                                              <h3>Ordini presi in carico</h3>
                                           <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Data</th>
                                                <th>Learning Center</th>
                                                <th>Nr. Ordine</th>
                                                <th>Mail</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rsoinc.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            
                                            <td>
												<%
												If Not rsoinc.eof Then
													'Response.write sss
                                                    Response.write rsoinc("DATA")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                            <td>
												<%
												If Not rsoinc.eof Then
													'Response.write sss
                                                    Response.write rsoinc("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
											<td>
												<%
											    If Not rsoinc.eof Then
													'Response.write sss
                                                    Response.write rsoinc("NRORDINE")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
                                            <td>
												<%
												If Not rsoinc.eof Then
                                                %>
                                                   <a href="EMAIL.asp"><img src="images/sendmail.png" width="32" height="32" title="Invia Mail Ordine Ricevuto"></a>
												<%
                                                Else
													Response.write "&nbsp;"
												End If
												%>
												</td> 
                                               </tr>
											<%
											rsoinc.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                            </div>
                                            <div id="menu1" class="tab-pane fade">
                                              <h3>Ordini Completi</h3>
                                              <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Data</th>
                                                <th>Learning Center</th>
                                                <th>Nr. Ordine</th>
                                                <th>Mail</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rsocom.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            
                                            <td>
												<%
												If Not rsocom.eof Then
													'Response.write sss
                                                    Response.write rsocom("DATA")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                            <td>
												<%
												If Not rsocom.eof Then
													'Response.write sss
                                                    Response.write rsocom("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
											<td>
												<%
											    If Not rsocom.eof Then
													'Response.write sss
                                                    Response.write rsocom("NRORDINE")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
                                            <td>
												<%
												If Not rsocom.eof Then
                                                %>
                                                   <a href="EMAIL.asp"><img src="images/sendmail.png" width="32" height="32" title="Invia Mail Ordine Completo"></a>
												<%
                                                Else
													Response.write "&nbsp;"
												End If
												%>
												</td> 
                                               </tr>
											<%
											rsocom.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                            </div>
                                            <div id="menu2" class="tab-pane fade">
                                              <h3>Ordini in attesa di Pagamento</h3>
                                              <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Data</th>
                                                <th>Learning Center</th>
                                                <th>Nr. Ordine</th>
                                                <th>Mail</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rsopag.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            
                                            <td>
												<%
												If Not rsopag.eof Then
													'Response.write sss
                                                    Response.write rsopag("DATAORDINE")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                            <td>
												<%
												If Not rsopag.eof Then
													'Response.write sss
                                                    Response.write rsopag("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
											<td>
												<%
											    If Not rsopag.eof Then
													'Response.write sss
                                                    Response.write rsopag("NUMORD")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
                                            <td>
												<%
												If Not rsopag.eof Then
                                                %>
                                                   <a href="EMAIL.asp"><img src="images/sendmail.png" width="32" height="32" title="Invia Mail Ordine In Attesa di Pagamento"></a>
												<%
                                                Else
													Response.write "&nbsp;"
												End If
												%>
												</td> 
                                               </tr>
											<%
											rsopag.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                            </div>
                                            <div id="menu3" class="tab-pane fade">
                                              <h3>Menu 3</h3>
                                              <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                            </div>
                                          </div>
                                        </div>


                                </div>
                            </div>
                        </div>
                            </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->

                        <!-- /block -->
                    </div>
                    
                </div>
            </div>
                        <!-- /block -->
                    </div>
                    
                </div>
            </div>
            <hr>
		    <!--#include virtual file="include/piede.asp"-->
		            </div>
        <!--/.fluid-container-->

    </body>

</html>
<%
Set rs = Nothing
Set dbConn = Nothing
%>
