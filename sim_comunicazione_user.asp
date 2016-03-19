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
      <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.data_com.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.data_com.style.backgroundColor = 'Yellow';
			document.P2.data_com.focus();
			return false;
			}
		if (document.P2.oggetto_com.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.oggetto_com.style.backgroundColor = 'Yellow';
			document.P2.oggetto_com.focus();
			return false;
			}
		if (document.P2.desc_com.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.desc_com.style.backgroundColor = 'Yellow';
			document.P2.desc_com.focus();
			return false;
			}
		if (document.P2.sendto_com.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.sendto_com.style.backgroundColor = 'Yellow';
			document.P2.sendto_com.focus();
			return false;
			}
        }
		//-->
		</script> <!--funzione di controllo-->
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
                            	<legend><%=response.write (titolo97)%></legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form name="P2" method="post" Action="sim_comunicazione_invio.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (titolotabelladata)%>: </label>
                                          <div class="controls">
                                            <input type="text" value="<%= Date() %>" class="input-large" id="date01" name="data_com"> </div>
                                          </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (titolo96)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="oggetto_com">
                                              <option value=""></option>
                                              <%
                                              'Set rs0 = dbConn.Execute("SELECT DISTINCT IDCat FROM SIM_Kit WHERE IDCat IS NOT NULL ORDER BY IDCat")
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Oggetti ORDER BY Oggetto")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("ID_Oggetto") & "'>" & rs0("Oggetto") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (titolo94)%>: </label>
                                          <div class="controls">
                                          <textarea name="desc_com" style="width: 300px; height: 100px"></textarea>
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (titolo95)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="sendto_com">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT * FROM SIM_User WHERE RUOLO = 'A' ORDER BY USR")
                                              While Not rs1.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs1("ID_USR") & "'>" & rs1("USR") & "</option>"
		                                          'End If
                                              rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (testobottoneinvia)%>"><%=response.write (testobottoneinvia)%></button>&nbsp;
                                          <button type="reset" class="btn"><%=response.write (testobottoneannulla)%></button>&nbsp;
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
                </div><!--#include virtual file="sim_comunicazione_mailin.asp"--><!--#include virtual file="sim_comunicazione_mailout.asp"-->
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