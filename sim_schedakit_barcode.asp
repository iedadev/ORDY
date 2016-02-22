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

sss =  "SELECT * FROM SIM_Kit WHERE IDKit = " & request("IDKit")
Set rs = dbConn.Execute(sss)

Set rs1 = dbConn.Execute("SELECT Posizione FROM SIM_Posizione WHERE IDPOS= " & rs("POS"))
Set rs2 = dbConn.Execute("SELECT Stato FROM SIM_Stato WHERE IDStato= " & rs("IDStato"))
Set rs3 = dbConn.Execute("SELECT Macrocategoria FROM SIM_Macrocategorie WHERE IDMcat = " & rs("IDMcat"))
Set rs4 = dbConn.Execute("SELECT Categoria FROM SIM_Categorie WHERE IDCat = " & rs("IDCat"))
Set rs5 = dbConn.Execute("SELECT Sottocategoria FROM SIM_Sottocategorie WHERE IDScat = " & rs("IDScat"))
'response.write sss
'response.end

%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--#include virtual file="include/title.asp"-->
		<!-- Bootstrap -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
							<legend>Scheda Kit: <%= rs("Nomekit") & " (Barcode: " & rs("Barcode") & ")" %></legend>
						</div>
						<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="sim_kit_aggiungi.asp"><button class="btn btn-mini btn-success tooltip-top" data-original-title="Crea una nuova scheda Kit"><i class="icon-plus icon-white"></i> Nuova Scheda Kit</button></a>
						&nbsp;&nbsp;<a href="studente_modifica.asp?ID_Studente=<%= rs("Barcode") %>"><button class="btn btn-mini btn-info tooltip-top" data-original-title="Modifica Scheda Kit"><i class="icon-pencil icon-white"></i> Modifica Scheda Kit</button></a>
						&nbsp;&nbsp;<a href="sim_kit_elimina_conferma.asp?IDKit=<%= rs("IDKit") %>"><button class="btn btn-danger btn-mini tooltip-top" data-original-title="Elimina Scheda Kit"><i class="icon-plus icon-white"></i> Elimina Scheda Kit</button></a>
						<div class="block-content collapse in">
							<div class="span12">
								<table class="table table-condensed">
									<tbody>
                                        <tr>
											<th>Macrocategoria</th>
											<th>Categoria</th>
											<th>Sottocategoria</th>
                                           <!-- <th rowspan="4"><img src="images/icone/unnamed.jpg" width="100" height="75"></th> --> <!--fotografia kit-->
										</tr>
                                        <tr>
											<td><%= rs3("Macrocategoria") %>&nbsp;</td>
											<td><%= rs4("Categoria") %>&nbsp;</td>
											<td><%= rs5("Sottocategoria") %>&nbsp;</td>
										</tr>
                                       <td colspan="4">&nbsp;</td>
										<tr>
											<th>Nome Kit</th>
											<th>Barcode</th>
											<th>Data Acquisto</th>
										</tr>
                                        <tr>
											<td><%= rs("NomeKit") %>&nbsp;</td>
											<td><%= rs("Barcode") %>&nbsp;</td>
											<td><%= rs("Datain") %>&nbsp;</td>
										</tr>
                                        <td colspan="4">&nbsp;</td>
                                        <tr>
											<th>Stato e Posizione</th>
                                            <th>Quantità</th>
											<th>Prezzo</th>
										</tr>
                                        <tr>
                                            <td><%= rs2("Stato") %>&nbsp;-&nbsp;<%= rs1("Posizione") %></td>
											<td><%= rs("Qta") %>&nbsp;</td>
                                            <td><%= rs("Prz") %>&nbsp;</td>
                                        </tr>
                                        <td colspan="4">&nbsp;</td>
										<tr>
											<td colspan="2"><strong>Descrizione:</strong>&nbsp;<%= rs("Desckit") %></td>
										    <td colspan="2"><strong>Keywords:</strong>&nbsp;<%= rs("Keywords") & "," & rs("Key2") & "," & rs("Key3") & "," & rs("Key4") & "," & rs("Key5") & "," & rs("Key6") & ")" %> </td>
										</tr>
									</tbody>
								</table>
								</div>
							</div>
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
Set dbconn = nothing
Set rs = nothing
Set rs2 = nothing
Set rs3 = nothing
Set rs4 = nothing
Set rs5 = nothing
Set rs6 = nothing
Set rs1 = nothing
Set rs2 = nothing
Set rs3 = nothing
Set rs4 = nothing
Set rs5 = nothing
%>