<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'response.end

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
            <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="include/controlpanel.asp"-->
            <%Else%>
                <!--#include virtual file="sim_lastprops.asp"-->       
            <% End If %>
                <div class="span9" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div align="center" class="block">
                            <div  class="navbar navbar-inner block-header">
                            	<legend>Benvenuto in SIM (School Inventory Management)</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12" align="center">
                                     <a href="sim_inventario_ricerca.asp"> <img src="images/ricercamagicbox.png" width="200" height="100" alt="Ricerca"></a>
                                     <a href="sim_magicbox_barcode_start.asp"><img src="images/magicbox.png" width="200" height="100" alt="MagicBox"></a>
                                     <% If session("ruolo") = "A" Then %>
                                     <a href="sim_magicbox_segnalazione_admin.asp"><img src="images/segnalazionimagicbox.png" width="200" height="100" title="Segnalazioni""></a>
                                     <%Else%>
                                     <a href="sim_comunication_user.asp"><img src="images/comunication.png" width="200" height="100" title="Segnalazioni"></a>
                                     <% End If %>
                                     <a href="sim_kit_creauser.asp"><img src="images/nuovokitmagicbox.png" width="200" height="100" alt="Segnala il tuo Kit"></a>
                                </div>
                            </div>
                        </div>
                       <!-- <div align="left" class="block">
                            <div  class="navbar navbar-inner block-header">
                            	<legend>Comunication</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12" align="left">
                                     Inserire le ultime comunicazioni agli utenti
                                </div>-->
                            </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                        <!-- /block -->
                    </div>
                    
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
