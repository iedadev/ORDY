<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
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
			alert("Inserire la Macrocategoria.Dato Obbligatorio!");
			document.P2.kit_IDMCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDMCat.focus();
			return false;
			}
		if (document.P2.sim_categoria.value == "")
			{
			alert("Inserire la Categoria.Dato Obbligatorio!");
			document.P2.sim_categoria.style.backgroundColor = 'Yellow';
			document.P2.sim_categoria.focus();
			return false;
			}
		if (document.P2.kit_IDSCat.value == "")
			{
			alert("Inserire Sottocategoria. Dato Obbligatorio!");
			document.P2.kit_IDSCat.style.backgroundColor = 'Yellow';
			document.P2.kit_IDSCat.focus();
			return false;
			}
		if (document.P2.kit_nomekit.value == "")
			{
			alert("Inserire in nome del Kit.Dato Obbligatorio!");
			document.P2.kit_nomekit.style.backgroundColor = 'Yellow';
			document.P2.kit_nomekit.focus();
			return false;
			}
		if ((document.P2.kit_IDPosizione.value == ""))
			{
			alert("Inserire la Posizione del Kit.Dato Obbligatorio!");
			document.P2.kit_IDPosizione.style.backgroundColor = 'Yellow';
			return false;
			}
		if (document.P2.kit_quantita.value == "")
			{
			alert("Inserire la Quantità.Dato Obbligatorio!");
			document.P2.kit_quantita.style.backgroundColor = 'Yellow';
			document.P2.kit_quantita.focus();
			return false;
			}
		if (document.P2.Kit_Data_Acquisto.value == "")
			{
			alert("Inserire Data di acquisto.Dato Obbligatorio!");
			document.P2.Kit_Data_Acquisto.style.backgroundColor = 'Yellow';
			document.P2.Kit_Data_Acquisto.focus();
			return false;
			}
		if ((document.P2.kit_IDStato.value == ""))
			{
			alert("Inserire lo Stato del kit.Dato Obbligatorio!");
			document.P2.kit_IDStato.style.backgroundColor = 'Yellow';
			document.P2.kit_IDStato.style.backgroundColor = 'Yellow';
			return false;
			}	
        if ((document.P2.kit_Barcode.value == ""))
			{
			alert("Inserire il Codice del kit.Dato Obbligatorio!");
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
             <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="include/controlpanel.asp"-->    
            <% End If %>
                <div class="span6" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend>Management Subcategory</legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="sim_sottocategorie_aggiunginuovo.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Category: </label>
                                          <div class="controls">
                                          <select id="selectError" name="sim_IDCat">
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
                                          <label class="control-label" for="focusedInput">Subcategory: </label>
                                          <div class="controls">
                                            <input name="sim_sottocategoria" class="input-xlarge focused" id="focusedInput" type="text">
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Add Subcategory">Add </button>&nbsp;
                                          <button type="reset" class="btn">Reset</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                            
                                            <% If request("Totale") <> 0 Then%>	
                                            
                                            <div align="center" style="border:2px solid red">
                                            &nbsp;&nbsp;&nbsp;Non è possibile cancellare questa Sottocategoria perchè vi sono Kit che ne fanno parte
                                            </div>
                                            
                                            <%end if%>
											<tr>
												<th>Subcategory</th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
                                            
                                            i = 1
											sss =  "SELECT * FROM SIM_Sottocategorie WHERE 1=1 order by sottocategoria"
                                            Set rs = dbConn.Execute(sss)
											
											While Not rs.EOF
											i = i + 1
 
                                            %>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
												
                                                <td>
                                            <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("sottocategoria") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
											%>
												</td>
                                                <td>
                                                   <a href="sim_sottocategorie_modifica.asp?IDCat=<%= rs("IDCat") %>&IDScat=<%= rs("IDScat") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/categorymodify.png" width="32" height="32" title="Modify Subcategory"></a>
                                                   &nbsp;
                                                   <a href="sim_sottocategorie_elimina.asp?IDCat=<%= rs("IDCat") %>&IDScat=<%= rs("IDScat") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/categorydelete.png" width="32" height="32" title="Delete Subcategory"></a>
                                                 </td>     
											</tr>
											<%
											rs.MoveNext
											Wend
											%>

										</tbody>
									</table>
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