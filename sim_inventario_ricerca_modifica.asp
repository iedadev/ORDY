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

Set rs = dbConn.Execute("SELECT * FROM HD_StoricoLezioni WHERE ID_StoricoLezioni = " & request("ID_StoricoLezioni"))

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
                            <div class="navbar navbar-inner block-header"><legend>Modifica Esito Lezione del <%= rs("Data_Lezione") & " - " & rs("Ora_Lezione") %></legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="hd_lezioni_ricerca_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="ID_StoricoLezioni" value="<%= request("ID_StoricoLezioni") %>">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Corso: </label>
                                          <div class="controls">
                                          <select id="selectError" name="ID_Programma">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Programmi WHERE ID_Programma = " & rs("ID_Programma"))
                                              response.write "<option value='" & rs0("ID_Programma") & "'>" & rs0("Sigla") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Programmi WHERE ID_Programma <> " & rs("ID_Programma") & " ORDER BY Sigla")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("ID_Programma") & "'>" & rs0("Sigla") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Sede: </label>
                                          <div class="controls">
                                          <select id="selectError" name="ID_Sede">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Sedi WHERE ID_Sede = " & rs("ID_Sede"))
                                              response.write "<option value='" & rs0("ID_Sede") & "'>" & rs0("Sede") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Sedi WHERE ID_Sede <> " & rs("ID_Sede") & " ORDER BY Sede")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("ID_Sede") & "'>" & rs0("Sede") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Teacher: </label>
                                          <div class="controls">
                                          <select id="selectError" name="ID_Teacher">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Teachers WHERE ID_Teacher = " & rs("ID_Teacher"))
                                              response.write "<option value='" & rs0("ID_Teacher") & "'>" & rs0("Cognome") & " " & rs0("Nome") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM HD_Teachers WHERE ID_Teacher <> " & rs("ID_Teacher") & " ORDER BY Cognome")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("ID_Teacher") & "'>" & rs0("Cognome") & " " & rs0("Nome") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Esito Lezione: </label>
                                          <div class="controls">
	                                          <select id="selectError" name="Esito_Lezione">
	                                          	<%
	                                          	If rs("Esito_Lezione") = "OK" Then
	                                          		response.write "<option value='OK'>OK</option>"
	                                          		response.write "<option value='KO'>KO</option>"
	                                          	Else
	                                          		response.write "<option value='KO'>KO</option>"
	                                          		response.write "<option value='OK'>OK</option>"
	                                          	End If
	                                          	%>
	                                          </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="textarea2">Note:</label>
                                          <div class="controls">
                                            <textarea class="input-xlarge textarea" name="Note_Lezione" style="width: 400px; height: 100px"><%= rs("Note_Lezione") %></textarea>
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
Set rs0 = nothing
%>