<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="#">
			<span class="badge badge-info pull-right">
			<%
			'Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'")
			'Set rsa = dbConn.Execute("SELECT ID_Anno FROM SIM_Anni WHERE Corrente = 'SI'")
			'Set rsb = dbConn.Execute("DELETE FROM Temp_Attivi WHERE 1 = 1")
			'Set rsb = dbConn.Execute("INSERT INTO Temp_Attivi SELECT DISTINCT ID_Studente FROM HD_Corsi WHERE ID_Anno = " & rsa("ID_Anno"))
			'Set rsb = dbConn.Execute("SELECT COUNT(*) as Totale1 FROM Temp_Attivi")
			'response.write rsb("Totale1") & " / " & rs("Totale")
			%>
			</span><b><%=response.write (titoloultimikit)%></b></a>
		</li>
        <li>
			<%
			
            sss = "SELECT TOP 5 (NOMEKIT),* FROM SIM_KIT WHERE VERIFICATO=0 ORDER BY IDKIT DESC"
			
            'response.write sss
            'response.end
			Set rs = dbConn.Execute(sss)
            'If rs("Totale") > 0 Then
			%>
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<tbody>
											<%
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
                                                    response.write rs("NOMEKIT") 
                                                    '& " " & rs("IDKIT")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                   <a href="sim_kit_gestione.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/editcard.png" width="32" height="32" alt="<%=response.write (iconascheda)%>"></a><br>
                                                </td>
                                            <%
											rs.MoveNext
											Wend
											%>
										</tbody>
									</table>
        </li>
    </ul>
</div>