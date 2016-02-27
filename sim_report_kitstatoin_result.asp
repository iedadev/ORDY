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
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                          <th>
                                           <!--Period from <%'response.write(request.form("date_from"))%> to <%'response.write(request.form("date_to"))%>-->
                                            <%=response.write (titolotabelladata)%>: <%=Date()%>
                                           &nbsp;&nbsp;<a href="XXX.asp"><button class="btn btn-success tooltip-top" data-original-title="Esporta la lista in formato Excel"><i class="icon-download icon-white"></i> Esporta</button></a><br>
                                          <!-- &nbsp;&nbsp;<a href="sim_report_statokit.asp"><img src="images/search.png" width="32" height="32" title="New Search"></a><font size="0.5">New Search</font>-->
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
											
                                            <!-- calcolo ultimo mese -->

                                          <!--  Dim dataInizio 
                                            dataInizio = Now()
                                            Dim dataFine 
                                            dataFine=DateAdd("m", 1 , Now()) 
                                            Response.write(dataInizio & dataFine) 

                                            response.end
                                           -->
               
                                            <%
                                                

                                            Dim sss, i                                          

                                            i = 1
                                            
                                            'sss = "SELECT BARCODE, ID_USER, DATA_IN, STATO_IN, DATA_OUT, STATO_OUT"
                                            'sss = sss & " FROM SIM_StoricoInventario1" 
                                            'sss = sss & " WHERE BARCODE IN (SELECT BARCODE FROM SIM_StoricoInventario2)"
                                            'sss = sss & " AND ID_USER IN (SELECT ID_USER FROM SIM_StoricoInventario2)"

                                            sss = "SELECT BARCODE, IDUSER, DATA, IN_OUT"
                                            sss = sss & " FROM SIM_Temp_MagicBox" 
                                            sss = sss & " WHERE IN_OUT = 'IN'" 
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
												If Not rs.eof Then
												    Response.write rs("IDUSER")
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
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
												If Not rs.eof Then
												    Response.write rs("IN_OUT")
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                 <a href="sim_report_statokit_elenco.asp?IDSTATO=<%= rs("BARCODE") %>&ATTIVO=<%= rs("BARCODE") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/elencoreport.png" width="32" height="32" alt="<%=response.write (titoloelencokit)%>"></a><br>
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