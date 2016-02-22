
<div class="span5 id="sidebar"><br>
			                <div class="span12">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Movimenti Kit:&nbsp;&nbsp; <%= rs("BARCODE") %></legend>
                            </div>
                                 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>User</th>
												<th>Data Out</th>
                                             </tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))
                                                barcode= rs("BARCODE")
                                                'Response.Write rs("BARCODE")

                                                sss = "SELECT ID_USER,BARCODE,DATA_OUT,USR FROM SIM_StoricoInventario AS A,SIM_USER AS B  WHERE A.BARCODE= '" & request("BARCODE") & "'AND B.ID_USR=A.ID_USER AND A.DATA_OUT IS NOT NULL ORDER BY  A.DATA_OUT DESC"
                                                Set rs = dbConn.Execute(sss)
                                               'response.write sss
                                                'response.end
                                               ' sss2 = "SELECT ID_USR, USR FROM SIM_USER AS A, SIM_StoricoInventario AS B WHERE B.ID_USER = A.ID_USR" 
                                               ' Set rs2 = dbConn.Execute(sss2)

                                                if Rs.eof then response.write "Nessuna segnalazione per questo Kit"
                                                
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
														<td><%= rs("USR") %></td>
														<td><%= rs("DATA_OUT")%></td>
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