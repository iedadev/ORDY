<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="language.asp"-->
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
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
              <!--#include virtual file="include/menu.asp"--> 

         <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div align="center" class="block">
                            <div  class="navbar navbar-inner block-header">
                            	<legend>mORDYan - Gestionale Magazzino</legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12" align="center">

                                    <table align="center" border="0">
                                        <td align="center"><a href="ord_anagrafiche.asp"> <img src="images/anagrafiche.png" width="128" height="128" title="Gestione Anagrafiche"></a></td>
                                        <td align="center"><a href="ord_magazzino.asp"><img src="images/magazzino.png" width="128" height="128" title="Gestione Magazzino"></a></td>
                                         <% If session("ruolo") = "A" Then %>
                                        <td align="center"><a href="ord_comunicazione.asp"><img src="images/segnalazionimagicbox2.png" width="200" height="200" title="Gestione Comunicazioni"></a></td>
                                         <%Else%>
                                         <td align="center"><img src="images/comunication2.png" width="200" height="200" title="Gestione Comunicazioni"></td>
                                         <% End If %>
                                      </tr>
                                      <tr align="center">
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">Anagrafiche</font></td>
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">Magazzino</font></td>
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">Comunicazioni</font></td>
                                      </tr>
                                       <tr align="center">
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">&nbsp;</font></td>
                                        <td><b><font face="Georgia, Times New Roman, Times, serif">&nbsp;</font></td>
                                       </tr>
                                      </table>
                                </div>
                            </div>
                        </div>
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
