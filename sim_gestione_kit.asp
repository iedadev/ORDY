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
		if (document.P2.kit_IDMCat.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_IDMCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDMCat.focus();
			return false;
			}
		if (document.P2.kit_IDCat.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_IDCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDCat.focus();
			return false;
			}
		if (document.P2.kit_IDSCat.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_IDSCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDSCat.focus();
			return false;
			}
		if (document.P2.kit_nomekit.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_nomekit.style.backgroundColor = 'Yellow';
			document.P2.kit_nomekit.focus();
			return false;
			}
         if (document.P2.kit_descrizione.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_descrizione.style.backgroundColor = 'Yellow';
			document.P2.kit_descrizione.focus();
			return false;
			}
		if ((document.P2.kit_IDPosizione.value == ""))
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_IDPosizione.style.backgroundColor = 'Yellow';
            document.P2.kit_IDPosizione.focus();
			return false;
			}
		
		if ((document.P2.kit_IDStato.value == ""))
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_IDStato.style.backgroundColor = 'Yellow';
			document.P2.kit_IDStato.focus();
			return false;
			}
          
        if ((document.P2.kit_keyword1.value == ""))
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_keyword1.style.backgroundColor = 'Yellow';
			document.P2.kit_keyword1.focus();
			return false;
			}      	
        if ((document.P2.kit_Barcode.value == ""))
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.kit_Barcode.style.backgroundColor = 'Yellow';
			document.P2.kit_Barcode.focus();
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
                <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="include/controlpanel.asp"-->    
                <% End If %>
                <div class="span6" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend><%=response.write (titolocreazionekit)%></legend></div>
                            <div class="block-content collapse in">
                                <div class="span6">
                                     <form name="P2" method="post" Action="sim_kit_aggiunginuovo.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercamacrocategorie)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="kit_IDMCat">
                                              <option value=""></option>
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_MacroCategorie ORDER BY MacroCategoria")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDMCat") & "'>" & rs0("MacroCategoria") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercacategorie)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="kit_IDCat">
                                              <option value=""></option>
                                              <%
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
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercasottocategorie)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="kit_IDSCat">
                                              <option value=""></option>
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_SottoCategorie ORDER BY SottoCategoria")
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
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercanomekit)%>: </label>
                                          <div class="controls">
                                            <input name="kit_nomekit" class="input-xlarge focused" id="focusedInput" type="text">
                                            </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercadesckit)%>: </label>
                                          <div class="controls">
                                          <textarea name="kit_descrizione" style="width: 300px; height: 100px"></textarea>
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaposizioni)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="kit_IDPosizione">
                                              <option value=""></option>
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Posizione ORDER BY Posizione")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDPos") & "'>" & rs0("Posizione") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaqta)%>: </label>
                                          <div class="controls">
                                            <input name="kit_quantita" value="1" class="input-xlarge focused" id="focusedInput" type="text">
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercadataacquisto)%>: </label>
                                          <div class="controls">
                                            <input type="text" value="<%= Date() %>" class="input-xlarge" id="date01" placeholder="Data di Acquisto: GG/MM/AAAA" name="Kit_Data_Acquisto"> </div>
                                          </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercastatokit)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="kit_IDStato">
                                              <option value=""></option>
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Stato ORDER BY Stato")
                                              While Not rs0.EOF
	                                              'Set rs = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDcat = " & rs0("IDcat"))
	                                              'If Not rs.EOF Then
		                                              response.write "<option value='" & rs0("IDStato") & "'>" & rs0("Stato") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                          </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaprezzo)%>: </label>
                                          <div class="controls">
                                            <input type="text" value="0" class="input-xlarge" id="focusedInput" name="kit_prezzo"> 
                                          </div>
                                          </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercakeyword)%>: </label>
                                          <div class="controls">
                                            <input name="kit_keyword1" class="input-xlarge focused" id="focusedInput" type="text">
                                            </div>
                                          </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercabarcode)%>: </label>
                                          <div class="controls">
                                            <input name="kit_Barcode" class="input-xlarge focused" id="focusedInput" type="text">
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottoneaggiungikit)%>"><%=response.write (testobottoneaggiungi)%></button>&nbsp;
                                          <button type="reset" class="btn" data-original-title="<%=response.write (etichettabottoneannulla)%>"><%=response.write (testobottoneannulla)%></button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
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
Set rs1 = nothing
Set rs2 = nothing
Set rs3 = nothing
Set rs4 = nothing
Set rs5 = nothing
Set rs6 = nothing
%>