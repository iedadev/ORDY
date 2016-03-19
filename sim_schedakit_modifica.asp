<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "hd_todo.asp"
End If

Dim sss, i

sss =  "SELECT * FROM SIM_KIT WHERE IDKIT = " & request("IDKit")
Set rs = dbConn.Execute(sss)

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
		if ((document.P2.Studente_Cognome.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Studente_Cognome.style.backgroundColor = 'Orange';
			document.P2.Studente_Cognome.focus();
			return false;
			}
		if ((document.P2.Studente_Nome.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Studente_Nome.style.backgroundColor = 'Orange';
			document.P2.Studente_Nome.focus();
			return false;
			}
		if ((document.P2.Studente_Data_Nascita.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio! Inserire nel formato GG/MM/AAAA");
			document.P2.Studente_Data_Nascita.style.backgroundColor = 'Orange';
			document.P2.Studente_Data_Nascita.focus();
			return false;
			}
		if ((document.P2.Genitore_Ragionesociale.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Genitore_Ragionesociale.style.backgroundColor = 'Orange';
			document.P2.Genitore_Ragionesociale.focus();
			return false;
			}
		if ((document.P2.Genitore_CF.value == "") && (document.P2.Genitore_PIVA.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Inserire almeno il Codice Fiscale o la Partita IVA");
			document.P2.Genitore_CF.style.backgroundColor = 'Orange';
			document.P2.Genitore_PIVA.style.backgroundColor = 'Orange';
			return false;
			}
		if ((document.P2.Genitore_Indirizzo.value == "")  && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Genitore_Indirizzo.style.backgroundColor = 'Orange';
			document.P2.Genitore_Indirizzo.focus();
			return false;
			}
		if ((document.P2.Genitore_Citta.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Genitore_Citta.style.backgroundColor = 'Orange';
			document.P2.Genitore_Citta.focus();
			return false;
			}
		if ((document.P2.Genitore_Telefono.value == "") && (document.P2.Genitore_Cellulare.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Inserire almeno un recapito telefonico");
			document.P2.Genitore_Telefono.style.backgroundColor = 'Orange';
			document.P2.Genitore_Cellulare.style.backgroundColor = 'Orange';
			return false;
			}
		if ((document.P2.Genitore_Email.value == "") && (document.P2.Attivo.value == "SI"))
			{
			alert("Dato Obbligatorio!");
			document.P2.Genitore_Email.style.backgroundColor = 'Orange';
			document.P2.Genitore_Email.focus();
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
                            <div class="navbar navbar-inner block-header"><legend>Modifica Scheda Kit</legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="studente_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="ID_Studente" value= "<%= request("IDKit") %>">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Origine: </label>
                                          <div class="controls"><%= rs("IdKit") %></div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Attivo: </label>
                                          <div class="controls">
                                          <select id="selectError" name="Attivo">
                                          	<% If rs("Attivo") = "SI" Then %>
                                          		<option value="SI">SI</option>
                                          		<option value="NO">NO</option>
                                          	<% Else %>
                                          		<option value="NO">NO</option>
                                          		<option value="SI">SI</option>
                                         	<% End If %>
                                          </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Studente: </label>
                                          <div class="controls">
                                          	<% If IsNull(rs("Studente_Cognome")) = True Or Len(Trim(rs("Studente_Cognome"))) = 0 Then %>
	                                            <input name="Studente_Cognome" class="input-xlarge focused" id="inputError" type="text" placeholder="Cognome">
	                                        <% Else %>
	                                            <input name="Studente_Cognome" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Studente_Cognome") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Studente_Nome")) = True Or Len(Trim(rs("Studente_Nome"))) = 0 Then %>
	                                            <input name="Studente_Nome" class="input-xlarge focused" id="inputError" type="text" placeholder="Nome">
	                                        <% Else %>
	                                            <input name="Studente_Nome" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Studente_Nome") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Studente_Data_Nascita")) = True Or Len(Trim(rs("Studente_Data_Nascita"))) = 0 Then %>
	                                            <input name="Studente_Data_Nascita" class="input-xlarge focused" id="inputError" type="text" placeholder="Data di Nascita: GG/MM/AAAA">
	                                        <% Else %>
	                                            <input name="Studente_Data_Nascita" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Studente_Data_Nascita") %>">
	                                        <% End If %>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Genitore: </label>
                                          <div class="controls">
                                          	<% If IsNull(rs("Genitore_Ragionesociale")) = True Or Len(Trim(rs("Genitore_Ragionesociale"))) = 0 Then %>
	                                            <input name="Genitore_Ragionesociale" class="input-xlarge focused" id="inputError" type="text" placeholder="Cognome e Nome / Ragione Sociale">
	                                        <% Else %>
	                                            <input name="Genitore_Ragionesociale" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Ragionesociale") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_CF")) = True Or Len(Trim(rs("Genitore_CF"))) = 0 Then %>
	                                            <input name="Genitore_CF" class="input-xlarge focused" id="inputError" type="text" placeholder="Codice Fiscale">
	                                        <% Else %>
	                                            <input name="Genitore_CF" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_CF") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_PIVA")) = True Or Len(Trim(rs("Genitore_PIVA"))) = 0 Then %>
	                                            <input name="Genitore_PIVA" class="input-xlarge focused" id="inputError" type="text" placeholder="Partita IVA">
	                                        <% Else %>
	                                            <input name="Genitore_PIVA" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_PIVA") %>">
	                                        <% End If %>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Indirizzo / CAP: </label>
                                          <div class="controls">
                                          	<% If IsNull(rs("Genitore_Indirizzo")) = True Or Len(Trim(rs("Genitore_Indirizzo"))) = 0 Then %>
	                                            <input name="Genitore_Indirizzo" class="input-xlarge focused" id="inputError" type="text" placeholder="Indirizzo">
	                                        <% Else %>
	                                            <input name="Genitore_Indirizzo" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Indirizzo") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_CAP")) = True Or Len(Trim(rs("Genitore_CAP"))) = 0 Then %>
	                                            <input name="Genitore_CAP" class="input-xlarge focused" id="inputError" type="text" placeholder="CAP">
	                                        <% Else %>
	                                            <input name="Genitore_CAP" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_CAP") %>">
	                                        <% End If %>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Città / Provincia: </label>
                                          <div class="controls">
                                          	<% If IsNull(rs("Genitore_Citta")) = True Or Len(Trim(rs("Genitore_Citta"))) = 0 Then %>
	                                            <input name="Genitore_Citta" class="input-xlarge focused" id="inputError" type="text" placeholder="Città">
	                                        <% Else %>
	                                            <input name="Genitore_Citta" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Citta") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_Provincia")) = True Or Len(Trim(rs("Genitore_Provincia"))) = 0 Then %>
	                                            <input name="Genitore_Provincia" class="input-xlarge focused" id="inputError" type="text" placeholder="Provincia">
	                                        <% Else %>
	                                            <input name="Genitore_Provincia" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Provincia") %>">
	                                        <% End If %>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Contatti: </label>
                                          <div class="controls">
                                          	<% If IsNull(rs("Genitore_Telefono")) = True Or Len(Trim(rs("Genitore_Telefono"))) = 0 Then %>
	                                            <input name="Genitore_Telefono" class="input-xlarge focused" id="inputError" type="text" placeholder="Telefono">
	                                        <% Else %>
	                                            <input name="Genitore_Telefono" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Telefono") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_Cellulare")) = True Or Len(Trim(rs("Genitore_Cellulare"))) = 0 Then %>
	                                            <input name="Genitore_Cellulare" class="input-xlarge focused" id="inputError" type="text" placeholder="Cellulare">
	                                        <% Else %>
	                                            <input name="Genitore_Cellulare" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Cellulare") %>">
	                                        <% End If %>
                                          	<% If IsNull(rs("Genitore_Email")) = True Or Len(Trim(rs("Genitore_Email"))) = 0 Then %>
	                                            <input name="Genitore_Email" class="input-xlarge focused" id="inputError" type="text" placeholder="Email">
	                                        <% Else %>
	                                            <input name="Genitore_Email" class="input-xlarge focused" id="focusedInput" type="text" value="<%= rs("Genitore_Email") %>">
	                                        <% End If %>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="textarea2">Note:</label>
                                          <div class="controls">
                                            <textarea class="input-xlarge textarea" name="Note" style="width: 400px; height: 100px"><%= rs("Note") %></textarea>
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Salva la Scheda">Salva</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
		                        	<a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="<%=response.write (etichettabottoneindietro)%>"></a>
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