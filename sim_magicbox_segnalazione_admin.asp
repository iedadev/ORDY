<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, i

i = 1

sss = "SELECT * FROM SIM_Kit_Segnalazioni WHERE 1 = 1 AND VERIFICATO = 1"
sss = sss & " ORDER BY Datain"

session("sss") = sss

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
                            	<legend><%=response.write (titolosegnalazioniadmin)%></legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th><%=response.write (titolotabellabarcode)%></th>
                                                <th><%=response.write (titolotabellauser)%></th>
                                                <th><%=response.write (titolotabellanome)%></th>
												<th><%=response.write (titolotabellanote)%></th>
                                                <th><%=response.write (titolotabelladata)%></th>
												<th>&nbsp;</th
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
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												Set rs1 = dbConn.Execute("SELECT USR FROM SIM_KIT_SEGNALAZIONI AS K, SIM_USER AS U WHERE K.ID_USR = U.ID_USR AND K.ID_USR = " & rs("ID_USR"))
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("USR")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												Set rs2 = dbConn.Execute("SELECT NOMEKIT FROM SIM_KIT AS A, SIM_KIT_SEGNALAZIONI AS B WHERE A.IDKIT= B.ID_KIT AND B.ID_KIT = " & rs("ID_KIT"))
												If Not rs2.eof Then
													Response.write rs2("NOMEKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("SEGNALAZIONE")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("DATAIN")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                   <a href="sim_magicbox_segnalazione_modifica.asp?IDKIT=<%= rs("ID_KIT") %>&BARCODE=<%= rs("BARCODE") %>&VALIDARE=1&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="<%=response.write (iconascheda)%>"></a><br>
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
                        	<button onClick="javascript: history.go(-1)" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottoneindietro)%>"><i class="icon-backward icon-white"></i> <%=response.write (testobottoneindietro)%></button>
                        	&nbsp;&nbsp;<a href="hd_reports_storico_demo_esporta.asp"><button class="btn btn-success tooltip-top" data-original-title="<%=response.write (etichettabottoneesporta)%>"><i class="icon-download icon-white"></i> <%=response.write (testobottoneesporta)%></button></a>
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