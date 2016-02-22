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
                <div class="span5" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Ricerca Materiale Magicbox</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form method="post" Action="sim_inventario_ricerca_risultati.asp" class="form-horizontal">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Macrocategory: </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDMcat">
                                          <option value=""></option>
                                              <%
                                              'Set rs0 = dbConn.Execute("SELECT DISTINCT IDMcat FROM SIM_Kit WHERE IDMcat IS NOT NULL ORDER BY IDMcat")
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Macrocategorie ORDER BY Macrocategoria")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Macrocategorie WHERE IDMcat = " & rs0("IDMcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDMcat") & "'>" & rs0("Macrocategoria") & "</option>"
	                                              'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Category: </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDCat">
                                              <option value=""></option>
                                              <%
                                              'Set rs0 = dbConn.Execute("SELECT DISTINCT IDCat FROM SIM_Kit WHERE IDCat IS NOT NULL ORDER BY IDCat")
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Categorie ORDER BY Categoria")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDCat") & "'>" & rs0("Categoria") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Subcategory: </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDScat">
                                              <option value=""></option>
                                              <%
                                              'Set rs0 = dbConn.Execute("SELECT DISTINCT IDCat FROM SIM_Kit WHERE IDCat IS NOT NULL ORDER BY IDCat")
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_SottoCategorie ORDER BY Sottocategoria")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDSCat") & "'>" & rs0("SottoCategoria") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Keyword: </label>
                                          <div class="controls">
                                          	<input name="keywords1" class="input-small focused" id="focusedInput" type="text" style="width:200px;">
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Keyword: </label>
                                          <div class="controls">
                                          	<input name="keywords2" class="input-small focused" id="focusedInput" type="text" style="width:200px;">
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Keyword: </label>
                                          <div class="controls">
                                          	<input name="keywords3" class="input-small focused" id="focusedInput" type="text" style="width:200px;">
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Avvia la Ricerca">Search</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                        <!-- /block -->
                    </div>
                </div><!--#include virtual file="sim_magicbox_lateral.asp"-->
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