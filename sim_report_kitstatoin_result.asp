<!-- Report estrazione teacher/kit non scaricati -->

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
  </head>
    <body>
	    <!--#include virtual file="include/menu.asp"-->
        <div class="container-fluid">
            <div class="row-fluid">
             <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="include/controlpanel.asp"-->    
            <% End If %>
                <div class="span7" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend><%=response.write (reportkitnoscaricati)%></legend></div>
                            <div class="block-content collapse in">
                             
                             <% SEGNAL = request("SEGNAL")

                                if SEGNAL=2 then%>
       
                                                         <div class="container">
                                  <div class="alert alert-info">
                                    <strong>Info!</strong> La mail di segnalazione è stata invata correttamente.
                                </div>

                             </div>
                             <%end if%>   
                               
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                          <th>
                                          <!--Period from <%'response.write(request.form("date_from"))%> to <%'response.write(request.form("date_to"))%>-->
                                            <%=response.write (titolotabelladata)%>: <%=Date()%>
                                          <a href="sim_report_kitstatoin_xls.asp"><img src="images/excel.png" width="32" height="32" title="<%=response.write (etichettabottoneesportaxls)%>"></a>
                                          </th>
                                            <tr> 
												<th><%=response.write (ricercabarcode)%></th>
                                                <th><%=response.write (ricercauser)%></th>
                                                <th><%=response.write (reportstatoin)%></th>
                                                <th><%=response.write (repordatain)%></th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											
                                            <%
                                                

                                            Dim sss, i, ss22                                          

                                            i = 1
                                            
                                            sss = "SELECT BARCODE, IDUSER, DATA, IN_OUT"
                                            sss = sss & " FROM SIM_Temp_MagicBox" 
                                            sss = sss & " WHERE IN_OUT = 'IN' ORDER BY IDUSER DESC" 
                                            
                                            session("sss") = sss
                                                           
                                            'response.write sss
                                            
                                            'response.end
                                            
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
												If Not rs.eof Then
												    Response.write rs("BARCODE")
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                            <%
												
                                                sss2 = "SELECT USR FROM SIM_Temp_MagicBox AS K, SIM_USER AS U "
                                                sss2 = sss2 & " WHERE K.IDUSER = U.ID_USR AND K.IDUSER = " & rs("IDUSER")
                                            
                                                'response.write sss2

                                                Set rs1 = dbConn.Execute(sss2)

												If Not rs1.eof Then
													Response.write rs1("USR")
												Else
													Response.write "&nbsp;"
												End If
                                                
                                                
                                                'If Not rs.eof Then
												 '   Response.write rs("IDUSER")
                                                    '& " " & rs("IDKIT")
												'Else
												'	Response.write "&nbsp;"
												'End If
												%>
												</td>
                                                <td>
                                            <%
												If Not rs.eof Then
												    Response.write rs("DATA")
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                            <%
												dim strNome
                                                      strNome = rs("IN_OUT")

                                                      select case strNome
                                                      case "IN"%>
                                                      <img src="images/magicboxIN.png" width="32" height="32" title="<%=response.write (kitinyourmagicbox)%>">
                                                       
                                                      <%case "OUT"%>
                                                      <img src="images/magicboxOUT.png" width="32" height="32" title="<%=response.write (kitoutyourmagicbox)%>">
                                                                  
                                                      <%end select%>
												</td>
                                                <td>
                                                 <a href="sim_comunicazione_invio.asp?SEGNAL=1&OGGETTO=<%= rs("BARCODE") %>&STATOIN=<%= rs("DATA") %>&USER=<%=  rs("IDUSER") %>"><img src="images/email_page.png" width="32" height="32" title="<%=response.write (titolo83)%>"></a>
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
Set rsk = nothing
Set rsm = nothing
%>