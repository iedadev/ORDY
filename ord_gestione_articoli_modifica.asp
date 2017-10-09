<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss, i 

'pippo=request ("nocode")
'response.write "non valorizzo"
'response.write pippo
'response.end


pluto=request ("cod_ord")
'response.write pluto

'pippo = request("cod_ord")
'response.write pippo
'response.end


sss1 =  "SELECT * FROM ORD_Richieste WHERE NUMORD =" & request("cod_ord")
Set rs1 = dbConn.Execute(sss1)
'response.write sss1
'response.end

'sss3 =  "SELECT * FROM ORD_Articoli WHERE BARCODE = '" & request("BARCODE") & "'"  'cosi si passa una stringa!!!!
'Set rs3 = dbConn.Execute(sss3)

'sss2 =  "SELECT NomCli FROM ORD_Clienti WHERE IDCLI = " & request("ord_lc") 
'Set rs2 = dbConn.Execute(sss2)

'response.write sss6
'response.write sss3
'response.write sss2
'response.end


'response.write sss3
'response.write sss2
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

    

    
	<!--Intestazione-->
	
	<!--#include virtual file="include/title.asp"-->

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
<div class="col-lg-3 text-center">
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Ordini da Learning Center</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
<div class="col-lg-8 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Ordini  da modificare</legend>
                                 <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro">
                                    <a href="ord_add_articoli.asp?NUMORD=<%=rs1("Numord")%>&LC=<%=rs1("LC")%>"><button type="button" class="btn btn-success">Aggiungi Articolo</button></a>
                            </div>

                                    <%if request("del") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong>Ordini archiviati con successo</strong>
                                            </div>
                                     <%end if%>
									 
							  <%if request("Err") =1 then %> 
                                            <div class="alert alert-danger">
                                              <strong> L'ordine contiene Date diverse, verificare i singoli articoli ed effettuare le modifiche</strong>
                                            </div>
                                     <%end if%>	
									 
			                     <%if request("New") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong> Articolo aggiunto con successo</strong>
                                            </div>
                                     <%end if%>	 
									 

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                             <tr>
										<th>Numero Ordine</th>
										<th>Barcode</th>
                                                  <th>LC</th>
										<th>Articolo</th>
										<th>Qta Rich</th>
                                                  <th>&nbsp;</th>
									</tr>
										</thead>
										<tbody>
											<%
											While Not rs1.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            <td>
												<%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
											    If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
                                               <td>
												<%
											    If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Nomart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>													
												<td>
                                                <%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("QtaRich")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs1.eof Then%>
													 <a href="ord_articoli_modifica.asp?NUMORD=<%=rs1("Numord")%>&CODART=<%=rs1("Codart")%>"<i class="fa fa-pencil fa-2x" title="Modifica"></i></a>
													 <a href="ord_articoli_elimina.asp?NUMORD=<%=rs1("Numord")%>&CODART=<%=rs1("Codart")%>"><i class="fa fa-times fa-2x" title="Elimina"></i></a>
												<%Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                </tr>
											<%
											rs1.MoveNext 
											Wend
											%>
										</tbody>
									</table>
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
