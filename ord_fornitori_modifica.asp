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

Dim sss1, i

sss1 =  "SELECT * FROM ORD_Fornitori WHERE IDfor= " & request("IDfor")
'response.write sss
Set rs1 = dbConn.Execute(sss1)

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
		if (document.P2.ord_nomfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_nomfor.style.backgroundColor = 'Orange';
			document.P2.ord_nomfor.focus();
			return false;
			}
        if (document.P2.ord_indfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_indfor.style.backgroundColor = 'Orange';
			document.P2.ord_indfor.focus();
			return false;
			}
        if (document.P2.ord_emafor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_emafor.style.backgroundColor = 'Orange';
			document.P2.ord_emafor.focus();
			return false;
			}
        if (document.P2.ord_telfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_telfor.style.backgroundColor = 'Orange';
			document.P2.ord_telfor.focus();
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
	                         <!--#include virtual file="ord_controlpanelanagrafiche.asp"-->
                    <% End If %>
                   <div class="span6" id="content">
                    <div class="row-fluid">
                       <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend>Modifica Fornitori</legend></div>
                            <div class="block-content collapse in">
                                <div class="span6">
                                     <form name="P2" method="post" Action="ord_fornitori_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="ord_idfor"  value="<%= rs1("IDfor") %>">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Nome Fornitore: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("Nomfor") %>" name="ord_nomfor" Class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                           <div class="control-group">
                                          <label class="control-label" for="focusedInput">Indirizzo Fornitore:</label>
                                          <div class="controls">
                                            <input value="<%= rs1("Indfor") %>" name="ord_indfor" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Email Fornitore: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("emafor") %>" name="ord_emafor" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Telefono Fornitore: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("telfor") %>" name="ord_telfor" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Salva Modifiche">Salva</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
		                        	<a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro"></a>
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
<%
Set dbconn = nothing
Set rs = nothing
%>