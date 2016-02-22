<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

<%
If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

iduser=session("id_usr")

If session("usr")= "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
    'response.redirect "hd_todo.asp"
'End If

Dim sss, i

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
                            <div class="navbar navbar-inner block-header"><legend>Questa era la tua ultima MagicBox</legend>
                                Benvenuto/a <%= session("usr") %> & <%= session("id_usr") %> l'ultima volta hai preso i seguenti oggetti.
                                Seleziona il pulsante <button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i> Aggiungi</button> a quelli che ti servono ancora <br><br>
                                I seguenti kit sono stati memorizzati nel database, RICORDATI di effettuare lo scarico del materiale preso al termine della lezione
                                 </div>
                            <div class="block-content collapse in">
                              <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Barcode</th>
												<th>Categoria</th>
                                                <th>Sottocategoria</th>
                                                <th>Nome</th>
												<th>Posizione</th>
												<th>Quantità</th>
												<th>Stato</th>
												<th>Descrizione</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
												i = 1
												
                                                sss = "SELECT * FROM SIM_Kit AS K, SIM_StoricoInventario AS SINV, SIM_User AS U , "
                                                sss = sss & " SIM_categorie as CAT, SIM_Sottocategorie AS SCAT, SIM_STATO AS STA "
                                                sss = sss & " WHERE K.BARCODE=SINV.BARCODE AND SINV.ID_USR = U.ID_Usr "
                                                sss = sss & " AND CAT.IDCat = SCAT.IDCat AND SCAT.IDSCAT=K.IDSCAT AND K.IDSTATO=STA.IDSTATO AND SINV.ID_USR=" & iduser
                                                
                                                                                              
                                                response.write iduser
                                                response.write sss
                                                                                                
                                                Set rs = dbConn.Execute(sss)

													While Not rs.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
														<td><%= rs("K.BARCODE") %></td>
                                                        <td><%= rs("CATEGORIA") %></td>
														<td><%= rs("SOTTOCATEGORIA") %></td>
                                                        <td><%= rs("NOMEKIT") %></td>
														<td><%= rs("POS") %></td>
														<td><%= rs("QTA") %></td>
														<td><%= rs("STATO") %></td>
                                                        <td><%= rs("DESCKIT") %></td>
														<td>
                                                            <a href="sim_temp_magicbox.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("K.BARCODE") %>&CATEGORIA=<%= rs("CATEGORIA") %>&SOTTOCATEGORIA=<%= rs("SOTTOCATEGORIA") %>&NOMEKIT=<%= rs("NOMEKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("STATO") %>&TipoQuery=<%= request("TipoQuery") %>"><button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i> Aggiungi</button></a>
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
                        	&nbsp;&nbsp;<a href="hd_reports_recall_esporta.asp"><button class="btn btn-success tooltip-top" data-original-title="Esporta la lista in formato Excel"><i class="icon-download icon-white"></i> Esporta</button></a>
                            &nbsp;&nbsp;<a href="sim_inventario_ricerca.asp"><button class="btn btn-success tooltip-top" data-original-title="Esporta la lista in formato Excel"><i class="icon-download icon-white"></i> Cerca Altri Oggetti</button></a>
                        </div>
                    </div>
                </div> 
            <!--#include virtual file="sim_magicbox.asp"--> 
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