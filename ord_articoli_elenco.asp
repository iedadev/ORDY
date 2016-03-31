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

sss = "SELECT * FROM ORD_Articoli WHERE ATTART ='Y' AND IDCodmag=1 AND 1 = 1 "
'sss = sss & " ORDER BY Datain"

session("sss") = sss

Set rs2 = dbConn.Execute(sss)

'response.write rs2("Attart")
'response.write sss


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
                        	        <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro"></a>
                                    <a href="delete.asp"<img src="images/delete.png" width="32" height="32" title="Elimina">Elimina Articolo</a>
                                </legend>
                            </div>
                            <div class="block-content collapse in">
                                 <!--#include virtual file="ord_controlpanelmagazzino.asp"-->
                                <div class="span8">
  									
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Codice</th>
                                                <th>Nome</th>
												<th>Prz</th>
												<th>Qta Disp</th>
												<th>Qta Min</th>
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
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Macrocategorie AS CAT WHERE K.IDMCAT = CAT.IDMCAT AND K.IDMCat = " & rs("IDMcat"))
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
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Categorie AS CAT WHERE K.IDCAT = CAT.IDCAT AND K.IDCat = " & rs("IDcat"))
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
												'Set rs2 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Sottocategorie AS SCAT WHERE K.IDSCAT = SCAT.IDSCAT AND K.IDScat = " & rs("IDScat"))
												If Not rs2.eof Then
													'Response.write sss
                                                    dim Numero
                                                    Numero = rs2("Przart")
                                                    Response.write "Euro: " & FormatNumber (Numero,2,,,-1)
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs2.eof Then
													Response.write rs2("Qtadisp")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs2.eof Then
													Response.write rs2("Qtamin")
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