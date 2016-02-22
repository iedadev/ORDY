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
			</span><b>List Comunication</b></a>            
		</li>
        &nbsp;&nbsp;<a href="#"><img src="images/editcard.png" width="32" height="32" title="Inbox"></a>
        NM <!--'newmail-->
        &nbsp;&nbsp;<a href="#"><img src="images/editcard.png" width="32" height="32" title="Send"></a>
        <li>
			<%
			
            sss = "SELECT * FROM SIM_COMUNICAZIONI as A, SIM_USER as B WHERE A.DESTINATARIO = B.ID_USR AND A.MITTENTE =" & session("id_usr")
            'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDMcat = " & rs("IDMcat")

           'response.write sss
           'response.end
	
    		Set rs = dbConn.Execute(sss)
    
            'sss1 = "SELECT * FROM SIM_USER WHERE ID_USR =" & session("id_usr")
            
            'response.write sss1
            'Set rs1 = dbConn.Execute(sss1)

            'If rs("Totale") > 0 Then
			%>
            
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<tbody>
											     
                                                <th>Date</th>
                                                <th>To</th>
                                                <th>Read</th>
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
                                                   <%response.write rs("DATA")%><br>
                                                </td>
                                                <td>
												<%
												If Not rs.eof Then
												    response.write rs("USR") 
                                                    '& " " & rs("DATA")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
                                                    <%If rs("LETTO") = 1 Then%>
                                                    <%response.write "OK"%>
                                                    <%else
                                                    response.write "KO" %>
                                                    <%end if %>
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