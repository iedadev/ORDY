
<!-- Report estrazione teacher/kit utilizzati -->

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
                <div class="span4" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header"><legend><%=response.write (reportresultstatuskit)%></legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                          <th>
                                           <!--Period from <%'response.write(request.form("date_from"))%> to <%'response.write(request.form("date_to"))%>-->
                                            Date: <%=Date()%>
                                           <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="<%=response.write (etichettabottoneindietro)%>"></a>
                                          </th>
                                            <tr> 
												<th><%=response.write (ricercastatokit)%></th>
                                                <th><%=response.write (reportnrkit)%></th>
                                                <th><%=response.write (reportusosino)%></th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											
                                            <%
                                           Dim sss, i                                          

                                            i = 1
                                            
                                            sss = "SELECT COUNT(IDSTATO) AS Totale,IDSTATO, ATTIVO"
                                            sss = sss & " FROM SIM_Kit WHERE ATTIVO = 1 " 
                                            sss = sss & " GROUP BY IDSTATO, ATTIVO"

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
												If Not rs.eof Then%>
                                                <% dim strStato
                                                                strStato = rs("IDSTATO")
                                                                'Response.write rs("IDSTATO")
                                                    select case strStato
                                                                  case 8%>
                                                                    <img src="images/stategood.png" width="32" height="32" title="<%=response.write (iconastatobuono)%>">
  
                                                                  <%case 2%>
                                                                    <img src="images/stateincomplete.png" width="32" height="32" title="<%=response.write (iconastatoincompleto)%>">
                                                                  
                                                                  <%case 3%>
                                                                    <img src="images/statemissing.png" width="32" height="32" title="<%=response.write (iconastatoperso)%>"> 
                                                                  
                                                                  <%case 4%>
                                                                    <img src="images/statenew.png" width="32" height="32" title="<%=response.write (iconastatonuovo)%>"> 
                                                                  
                                                                  <%case 5%>
                                                                    <img src="images/statesubstitute.png" width="32" height="32" title="<%=response.write (iconastatosostituito)%>">
                                                                  
                                                                  <%case 6%>
                                                                    <img src="images/stateverified.png" width="32" height="32" title="<%=response.write (iconastatoverificato)%>">
                                                                  
                                                                  <%end select%>
                                                <%Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
                                            <%
												If Not rs.eof Then
												    Response.write rs("Totale")
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                            <%
												If Not rs.eof Then
												    'Response.write rs("attivo")
                                                    dim strAttivo
                                                                strAttivo = rs("attivo")
                                                                'Response.write rs("IDSTATO")
                                                    select case strAttivo
                                                    case 1%>
                                                    <img src="images/kitvalidate.png" width="32" height="32" title="<%=response.write (reportusosi)%>"> - In Use
                                                  <%  case 0%>
                                                    <img src="images/kitnotvalidate.png" width="32" height="32" title="<%=response.write (reportusono)%>"> - No in Use
												<%end select%>

                                                <%Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                 <a href="sim_report_statokit_elenco.asp?IDSTATO=<%= rs("IDSTATO") %>&ATTIVO=<%= rs("attivo") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/elencoreport.png" width="32" height="32" alt="<%=response.write (titoloschedakit)%>""></a><br>
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