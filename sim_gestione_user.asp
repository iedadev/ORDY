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
		if (document.P2.Sim_IDMCat.value == "")
			{
			alert("Inserire la Macrocategoria.Dato Obbligatorio!");
			document.P2.Sim_IDMCat.style.backgroundColor = 'Yellow';
			document.P2.Sim_IDMCat.focus();
			return false;
			}
		if (document.P2.Sim_IDCat.value == "")
			{
			alert("Inserire la Categoria.Dato Obbligatorio!");
			document.P2.Sim_IDCat.style.backgroundColor = 'Yellow';
			document.P2.Sim_IDCat.focus();
			return false;
			}
		if (document.P2.Sim_IDSCat.value == "")
			{
			alert("Inserire Sottocategoria. Dato Obbligatorio!");
			document.P2.Sim_IDSCat.style.backgroundColor = 'Yellow';
			document.P2.Sim_IDSCat.focus();
			return false;
			}
		if (document.P2.Sim_nomekit.value == "")
			{
			alert("Inserire in nome del Kit.Dato Obbligatorio!");
			document.P2.Sim_nomekit.style.backgroundColor = 'Yellow';
			document.P2.Sim_nomekit.focus();
			return false;
			}
		if ((document.P2.Sim_user.value == ""))
			{
			alert("Inserire il nome Utente. Dato Obbligatorio!");
			document.P2.Sim_user.style.backgroundColor = 'Yellow';
			return false;
			}
		if (document.P2.sim_pwd.value == "")
			{
			alert("Inserire la Password. Dato Obbligatorio!");
			document.P2.sim_pwd.style.backgroundColor = 'Yellow';
			document.P2.sim_pwd.focus();
			return false;
			}
		if (document.P2.Sim_Data_Acquisto.value == "")
			{
			alert("Inserire Data di acquisto.Dato Obbligatorio!");
			document.P2.Sim_Data_Acquisto.style.backgroundColor = 'Yellow';
			document.P2.Sim_Data_Acquisto.focus();
			return false;
			}
		if ((document.P2.Sim_IDStato.value == ""))
			{
			alert("Inserire lo Stato del kit.Dato Obbligatorio!");
			document.P2.Sim_IDStato.style.backgroundColor = 'Yellow';
			document.P2.Sim_IDStato.style.backgroundColor = 'Yellow';
			return false;
			}	
        if ((document.P2.Sim_Barcode.value == ""))
			{
			alert("Inserire il Codice del kit.Dato Obbligatorio!");
			document.P2.Sim_Barcode.style.backgroundColor = 'Yellow';
			document.P2.Sim_Barcode.style.backgroundColor = 'Yellow';
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
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend>Management User</legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form name="P2" method="post" Action="sim_user_aggiunginuovo.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">UserName: </label>
                                          <div class="controls">
                                            <input name="user" class="input-xlarge focused" id="focusedInput" type="text">
                                            </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Password: </label>
                                          <div class="controls">
                                            <input name="pwd" class="input-xlarge focused" id="focusedInput" type="text">
                                            </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Role: </label>
                                          <div class="controls">
                                            <select id="selectError" name="role">
                                          	<option value="A">Admin</option>
                                          	<option value="U">User</option>
                                          	</select>
                                            </div>
                                        </div>
                                          <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Add User">Add</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>User</th>
                                                <th>Password</th>
                                                <th>Role</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
											
                                            i = 1
										
											sss =  "SELECT * FROM SIM_User WHERE 1=1 ORDER BY Usr"
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
                                                    response.write rs("Usr") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                            <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("pwd") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                                                                    <td>
                                            <%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("ruolo") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                   <a href="sim_user_modifica.asp?ID_usr=<%= rs("ID_usr") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/usermodify.png" width="32" height="32" title="Modify User"></a>
                                                   &nbsp;
                                                   <a href="sim_user_elimina.asp?ID_usr=<%= rs("ID_usr") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/userdelete.png" width="32" height="32" title="Delete User"></a>
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
		 </div>vvvv
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