
<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
        <li>
			                 <div class="span12">
                             <div class="navbar navbar-inner block-header"><legend>La tua Magic Box  <button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i>Completata</button></legend>
                                
                            </div>
                                 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Barcode</th>
                                                <!--<th>Categoria</th>-->
                                                <!--<th>Sottocategoria</th>-->
												<th>Nome</th>
												<th>Posizione</th>
												<th>Quantità</th>
												<th>Stato</th>
												
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
												i = 1
												iduser=session("id_usr")
                                                'Response.Write(Session("id_usr"))

												sss = "SELECT IDKIT,BARCODE,CATEGORIA,SOTTOCATEGORIA,NOMEKIT,POS,QTA,STATO FROM SIM_Temp_MagicBox WHERE IDUser=" & iduser
                                                Set rs = dbConn.Execute(sss)
												
                                                'Response.Write sss


													While Not rs.EOF
													i = i + 1
													%>
													<% If i/2 - Int(i/2) = 0 Then %>
														<tr class="odd gradeA">
													<% Else %>
														<tr class="even gradeA">
													<% End If %>
														<td><%= rs("BARCODE") %></td>
                                                        <!--<td><%= rs("CATEGORIA") %></td>-->
                                                        <!--<td><%= rs("SOTTOCATEGORIA") %></td>-->
														<td><%= rs("NOMEKIT") %></td>
														<td><%= rs("POS") %></td>
														<td><%= rs("QTA") %></td>
														<td><%= rs("STATO") %></td>
                                                        <td><a href="sim_temp_magicbox_elimina.asp?USER=<%= session("usr") %>&IDKIT=<%= rs("IDKit") %>&BARCODE=<%= rs("BARCODE") %>&NOMEKIT=<%= rs("NOMEKIT") %>&POS=<%= rs("POS") %>&QTA=<%= rs("QTA") %>&STATO=<%= rs("STATO") %>&TipoQuery=<%= request("TipoQuery") %>"><button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i> Elimina</button></a>
                                                        </td>
													</tr>
													<%
													rs.MoveNext
													Wend
													%>

										</tbody>
									</table>
                             <button class="btn btn-mini btn-info"><i class="icon-pencil icon-white"></i>Completata</button><br><br>
                             </div>

        </li>
    </ul>
</div>