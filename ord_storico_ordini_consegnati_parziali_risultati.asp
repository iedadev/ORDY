<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1

dim dataordine

dataordine = request.form("data_ord")

'response.write dataordine

'response.end

i = 1
									
s =  "SELECT IDconsparz,Numord, Codart, Barcode, LC, Nomart,QtaCons,DataConsegna FROM ORD_Cons_Parziali  Order by Numord"
'sss = sss & " ORDER BY Datain"

Set rs2 = dbConn.Execute(s)

'response.write scli
'response.end

%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <!--#include virtual file="include/navigation.asp"-->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                 <!--#include virtual file="include/heading.asp"--> 
               
                 <!-- /.row -->

<div class="row">               
 <div class="col-lg-12 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Ordini con Kit incompleti da consegnare</legend>
										<a href="ord_storico_completati.asp"><button type="button" class="btn btn-primary" >Archivio ordini consegnati</button></a>
                            </div>
                                    <table  cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Codice Articolo</th>
                                                <th>Barcode</th>
                                                <th>Nome articolo</th>
                                                <th>Learning Center</th>
                                                <th>Qta Consegnata</th>
												<th>Data Consegna</th>
                                                <th> </th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs2.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Codart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
                                                <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Nomart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("QtaCons")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("DataConsegna")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	                                                    	
												 <td>
												<%
												If Not rs2.eof Then
                                                            if rs2("dataconsegna") <> "" then
                                                            Response.write"&nbsp;"
															else %>
															<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Inserire Data Consegna</button>
													<% end if
												else
													Response.write "&nbsp;"
												End If
												%>
												</td>   										
                                       </tr>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                            </div>
                          </div>
</div>       
    <!-- Modal 2-->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modifica Ordini</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                        <form name="P3" method="post" Action="ord_gestione_ordini_parziali_dataconsegna.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                           <b>Selezionare il numero d'ordine da consegnare</b>
                                          <br><br>
                                          <div class="form-group">
                                          <label  for="focusedInput">
                                          <div class="controls">
                                          <select id="selectError" name="idconsparz" class="form-control" type="text" style="width: auto;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT DISTINCT IDCONSPARZ,NUMORD, CODART FROM ORD_CONS_PARZIALI WHERE DATACONSEGNA IS NULL ORDER BY NUMORD")
                                              While Not rs1.EOF
	                                          response.write "<option value='" & rs1("IDCONSPARZ") & "'>" & rs1("NUMORD") & "-- " & rs1("CODART") &"</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Modifica">Modifica</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>            
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
