
                            <div class="span6 id="sidebar"><br>
			                <div class="span12">
                            <div class="navbar navbar-inner block-header">
                            	<legend><%=response.write (titolo87)%> 

                                     <%
                                        dim sss
                                        'archivio mail
										iduser=session("id_usr")
                                        sss = "SELECT * FROM SIM_Comunicazioni WHERE DESTINATARIO =" & iduser & " OR MITTENTE =" & iduser & " ORDER BY DATA DESC "
                                        Set rs = dbConn.Execute(sss)
                                        'response.write sss
                                     %>
 
                                    <h6><a href="sim_comunicazione.asp"> <img src="images/email_open.png" width="16" height="16"></a></legend> Torna a Gestione Mail</h6></div><br>
                                 <table span="3" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th><%=response.write (titolotabelladata)%></th>
												<th><%=response.write (titolo96)%></th>
												<th><%=response.write (titolo88)%></th>
                                                <th><%=response.write (titolo94)%></th>
                                            </tr>
										</thead>
										<tbody>
											<%
												'dim sss

                                                'i = 1
												'iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))

                                                'sss = "SELECT TOP 2 * FROM SIM_Comunicazioni WHERE DESTINATARIO =" & iduser & " AND STATOLETTURA = 0"
                                                'Set rs = dbConn.Execute(sss)

                                                
                                                if rs.eof then 
                                                %>
                                                <div class="container span12">
                                                      <div class="alert alert-info">
                                                        <strong>Info!</strong> Non ha nessuna mail in archivio.
                                                      </div>
                                                </div>
                                                <%End if%>
												
                                                    <%
													'Response.Write sss
                                                    'Response.Write rs("POS")
                                                    While Not rs.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
                                                            
                                                        <td><%= rs("DATA") %></td>
														<td><%    
                                                            Set rs1 = dbConn.Execute("SELECT * FROM SIM_Oggetti WHERE ID_Oggetto = " & rs("OGGETTO"))
                                                            If Not rs1.eof Then
													            Response.write rs1("OGGETTO")
												            Else
													            Response.write "&nbsp;"
												            End If
                                                            %>
                                                        </td>
                                                            <td><%    
                                                                Set rs2 = dbConn.Execute("SELECT * FROM SIM_USER WHERE ID_USR = " & rs("MITTENTE"))
                                                                If Not rs2.eof Then
													                Response.write rs2("USR")
												                Else
													                Response.write "&nbsp;"
												                End If
                                                                %>
                                                            </td> 
                                                            <td><%= rs("testo") %></td>
                                                             <td>
                                                                <%
                                                                dim mitt,dest
                                                                mitt = rs("MITTENTE")
                                                                dest = rs("DESTINATARIO")
                                                                'response.write mitt
                                                                'response.write dest
                                                                'response.end
                                                                
                                                                if mitt = iduser then%>

                                                                     <img src="images/sendmail.png" width="32" height="32">

                                                                <%else%>

                                                                     <img src="images/receivemail.png" width="32" height="32">
                                                                
                                                                <%end if%>
                                                            </td>
                                                            <td><a href="sim_comunicazione_elimina.asp?IDCOM=<%= rs("IDCOM") %>"><img src="images/deletemail.png" width="32" height="32"></a></td>
												       </tr>
													<%
													rs.MoveNext
													Wend
													%>

										</tbody>
									</table>
                                 </div>

</div>