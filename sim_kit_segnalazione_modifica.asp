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


sss ="SELECT * FROM SIM_Kit WHERE IDKit = " & request("IDKIT")

Set rs = dbConn.Execute(sss)
response.write sss

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
                <div class="span6" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend><%=response.write (titolomodificakitsegnalato)%>: <%= rs("BARCODE") & " - name Kit: " & rs("NomeKit") %></legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="sim_kit_segnalazione_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="IDkit" value="<%= request("IDKit") %>">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercamacrocategorie)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDMcat">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Macrocategorie WHERE IDMcat = " & rs("IDMcat"))
                                              response.write "<option value='" & rs0("IDMcat") & "'>" & rs0("Macrocategoria") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Macrocategorie WHERE IDMcat <> " & rs("IDMcat") & " ORDER BY Macrocategoria")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("IDMcat") & "'>" & rs0("Macrocategoria") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercacategorie)%>: </label>
                                          <div class="controls">
                                          <select id="selectError" name="IDCat">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDCat = " & rs("IDCat"))
                                              response.write "<option value='" & rs0("IDCat") & "'>" & rs0("Categoria") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Categorie WHERE IDCat <> " & rs("IDCat") & " ORDER BY categoria")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("IDCat") & "'>" & rs0("categoria") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (titolotabellasottocategorie)%>:</label>
                                          <div class="controls">
                                          <select id="selectError" name="IDScat">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_SottoCategorie WHERE IDScat = " & rs("IDScat"))
                                              response.write "<option value='" & rs0("IDScat") & "'>" & rs0("sottocategoria") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_SottoCategorie WHERE IDScat <> " & rs("IDScat") & " ORDER BY sottocategoria")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("IDScat") & "'>" & rs0("sottocategoria") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercanomekit)%>: </label>
                                          <div class="controls">
                                            <input value="<%= rs("nomekit") %>" name="nomekit" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput" ><%=response.write (ricercabarcode)%>: </label>
                                          <div class="controls">
                                            <input value="<%= rs("barcode") %>" name="barcode" readonly="readonly" class="input-xlarge focused" id="focusedInput" type="text" >&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput" ><%=response.write (ricercadatacreazione)%>: </label>
                                          <div class="controls">
                                            <input value="<%= Date()%>" name="datain" readonly="readonly" class="input-xlarge focused" id="focusedInput" type="text" >&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercastatokit)%>:</label>
                                          <div class="controls">
                                          <select id="selectError" name="Stato">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Stato WHERE IDStato = " & rs("IDStato"))
                                              response.write "<option value='" & rs0("IDStato") & "'>" & rs0("stato") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Stato WHERE IDStato <> " & rs("IDStato") & " ORDER BY stato")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("IDStato") & "'>" & rs0("stato") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaposizioni)%>:</label>
                                          <div class="controls">
                                          <select id="selectError" name="posizione">
                                              <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Posizione WHERE IDPOS = " & rs("POS"))
                                              response.write "<option value='" & rs0("IDPOS") & "'>" & rs0("posizione") & "</option>"
                                              Set rs0 = dbConn.Execute("SELECT * FROM SIM_Posizione WHERE IDPOS <> " & rs("POS") & " ORDER BY posizione")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("IDPOS") & "'>" & rs0("posizione") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaqta)%>: </label>
                                          <div class="controls">
                                            <input value="<%= rs("qta") %>" name="qta" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercaprezzo)%>: </label>
                                          <div class="controls">
                                            <input value="<%= rs("prz") %>" name="prz" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="textarea"><%=response.write (ricercadesckit)%>:</label>
                                          <div class="controls">
                                            <textarea class="input-xlarge textarea" name="descrizione" style="width: 850px; height: 100px"><%= rs("DESCKIT") %></textarea>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput"><%=response.write (ricercakeyword)%>: </label>
                                          <div class="controls">
                                            <input value="<%= rs("keywords") %>" name="keywords" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottonevalidazione)%>"><%=response.write (testobottonevalidazione)%></button>&nbsp;
                                          <button type="reset" class="btn"><%=response.write (testobottoneannulla)%></button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
		                        	<button onClick="javascript: history.go(-1)" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottoneindietro)%>"><i class="icon-backward icon-white"></i><%=response.write (testobottoneindietro)%></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <!--#include virtual file="sim_kit_segnalazione_lateral.asp"-->
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