<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
  '  response.redirect "hd_todo.asp"
'End If

If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

Dim sss, i , test

codice= request("code")
nrordine= request("nrordine")

response.write nrordine

if request("code")= "bar" then

sss6 = "SELECT COUNT(*) as Totale FROM ORD_Articoli WHERE Barcode = " & request("BARCODE")
			Set rs6 = dbConn.Execute(sss6)
			'response.write sss6
            'response.end
            If rs6("Totale") = 0 Then
                'response.write "Il totale è 0"
		        response.redirect "ord_gestione_articoliIN.asp"
                ' inserire gestione errori per articolo non trovato
            End If
else
sss6 = "SELECT COUNT(*) as Totale FROM ORD_Articoli WHERE Codart = " & request("BARCODE")
			Set rs6 = dbConn.Execute(sss6)
			'response.write sss6
            'response.end
            If rs6("Totale") = 0 Then
                'response.write "Il totale è 0"
		        response.redirect "ord_gestione_articoliIN.asp"
                ' inserire gestione errori per articolo non trovato
            End If
end if

if request("code")= "bar" then

sss =  "SELECT * FROM ORD_Articoli WHERE BARCODE = " & request("BARCODE")
Set rs = dbConn.Execute(sss)

else

sss =  "SELECT * FROM ORD_Articoli WHERE CODART = " & request("BARCODE")
Set rs = dbConn.Execute(sss)
'response.write sss
'response.end
end if

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
    </head>
    <body>
        <!--#include virtual file="include/menu.asp"-->    
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span6" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Ordini da Helen Doron</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form method="post" class="form-horizontal" Action="ord_gestione_articoli_qtamagazzino.asp?codart=<%= rs("Codart") %>&qtaarr=<%= request("qta_arr") %>&NumOrd=<% response.write nrordine %>"> 
                                </div>
                                <table class="table table-condensed">
									<tbody>
                                        <tr>
											<th>Codice Articolo</th>
                                            <th>Nr. Ordine</th>
											<th>Nome Articolo</th>
											<th>Prezzo Articolo</th>
										</tr>
                                        <tr>
										    <td><%= rs("Codart") %></td>
                                            <td><% response.write nrordine %></td>
											<td><%= rs("Nomart") %></td>
											<td>
                                                    <%
                                                    dim Numero
                                                    Numero = rs("Przart")
                                                    Response.write "Euro: " & FormatNumber (Numero,2,,,-1)
                                                    %>
                                            </td>
										</tr>
                                       <td colspan="6">&nbsp;</td>
										<tr>
											<th>Articolo Attivo</th>
											<th>Quantità in Magazzino</th>
											<th>Quantità Minima</th>
										</tr>
                                        
                                        <tr>
											<td><%= rs("Attart") %></td>
											<td><%= rs("Qtadisp") %></td>
											<td><%= rs("Qtamin") %></td>
										</tr>
									<td colspan="6">&nbsp;</td>
                                    <tr>    
                                        <!-- mettere condizione di If che visualizza la parte sotto dopo aver inserito il barcode-->
                                        	<th>Quantità arrivata:</th>
											<th>Quantità Minima:</th>
											<th>&nbsp;</th>
										</tr>
                                <tr>
										    <td>
                                                <div class="controls">
                                          	    <input name="qta_arr" class="input-small focused" id="focusedInput" type="number" min="0" max="999" maxlength="3" style="width:80px; height: 20px">
                                                </div>
                                            </td>
											<td>
                                                <div class="controls">
                                                    <input name="qta_min" class="input-small focused" id="focusedInput" type="number" min="0" max="999" maxlength="3" value="<%= rs("Qtamin") %>"style="width:80px; height: 20px">
                                                </div>
                                            </td>
                                            <td>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-success" data-original-title="Cerca">Aggiorna Magazzino</button>&nbsp;
                                                <button type="reset" class="btn btn-default">Annulla</button>&nbsp;
                                             </div>
                                             </form>
                                            </td>
								</tr>
                            </tbody>
								</table>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                        <!-- /block -->
                    </div>
                </div><!-- nella parte laterale si potrebbe mettere Elenco dei movimenti dell'articolo-->
                <div id="pdf"><br>
                <object width="700" height="500" type="application/pdf" data="public/ordineHD_.pdf?#zoom=85&scrollbar=1&toolbar=1&navpanes=0"
                     id="pdf_content">
                     <p>
               Qui inserisci i commenti se il file per qualche motivo non si vede .</p>
                  </object>
                </div>
            </div>
            <hr>
		    <!--#include virtual file="include/piede.asp"-->
		    </div>
        <!--/.fluid-container-->
        <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

        <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>

        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
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
Set dbConn = Nothing
%>