                                                                <!-- Modal -->
                                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                                  <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                      <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                                                      </div>
                                                                      <div class="modal-body">
                                                                               <% 
                                                                                        Dim sss, i
                                                                                        i = 1
                                                                                        
                                                                                        sss9 = "SELECT A.BARCODE, A.SEGNALAZIONE, A.DATAIN, B.USR FROM SIM_Kit_Segnalazioni AS A INNER JOIN SIM_User AS B ON A.ID_USR = B.ID_USR WHERE A.BARCODE ='" & rs("BARCODE") & "' ORDER BY DATAIN DESC"

                                                                                        Set rs9 = dbConn.Execute(sss9)

                                                                                        session("sss9") = sss9

                                                                                       ' response.write sss9
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
											                                                                        While Not rs9.EOF
											                                                                        i = i + 1
											                                                                        %>
											                                                                        <% If i/2 - Int(i/2) = 0 Then %>
												                                                                        <tr class="odd gradeA">
											                                                                        <% Else %>
												                                                                        <tr class="even gradeA">
											                                                                        <% End If %>
                                                                                                                    <tr>
                                                                                                                           <td><%= rs9("BARCODE") %></td>
                                                                                                                           <td><%= rs9("USR") %></td>
                                                                                                                           <td><%= rs9("SEGNALAZIONE") %></td>
                                                                                                                           <td><%= rs9("DATAIN") %></td>
                                                                                                                  </tr>
                                                                                                                    <%
											                                                                        rs9.MoveNext
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