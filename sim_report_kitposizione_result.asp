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
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
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
                            <div class="navbar navbar-inner block-header"><legend><%=response.write (reportresultkitposition)%></legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                           <%
                                            
                                            Dim s1 
                                            s1 = "SELECT POSIZIONE"
                                            s1 = s1 & " FROM SIM_POSIZIONE" 
                                            s1 = s1 & " WHERE IDPOS = " & request("posizione")


                                            'response.write s1
                                            Set rs1 = dbConn.Execute(s1)

                                           %>     
                                          <th><%=response.write (ricercaposizioni)%>:&nbsp;<%Response.write rs1("POSIZIONE")%> <br>
                                              <a href="sim_report_kitposizione.asp"><img src="images/search.png" width="32" height="32" title="<%=response.write (reportnewsearch)%>"></a><font size="0.5"><%=response.write (reportnewsearch)%></font>
                                                <%
                                                  dim datefrom, dateto, user, user2

                                                  'datefrom = request.form("date_from")
                                                  'dateto = request.form("date_to")
                                                  pos = request.form("posizione")

                                                  'response.write datefrom
                                                  'response.write dateto
                                                  'response.write usr
                                                  'Response.write rs1("USR")

                                               %>
                                               </th>
                                            <tr> 
												<th><%=response.write (titolotabellabarcode)%></th>
												<th><%=response.write (reportkit)%></th>
                                                <th><%=response.write (ricercadesckit)%></th>
                                                <th><%=response.write (ricercastatokit)%></th>
											</tr>
										</thead>
										<tbody>
											
                                           <%
                                                

                                            Dim sss, i                                          

                                            i = 1

                                            sss = "SELECT POS, BARCODE, NOMEKIT, DESCKIT, IDSTATO"
                                            sss = sss & " FROM SIM_KIT " 
                                            sss = sss & " WHERE ATTIVO = 1 AND CInt(POS) = " & request("posizione")
                                          
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
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat"))
                                                If Not rs.eof Then
													'Response.write sss
                                                    response.write rs("NOMEKIT")
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
                                                    response.write rs("DESCKIT") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                <%
												Set rs1 = dbConn.Execute("SELECT * FROM SIM_STATO WHERE IDSTATO = " & rs("IDSTATO"))
                                                
												If Not rs1.eof Then%>
                                                <% dim strStato
                                                                strStato = rs1("IDSTATO")
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