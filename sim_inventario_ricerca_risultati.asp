<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
'   response.redirect "hd_todo.asp"
'End If

Dim sss, i

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
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
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
                            	<legend>Risultati della Ricerca</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Barcode</th>
												<th>Nome</th>
                                                <th>Descrizione</th>
												<th>Posizione</th>
												<th>Quantità</th>
												<th>Stato</th>
                                                <th>Keywords</th>
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
												<td>
                                                <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("POS")
												Else
													Response.write "&nbsp;"
												End If
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
                                                <td>
                                                <%
												Set rs4 = dbConn.Execute("SELECT Stato FROM SIM_Stato WHERE IDStato= " & rs("IDStato"))
                                                If Not rs4.eof Then
													Response.write rs4("Stato")
												Else
													Response.write "&nbsp;"
												End If
												%>
                                                </td> <!--Stato-->
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
                                                   <a href="sim_schedakit.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&DESCKIT=<%= rs("DESCKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("IDSTATO") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="Scheda Kit"></a><br>
                                                </td> 
                                                <td>
                                                    <a href="sim_temp_magicbox.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&DESCKIT=<%= rs("DESCKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("IDSTATO") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/addmagicbox.png" width="32" height="32" title="Add to Magic Kit"></a><br>
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
                        	<button onClick="javascript: history.go(-1)" class="btn btn-primary tooltip-top" data-original-title="Torna alla Ricerca"><i class="icon-backward icon-white"></i> Indietro</button>
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