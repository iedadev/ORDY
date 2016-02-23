
<!-- Report estrazione teacher/kit utilizzati -->

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
                            <div class="navbar navbar-inner block-header"><legend>Report Result User Kit</legend></div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
										<thead>
                                           <%
                                            
                                            Dim s  
                                            s1 = "SELECT USR"
                                            s1 = s1 & " FROM SIM_User" 
                                            s1 = s1 & " WHERE ID_USR = " & request("SIM_Teacher")

                                            'response.write s1
                                            Set rs1 = dbConn.Execute(s1)

                                           %>     
                                          <th>User: <%Response.write rs1("USR")%> 
                                           <p>New Search <a href="sim_report_userkit.asp"><img src="images/search.png" width="32" height="32" title="New Search"></a></p>
                                           Period from <%response.write(request.form("date_from"))%> to <%response.write(request.form("date_to"))%>
                                               
                                          </th>
                                            <tr> 
												<th>Barcode</th>
												<th>Kit</th>
                                                <th>Nr Kit</th>
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
                                            
                                            sss = "SELECT COUNT(A.BARCODE) AS Totale, A.BARCODE, B.NOMEKIT"
                                            sss = sss & " FROM SIM_StoricoInventario AS A INNER JOIN SIM_KIT AS B ON A.BARCODE = B.BARCODE" 
                                            sss = sss & " WHERE A.DATA_IN BETWEEN #" & request("date_from") & "# AND #" & request("date_to") & "#"
                                            sss = sss & " AND ID_USER = " & request("SIM_Teacher")
                                            sss = sss & " GROUP BY A.BARCODE, B.NOMEKIT"

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
                                                    response.write rs("Totale") 
                                                    '& " " & rs("IDKIT")
												Else
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