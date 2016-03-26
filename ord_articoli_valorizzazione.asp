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
        <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.ord_codart.value == "")
			{
			alert("Attenzione!.Dato Obbligatorio");
			document.P2.ord_codart.style.backgroundColor = 'Yellow';
			document.P2.ord_codart.focus();
			return false;
			}
        if (document.P2.ord_nomart.value == "")
			{
			alert("Attenzione!.Dato Obbligatorio");
			document.P2.ord_nomart.style.backgroundColor = 'Yellow';
			document.P2.ord_nomart.focus();
			return false;
			}
        if (document.P2.ord_przart.value == "")
			{
			alert("Attenzione!.Dato Obbligatorio");
			document.P2.ord_przart.style.backgroundColor = 'Yellow';
			document.P2.ord_przart.focus();
			return false;
			}
		}
		//-->
		</script>
    </head>
    <body>
	    <!--#include virtual file="include/menu.asp"-->
       <div class="container-fluid">
                        <div class="row-fluid">
             <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="ord_controlpanelmagazzino.asp"-->    
             <% End If %>
                 <div class="span6" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend>Valorizzazione Giacenze Magazzino</legend><h6><small>Crea un elenco delle giacenze di magazzino valorizzato al costo</small></h6>
                                </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="ord_articoli_valorizzazione_totale.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                           <div class="control-group">
                                          <label class="control-label" for="focusedInput">Ultima Valorizzazione: </label>
                                        </div>
                                           <div class="control-group">
                                          <label class="control-label" for="focusedInput">Data Elaborazione: </label>
                                          <div class="controls">
                                              <label class="radio-inline"><input type="radio" name="optradio">&nbsp;Data Odierna</label>
                                              <label class="radio-inline"><input type="radio" name="optradio">&nbsp;Inserisci Data</label> <input name="ord_codart" class="input-large focused" id="focusedInput" type="text">
                                            </div>
                                        </div>
                                           <div class="control-group">
                                                <label class="control-label" for="focusedInput">Valorizzazione: </label>  
                                           <div class="controls">
                                           <i>Totale in Euro per Numero di articoli</i>&nbsp;&nbsp;<button type="button" class="btn btn-danger">Dettaglio</button>
                                               <!--nel dettaglio verranno visualizzati i singoli articoli con la qta ed il relativo valore-->
                                               <!--SELECT Sum(ORD_Articoli.Przart) AS SommaDiPrzart FROM ORD_Articoli -->
                                               <!--SELECT Count (*) as Totale FROM ORD_Articoli -->
                                            </div>
                                          </div>
                                        <div class="form-actions">
                                           <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                           <button type="button" class="btn btn-info">Storico</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
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

    </body>
</html>
<%
Set dbconn = nothing
Set rs = nothing
Set rs1 = nothing
Set rs2 = nothing
Set rs3 = nothing
Set rs4 = nothing
Set rs5 = nothing
Set rs6 = nothing
%>