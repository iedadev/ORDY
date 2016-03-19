<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
'   response.redirect "hd_todo.asp"
'End If

If request("CTRBAR") <>"" Then
   'response.write "IL barcode è duplicato"
%>

   <body onload="window.alert('Attenzione, il Kit selezionato è già nella tua lista.')">
    
<%End if%>   


<%
Dim sss, i, sss1

i = 1
										
sss =  "SELECT * FROM SIM_Kit WHERE 1=1 AND ATTIVO = 1 "
'sss = sss & " ORDER BY Datain"

'session("sss") = sss

										
                                            If request("IDMcat") <> "" Then
												sss = sss & " AND (IDMcat =" & request("IDMcat") & ")"
											End if
                                            'response.write ("Query MCAT: " & sss)
                                            'response.end
											If request("IDCat") <> "" Then
												sss = sss & " AND (IDcat=" & request("IDCat") & ")"
											End If
                                            'response.write ("Query CAT: " & sss)
                                            'response.end

											If request("IDSCat") <> "" Then
												sss = sss & " AND (IDSCat=" & request("IDSCat") & ")"
											End If
											'response.write ("Query SCAT: " & sss)
                                            'response.end                                         													
                                            
                                            If request("keywords1") <> "" Then
												
                                             arrRicerca = Split(Trim(Request("keywords1")), " ")

                                            for i = 0 to ubound(arrRicerca)
                                           
                                             sss = sss & " AND DESCKIT LIKE '%" & arrRicerca(i) & "%' OR "
                                             sss = sss & " NOMEKIT LIKE '%" & arrRicerca(i) & "%' OR"
                                             sss = sss & " Keywords LIKE '%" & arrRicerca(i) & "%'"

                                             ' fare verifica con i>1
                                            next
                                           
                                          End If

                                         If request("keywords2") <> "" Then
												
                                             arrRicerca = Split(Trim(Request("keywords2")), " ")

                                            for i = 0 to ubound(arrRicerca)
                                           
                                             sss = sss & " OR DESCKIT LIKE '%" & arrRicerca(i) & "%' OR "
                                             sss = sss & " NOMEKIT LIKE '%" & arrRicerca(i) & "%' OR"
                                             sss = sss & " Keywords LIKE '%" & arrRicerca(i) & "%'"

                                             ' fare verifica con i>1
                                            next
                                           
                                            End If

                                             If request("keywords3") <> "" Then
												
                                             arrRicerca = Split(Trim(Request("keywords3")), " ")

                                            for i = 0 to ubound(arrRicerca)
                                           
                                             sss = sss & " OR DESCKIT LIKE '%" & arrRicerca(i) & "%' OR "
                                             sss = sss & " NOMEKIT LIKE '%" & arrRicerca(i) & "%' OR"
                                             sss = sss & " Keywords LIKE '%" & arrRicerca(i) & "%'"

                                           
                                            next
                                           
                                         End If
                                          
                                          'response.write ("SQL: " & sss)
										   
                                           
Set rs = dbConn.Execute(sss)
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
                            	<legend><%=response.write (titolorisultatoricerca)%>
                                    <h6>Vai alla MagicBox&nbsp;&nbsp;<a href="sim_magicbox_barcode_start.asp"><img src="images/stateverified2.png" align="center" width="32" height="32" title="<%=response.write (tooltipimg2)%>"></a>
                                </legend></h6>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th><%=response.write (ricercabarcode)%></th>
												<th><%=response.write (ricercanomekit)%></th>
                                                <th><%=response.write (ricercadesckit)%></th>
												<th><%=response.write (ricercaposizioni)%></th>
												<th><%=response.write (ricercaqta)%></th>
												<th><%=response.write (ricercastatokit)%></th>
                                                <th><%=response.write (ricercakeyword)%></th>
												<th><%=response.write (titolo83)%></th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs.EOF
											i = i + 1
                                            %>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
												
                                                <td>
                                            <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("BARCODE") 
                                                    'response.write "Query SQL"
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td> <!--Barcode-->
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs.eof Then
													Response.write rs("NOMEKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td> <!--Nome-->
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("DESCKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td> <!--Descrizione-->
												<td><%
                                                                
                                                            Set rs1 = dbConn.Execute("SELECT * FROM SIM_Posizione WHERE IDPOS = " & rs("POS"))
                                                            If Not rs1.eof Then
													            Response.write rs1("POSIZIONE")
												            Else
													            Response.write "&nbsp;"
												            End If


                                                                'dim strposition
                                                                'strposition = rs("POS")
                                                                
                                                                'select case strposition
                                                                  'case 8 
                                                                  'response.write "Basement"
                                                                  'case else
                                                                %>
                                                        </td> <!--Posizione-->
                                                <td>
                                                <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("QTA")
												Else
													Response.write "&nbsp;"
												End If
												%>
                                                </td> <!--QTA-->
                                                <td><%
                                                                dim strStato
                                                                strStato = rs("IDSTATO")

                                                                select case strStato
                                                                  case 8%>
                                                                    <img src="images/stategood.png" width="32" height="32" title="<%=response.write (iconastatobuono)%>">
  
                                                                  <%case 2%>
                                                                    <img src="images/stateincomplete.png" width="32" height="32" title="<%=response.write (iconastatoincompleto)%>">
                                                                  
                                                                  <%case 3%>
                                                                    <img src="images/statemissing.png" width="32" height="32" title="<%=response.write (iconastatoperso)%>">
                                                                  
                                                                  <%case 4%>
                                                                    <img src="images/statenew.png" width="32" height="32" title="<%=response.write (iconastatonuovo)%>">
                                                                  
                                                                  <%case 5%>
                                                                    <img src="images/statesubstitute.png" width="32" height="32" title="<%=response.write (iconastatosostituito)%>">
                                                                  
                                                                  <%case 6%>
                                                                    <img src="images/stateverified.png" width="32" height="32" title="<%=response.write (iconastatoverificato)%>">
                                                                  
                                                                  <%end select
                                                              %></td> <!--Stato-->
                                                <td>
                                                <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("Keywords")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td> <!--Keywords-->
                                                <td>
                                                <%
                                                
                                                sss2="SELECT A.IDKIT, B.USR FROM SIM_Temp_MagicBox as A INNER JOIN SIM_User as B ON B.ID_USR = A.IDUSER WHERE A.IDKIT = " & rs("IDKIT") & " AND IN_OUT ='IN'"
                                                'WHERE B.ID_USR = " & rs("IDUSER") & " AND 
                                                'Response.write sss2
                                                'response.end
                                                Set rs1 = dbConn.Execute(sss2)
                                                If Not rs1.eof Then
                                                    %> <%response.write rs1("USR") %>(<img src="images/magicboxIN.png" width="16" height="16">)
                                               <%   'response.write rs1("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
                                                %>
                                                </td>
                                                <td>
                                                   <a href="sim_schedakit.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&DESCKIT=<%= rs("DESCKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("IDSTATO") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="<%=response.write (iconascheda)%>"></a><br>
                                                </td> 
                                                <td>
                                                    <a href="sim_temp_magicbox.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&DESCKIT=<%= rs("DESCKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("IDSTATO") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/addmagicbox.png" width="32" height="32" title="<%=response.write (iconaaggiungimb)%>"></a><br>
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
                        <div class="form-actions">
                        	<a href="sim_inventario_ricerca.asp"><img src="images/back.png" width="32" height="32" title="<%=response.write (etichettabottoneindietro)%>"></a>
                          </div>
                        <!-- /block -->
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