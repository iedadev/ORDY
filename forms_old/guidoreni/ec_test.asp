<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!-- #include virtual file = "include/hex_sha1_js.asp" -->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

Dim sss, i, alias, importo, divisa, codTrans, mail, url_back, languageId, urlpost, mac, url


codTransh = "codTrans=529878-000001"
divisah = "divisa=EUR"
importoh = "importo=1"
chiaveh="esempiodicalcolomac"

codTrans = "529878-000001"
divisa = "EUR"
importo = "1"
alias = "payment_testm_urlmac"
mail = "erik.tagliabue@gmail.com"
url_back = "http://www.motherwords.biz/ec_cancel.asp"
languageId = "ITA"
urlpost = "http://www.motherwords.biz/ec_ok.asp"
url = "http://www.motherwords.biz/ec_ok.asp"


mac = hex_sha1(codTransh & divisah & importoh & chiaveh)

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
        <script type="text/javascript">
        <!--
        function controllo()
        {
		if (document.P2.Sigla.value == "")
			{
			alert("Dato Obbligatorio!");
			document.P2.Sigla.style.backgroundColor = 'Orange';
			document.P2.Sigla.focus();
			return false;
			}
		if (document.P2.Descrizione.value == "")
			{
			alert("Dato Obbligatorio!");
			document.P2.Descrizione.style.backgroundColor = 'Orange';
			document.P2.Descrizione.focus();
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
                <div class="span12" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend>Nuova Sede</legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="https://ecommerce.keyclient.it/ecomm/ecomm/DispatcherServlet" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                      <input type="hidden" value="<%= alias %>" name="alias">
                                      <input type="hidden" value="<%= importo %>" name="importo">
                                      <input type="hidden" value="<%= divisa %>" name="divisa">
                                      <input type="hidden" value="<%= codTrans %>" name="codTrans">
                                      <input type="hidden" value="<%= mail %>" name="mail">
                                      <input type="hidden" value="<%= languageId %>" name="languageId">
                                      <input type="hidden" value="<%= urlpost %>" name="urlpost">
                                      <input type="hidden" value="<%= url_back %>" name="url_back">
                                      <input type="hidden" value="<%= mac %>" name="mac">
                                      <input type="hidden" value="<%= url %>" name="url">
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Denominazione: </label>
                                          <div class="controls">
                                            <input name="Sede" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Salva la Scheda">Salva</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
		                        	<button onClick="javascript: history.go(-1)" class="btn btn-primary tooltip-top" data-original-title="Torna alla Ricerca"><i class="icon-backward icon-white"></i> Indietro</button>
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
</div>
<%
Set dbconn = nothing
Set rs = nothing
%>