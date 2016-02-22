<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, i

i = 1

sss = "SELECT * FROM SIM_Kit WHERE 1 = 1 AND ATTIVO = 1"
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
                            	<legend>Elenco Kit &nbsp;&nbsp;
                        	    <button onClick="javascript: history.go(-1)" class="btn btn-primary tooltip-top" data-original-title="Torna alla Ricerca"><i class="icon-backward icon-white"></i> Indietro</button>
                        	    &nbsp;&nbsp;<a href="hd_reports_storico_demo_esporta.asp"><button class="btn btn-success tooltip-top" data-original-title="Esporta la lista in formato Excel"><i class="icon-download icon-white"></i> Esporta</button></a>
                                </legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Barcode</th>
                                                <th>Macrocategoria</th>
												<th>Categoria</th>
												<th>Sottocategoria</th>
												<th>Nome</th>
                                                <th>Descrizione</th>
												<!--<th>Posizione</th>
												<th>Quantità</th>
												<th>Keywords</th>-->
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
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												Set rs1 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Macrocategorie AS CAT WHERE K.IDMCAT = CAT.IDMCAT AND K.IDMCat = " & rs("IDMcat"))
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("MacroCategoria")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												Set rs1 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Categorie AS CAT WHERE K.IDCAT = CAT.IDCAT AND K.IDCat = " & rs("IDcat"))
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Categoria")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
												<td>
                                                <%
												Set rs2 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Sottocategorie AS SCAT WHERE K.IDSCAT = SCAT.IDSCAT AND K.IDScat = " & rs("IDScat"))
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Sottocategoria")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs.eof Then
													Response.write rs("NOMEKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDSCat = " & rs("IDSCat"))
												If Not rs.eof Then
													Response.write rs("DESCKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                   <a href="sim_kit_gestione.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&CATEGORIA=<%= rs1("Categoria") %>&SOTTOCATEGORIA=<%= rs2("Sottocategoria") %>&NOMEKIT=<%= rs("NOMEKIT") %>&DESCKIT=<%= rs("DESCKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("IDSTATO") %>&KEYWORDS=<%= rs("KEYWORDS") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" title="Scheda Kit"></a><br>
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
                        	&nbsp;&nbsp;<a href="hd_reports_storico_demo_esporta.asp"><button class="btn btn-success tooltip-top" data-original-title="Esporta la lista in formato Excel"><i class="icon-download icon-white"></i> Esporta</button></a>
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