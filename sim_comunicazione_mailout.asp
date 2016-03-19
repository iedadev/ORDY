
<div class="span6 id="sidebar"><br>
			                <div class="span12">
                            <div class="navbar navbar-inner block-header">
                            	<legend><%=response.write (titolo92)%> 

                                    <%
                                        
										iduser=session("id_usr")
                                        ss0 = "SELECT COUNT(*) as TOTMAIL FROM SIM_Comunicazioni WHERE MITTENTE =" & iduser & " AND STATOLETTURA = 0"
                                        Set rs0 = dbConn.Execute(ss0)
                                        
                                    %>

                                    <h6><img src="images/email.png" width="16" height="16">  (<%=rs0("Totmail")%>&nbsp;<%=response.write (titolo89)%>)</h6>
                                    </div><br>
                                    <%if rs0("Totmail")= 0 Then%>
                                    
                                <div class="container span11">
                                      <div class="alert alert-success">
                                        <strong>Success!</strong> Tutte le tue mail sono state lette dal destinatario.Buona giornata.
                                      </div>
                                </div>
                                <%Else%>
                                    
                                    <table span="3" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                    	<thead>
											<tr>
												<th><%=response.write (titolotabelladata)%></th>
												<th><%=response.write (titolo96)%></th>
												<th><%=response.write (titolo95)%></th>
                                            </tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))

                                                sss = "SELECT TOP 3 * FROM SIM_Comunicazioni WHERE MITTENTE =" & iduser & " AND STATOLETTURA = 0"
                                                Set rs = dbConn.Execute(sss)
                                               
                                                if Rs.eof then response.write (messaggioalertmagicbox)
                                                
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
                                                                Set rs2 = dbConn.Execute("SELECT * FROM SIM_USER WHERE ID_USR = " & rs("DESTINATARIO"))
                                                                If Not rs2.eof Then
													                Response.write rs2("USR")
												                Else
													                Response.write "&nbsp;"
												                End If
                                                                %>
                                                            </td> 
                                                             <td>
                                                                <%
                                                                dim strStatoLettura
                                                                strStatoLettura = rs("STATOLETTURA")
                                                                
                                                                'stato lettura 1 Mail letta
                                                                'stato lettura 0 Mail NON letta

                                                                if strStatoLettura = 1 then
                                                                %>
                                                                    <img src="images/email_open.png" width="32" height="32">
                                                            
                                                                <%else%>

                                                                    <img src="images/email.png" width="32" height="32">
                                                                
                                                                <%end if%>
                                                            </td>
												       </tr>
													<%
													rs.MoveNext
													Wend
													%>

										</tbody>
									</table>
                                    <div id="myAlert" class="modal hide">
					                  				<div class="modal-header">
					                  					<button data-dismiss="modal" class="close" type="button">&times;</button>
					                  						<h3><%=response.write (titoloalert)%></h3>
					                  				</div>
					                  				<div class="modal-body">
					                  					<p><%=response.write (messaggioalertmb)%></p>
					                  				</div>
					                  				<div class="modal-footer">
					                  					<a class="btn btn-primary" href="logoff.asp"><%=response.write (messaggiologout)%></a>
					                  					<a class="btn btn-primary" href="sim_magicbox_barcode_start.asp"><%=response.write (messaggiocontinua)%></a>
                                                        <a data-dismiss="modal" class="btn" href="#"><%=response.write (testobottoneannulla)%></a>
					                  				</div>
					      </div>
                            <%End if%> 
                            </div>

</div>