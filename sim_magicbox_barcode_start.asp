<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
  '  response.redirect "hd_todo.asp"
'End If

'Set dbConn = CreateObject("ADODB.Connection")
'dbConn.Open Application("Connection1_ConnectionString")
 'response.write "E' ZERO"
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
        <!--[if lte IE 8]>
        	<script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script>
        <![endif]-->
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
                <div class="span6" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Manage your Magicbox</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form method="post" Action="sim_magicbox_barcode.asp" class="form-horizontal">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Barcode: </label>
                                          <div class="controls">
                                          	<input name="barcode" class="input-small focused" id="focusedInput" type="text" style="width:300px;">
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <%'response.write request("BARCODE")%>
                                            <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Avvia la Ricerca">Cerca</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                                <table class="table table-condensed">
									<tbody>
                                        <tr>
											<th>Macrocategoria</th>
											<th>Categoria</th>
											<th>Sottocategoria</th>
                                           <!-- <th rowspan="4"><img src="images/icone/unnamed.jpg" width="100" height="75"></th> --> <!--fotografia kit-->
										</tr>
                                        <tr>
										    <td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
                                       <td colspan="4">&nbsp;</td>
										<tr>
											<th>Nome Kit</th>
											<th>Barcode</th>
											<th>Data Acquisto</th>
										</tr>
                                        <tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
                                        <td colspan="4">&nbsp;</td>
                                        <tr>
											<th>Stato e Posizione</th>
                                            <th>Quantità</th>
											<%If session("ruolo") = "A" Then %>
                                            <th>Prezzo</th>
                                             <%End If%>
										</tr>
                                        <tr>
                                            <td>&nbsp;</td>
											<td>&nbsp;</td>
                                            <%If session("ruolo") = "A" Then %>
                                            <td>&nbsp;</td>
                                            <%End If%>
                                        </tr>
                                        <td colspan="4">&nbsp;</td>
										<tr>
											<td colspan="2"><strong>Descrizione:</strong>&nbsp;</td>
										    <td colspan="2"><strong>Keywords:</strong>&nbsp;</td>
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
                </div>
                <!--#include virtual file="sim_magicbox_lateral.asp"-->
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