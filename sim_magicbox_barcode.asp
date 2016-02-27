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

If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

Dim sss, i 

sss6 = "SELECT COUNT(*) as Totale FROM SIM_Kit WHERE BARCODE = '" & request("BARCODE") & "'"  'cosi si passa una stringa!!!!
			Set rs6 = dbConn.Execute(sss6)
			'response.write "XXX"
            If rs6("Totale") = 0 Then
                'response.write "Il totale è 0"
		        response.redirect "sim_magicbox_barcode_start.asp"
            End If

sss =  "SELECT * FROM SIM_Kit WHERE BARCODE = '" & request("BARCODE") & "'"  'cosi si passa una stringa!!!!
Set rs = dbConn.Execute(sss)
'response.write sss

Set rs1 = dbConn.Execute("SELECT IDPOS,Posizione FROM SIM_Posizione WHERE IDPOS= " & rs("POS"))
Set rs2 = dbConn.Execute("SELECT IDSTATO,Stato FROM SIM_Stato WHERE IDStato= " & rs("IDStato"))
Set rs3 = dbConn.Execute("SELECT Macrocategoria FROM SIM_Macrocategorie WHERE IDMcat = " & rs("IDMcat"))
Set rs4 = dbConn.Execute("SELECT Categoria FROM SIM_Categorie WHERE IDCat = " & rs("IDCat"))
Set rs5 = dbConn.Execute("SELECT Sottocategoria FROM SIM_Sottocategorie WHERE IDScat = " & rs("IDScat"))

If request("SEGNALAZIONE")= 1 Then
'response.write "XXX"
                                                    
sss2 = "INSERT INTO SIM_Kit_SEGNALAZIONI (ID_KIT, ID_USR, BARCODE,SEGNALAZIONE,DATAIN) VALUES ("
sss2 = sss2 & request("IDKIT") & ", "
sss2 = sss2 & request("IDUSR") & ", "
sss2 = sss2 & "'" & request("BARCODE") & "', "
sss2 = sss2 & "'" & request("NOTE") & "', "
sss2 = sss2 & "Date())" 

'response.write sss2
'response.end
Set rs6 = dbConn.Execute(sss2)

End if
'response.write "AAA"

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
		if (document.P2.kit_IDMCat.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_IDMCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDMCat.focus();
			return false;
			}
		if (document.P2.kit_IDCat.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_IDCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDCat.focus();
			return false;
			}
		if (document.P2.kit_IDSCat.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_IDSCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDSCat.focus();
			return false;
			}
		if (document.P2.kit_nomekit.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_nomekit.style.backgroundColor = 'Yellow';
			document.P2.kit_nomekit.focus();
			return false;
			}
		if ((document.P2.kit_IDPosizione.value == ""))
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_IDPosizione.style.backgroundColor = 'Yellow';
            document.P2.kit_IDPosizione.focus();
			return false;
			}
		if (document.P2.kit_quantita.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_quantita.style.backgroundColor = 'Yellow';
			document.P2.kit_quantita.focus();
			return false;
			}
		if (document.P2.Kit_Data_Acquisto.value == "")
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.Kit_Data_Acquisto.style.backgroundColor = 'Yellow';
			document.P2.Kit_Data_Acquisto.focus();
			return false;
			}
		if ((document.P2.kit_IDStato.value == ""))
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_IDStato.style.backgroundColor = 'Yellow';
			document.P2.kit_IDStato.style.backgroundColor = 'Yellow';
			return false;
			}	
        if ((document.P2.Barcode.value == ""))
			{
			alert(<%=response.write (datoobbligatorio)%>);
			document.P2.kit_Barcode.style.backgroundColor = 'Yellow';
			document.P2.kit_Barcode.style.backgroundColor = 'Yellow';
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
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend><%=response.write (titolomagicbox)%></legend>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form method="post" Action="sim_magicbox_barcode_start.asp" class="form-horizontal">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">
                                             <%=response.write (ricercabarcode)%>:</label>
                                          <div class="controls">
                                          	<input name="barcode" class="input-small focused" id="focusedInput" type="text" style="width:300px;">
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <%'response.write request("BARCODE")%>
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottonecerca)%>"><%=response.write (testobottonecerca)%></button>&nbsp;
                                          <button type="reset" class="btn"><%=response.write (testobottoneannulla)%></button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                                <table class="table table-condensed">
                                   <tbody>
                                        <tr>
											<th><%=response.write (titolotabellamacrocategorie)%></th>
											<th><%=response.write (titolotabellacategorie)%></th>
											<th><%=response.write (titolotabellasottocategorie)%></th>
                                           <!-- <th rowspan="4"><img src="images/icone/unnamed.jpg" width="100" height="75"></th> --> <!--fotografia kit-->
										</tr>
                                        <tr>
										    <td><%= rs3("Macrocategoria") %>&nbsp;</td>
											<td><%= rs4("Categoria") %>&nbsp;</td>
											<td><%= rs5("Sottocategoria") %>&nbsp;</td>
										</tr>
                                       <td colspan="4">&nbsp;</td>
										<tr>
											<th><%=response.write (ricercanomekit)%></th>
											<th><%=response.write (ricercabarcode)%></th>
											<th><%=response.write (ricercadataacquisto)%></th>
										</tr>
                                        <tr>
											<td><%= rs("NomeKit") %>&nbsp;</td>
											<td><%= rs("Barcode") %>&nbsp;</td>
											<td><%= rs("Datain") %>&nbsp;</td>
										</tr>
                                        <td colspan="4">&nbsp;</td>
                                        <tr>
											<th><%=response.write (ricercastatokit)%> e <%=response.write (ricercaposizioni)%></th>
                                            <th><%=response.write (ricercaqta)%></th>
											<%If session("ruolo") <> "U" Then %>
                                            <th><%=response.write (ricercaprezzo)%></th>
                                             <%End If%>
										</tr>
                                        <tr>
                                            <td><%= rs2("Stato") %>&nbsp;-&nbsp;<%= rs1("Posizione") %></td>
											<td><%= rs("Qta") %>&nbsp;</td>
                                            <%If session("ruolo") <> "U" Then %>
                                            <td><%= rs("Prz") %>&nbsp;</td>
                                            <%End If%>
                                        </tr>
                                        <td colspan="4">&nbsp;</td>
										<tr>
											<td colspan="2"><strong><%=response.write (ricercadesckit)%>:</strong>&nbsp;<%= rs("Desckit") %></td>
										    <td colspan="2"><strong><%=response.write (ricercakeyword)%>:</strong>&nbsp;<%= rs("Keywords") %> </td>
										</tr>
                                     </tbody>
								</table>
                            </div>
                            <div class="form-actions" align="center">
                            <a href="sim_magicbox_carico.asp?IDKit=<%= rs("IDKit") %>&BARCODE=<%= rs("Barcode") %>&Categoria=<%= rs4("Categoria") %>&Sottocategoria=<%= rs5("Sottocategoria") %>&Nomekit=<%= rs("nomekit") %>&desckit=<%= rs("desckit") %>&stato=<%= rs2("idstato") %>&qta=<%= rs("qta") %>&pos=<%= rs1("idpos") %>"><img src="images/upkit.png" align="right" width="32" height="32" title="<%=response.write (iconaupkitamb)%>"></a>&nbsp;&nbsp;
                            &nbsp;&nbsp;<a href="sim_magicbox_scarico.asp?IDKit=<%= rs("IDKit") %>&BARCODE=<%= rs("Barcode") %>"><img src ="images/downkit.png" align="right" width="32" height="32" title="<%=response.write (iconadownkitamb)%>"></a>
                            
                            <%If request("SEGNALAZIONE")= 0 Then%>   
                            &nbsp;&nbsp;<a href="sim_magicbox_segnalazione.asp?IDKit=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&IDUSR=<%= session("usr") %>"><img src="images/segnalationkit.png" align="right" width="32" height="32" title="<%=response.write (iconasegnalaanomaliamb)%>"></a>
                            <%End If%>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                        <!-- /block -->
                    </div>
                </div><!--#include virtual file="sim_magicbox_lateral.asp"-->
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