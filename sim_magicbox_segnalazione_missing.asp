                                                                <!-- Modal -->
                                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                                  <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                      <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <h4 class="modal-title" id="myModalLabel">Kit History</h4>
                                                                      </div>
                                                                      <div class="modal-body">
                                                                               <% 
                                                                                        Dim sss8, a
                                                                                        a = 1
                                                                                        
                                                                                        sss8 = "SELECT A.BARCODE, A.SEGNALAZIONE, A.DATAIN, B.USR FROM SIM_Kit_Segnalazioni AS A INNER JOIN SIM_User AS B ON A.ID_USR = B.ID_USR WHERE A.BARCODE ='" & rs("BARCODE") & "' ORDER BY DATAIN DESC"

                                                                                        Set rs8 = dbConn.Execute(sss8)

                                                                                        session("sss8") = sss8

                                                                                        response.write sss8
                                                                               %>
                                                                              <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										                                                                        <thead>
											                                                                        <tr>
												                                                                            <th><%=response.write (titolotabellabarcode)%></th>
                                                                                                                            <th><%=response.write (titolotabellauser)%></th>
                                                                                                                            <th><%=response.write (titolotabellanote)%></th>
                                                                                                                            <th><%=response.write (titolotabelladata)%></th>
											                                                                        </tr>
										                                                                        </thead>
                                                                                                                  <tbody>
                                          
                                                                                                                    <%
											                                                                        While Not rs8.EOF
											                                                                        a = a + 1
											                                                                        %>
											                                                                        <% If a/2 - Int(a/2) = 0 Then %>
												                                                                        <tr class="odd gradeA">
											                                                                        <% Else %>
												                                                                        <tr class="even gradeA">
											                                                                        <% End If %>
                                                                                                                    <tr>
                                                                                                                           <td><%= rs8("BARCODE") %></td>
                                                                                                                           <td><%= rs8("USR") %></td>
                                                                                                                           <td><%= rs8("SEGNALAZIONE") %></td>
                                                                                                                           <td><%= rs8("DATAIN") %></td>
                                                                                                                  </tr>
                                                                                                                    <%
											                                                                        rs8.MoveNext
											                                                                        Wend
											                                                                        %>
                                                                                                                 </tbody>
                                                                              </table>
                                                                              </div>
                                                                              <div class="modal-footer">
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                               
                                                                              </div>
                                                                            </div>
                                                                          </div>
                                                                        </div> 