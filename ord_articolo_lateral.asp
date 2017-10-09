
<div class="span6 id="sidebar"><br>
			                <div class="span12">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Ordini per Learning Center
                                    <h6>MagicBox Completata&nbsp;&nbsp;<a href="#myAlert" data-toggle="modal"><img src="images/completemagicbox.png" align="center" width="32" height="32" title="<%=response.write (titolombcompletata)%>"></a></legend></h6>
                            </div>
                                 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Barcode</th>
												<th>Qta Richiesta</th>
												<th>Data Ordine</th>
                                                <th>Stato Ordine</th>
                                                <th><%=response.write (tabellainout)%></th>
											</tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))

                                                sss = "SELECT * FROM ORD_RICHIESTE"
                                                Set rs = dbConn.Execute(sss)

                                                'response.write sss
                                                if Rs.eof then 
                                                %><br>
                                                <div class="alert alert-info span10">
                                                  <strong>Info!</strong> <%response.write (messaggioalertmagicbox)%>
                                                </div>
                                                <%
                                                 End if
                                                
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


														
                                                        <td><%= rs("BARCODE") %></td>
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
                             </div>

</div>