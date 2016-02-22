
<div class="span1 id="sidebar"><br>
			                <div class="span12">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Magicbox</legend>
                            </div>
                                 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Name</th>
												<th>Description</th>
												<th>Pos</th>
                                                <th>Qta</th>
												<th>State</th>
                                                <th>In/Out</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))

                                                sss = "SELECT IDKIT,IDUser,BARCODE,CATEGORIA,SOTTOCATEGORIA,NOMEKIT,DESCKIT,POS,QTA,STATO,IN_OUT FROM SIM_Temp_MagicBox WHERE IDUser=" & iduser
                                                Set rs = dbConn.Execute(sss)

                                                if Rs.eof then response.write "Non hai ancora caricato nessun kit nella tua MagicBox"
                                                
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
														<!--<td><%= rs("BARCODE") %></td>-->
                                                        <!--<td><%= rs("CATEGORIA") %></td>-->
                                                        <!--<td><%= rs("SOTTOCATEGORIA") %></td>-->
														<td><%= rs("NOMEKIT") %></td>
														<td><%= rs("DESCKIT") %></td>
                                                        <td><%= rs("POS")%></td>
														<td><%= rs("QTA") %></td>
												        <td><%= rs("STATO")%></td>
												        <td><%= rs("IN_OUT") %></td>
                                                        <td>
                                                                <%
                                                                if (rs("IN_OUT") = "IN" OR rs("IN_OUT") = "OUT")Then 
                                                                'response.write "AAA"%>
                                                                <%else%>
                                                                <a href="sim_temp_magicbox_elimina.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&INOUT=<%= rs("IN_OUT") %>&TipoQuery=<%= request("TipoQuery") %>"><button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i> Delete from MagicBox</button></a>
                                                                <% 'sss = "DELETE FROM SIM_Temp_MagicBox WHERE BARCODE='"& request("BARCODE") & "'AND IDKIT="& request("IDKIT") & " AND IDUSER =" &iduser
                                                                end if
                                                                %>
                                                            
                                                            
                                                            
                                                        </td>
													</tr>
													<%
													rs.MoveNext
													Wend
													%>

										</tbody>
									</table>
                                    <a href="#myAlert" data-toggle="modal"><button class="btn btn-mini btn-danger tooltip-top" data-original-title="MagicBox Completata"><i class="icon-pencil icon-white"></i>MagicBox Complete</button></a>
                                    <div id="myAlert" class="modal hide">
					                  				<div class="modal-header">
					                  					<button data-dismiss="modal" class="close" type="button">&times;</button>
					                  						<h3>Attenzione</h3>
					                  				</div>
					                  				<div class="modal-body">
					                  					<p>Grazie per aver completato la tua MagicBox. RICORDATI di effettuare lo scarico del materiale didattico al termine della lezione</p>
					                  				</div>
					                  				<div class="modal-footer">
					                  					<a class="btn btn-primary" href="logoff.asp">Effettua il Logout</a>
					                  					<a class="btn btn-primary" href="sim_magicbox_barcode_start.asp">Continua</a>
                                                        <a data-dismiss="modal" class="btn" href="#">Annulla</a>
					                  				</div>
					      </div>
                             </div>

</div>