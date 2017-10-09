<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1
i = 1


dim dataordine

dataordine = request.form("data_ord")

'response.write dataordine

'response.end

nror = request("nrordine")

response.write nror
' response.end

if nror <>"" then
s =  "SELECT * FROM ORD_COMPLETATI_STORICO WHERE NUMORD =" & nror
Set rs2 = dbConn.Execute(s)


's2 =  "SELECT count(*) as ordconsparz FROM ORD_CONS_PARZIALI WHERE NUMORD =" & nror
'Set rs4 = dbConn.Execute(s2)
'response.write s2
'response.write rs4("ordconsparz")
'ordconsparz= rs4("ordconsparz")
'response.end

'if ordconsparz > 0 then
's =  "SELECT * FROM ORD_CONS_PARZIALI WHERE NUMORD =" & nror
'Set rs3 = dbConn.Execute(s)
'response.write s
'response.write "passo qui"
'response.end
'end if

else
								
s =  "SELECT * FROM ORD_COMPLETATI_STORICO WHERE 1=1"
Set rs2 = dbConn.Execute(s)

'response.write scli
'response.end

end if


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
                            	<legend>Storico Ordini (Articoli) Learning Center &nbsp; &nbsp; &nbsp; &nbsp;
                                 <a href="ord_storico.asp"><button type="button" class="btn btn-success" align="right">Nuova Ricerca</button></a></legend>
                            </div>
                                    <table  cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example" >
										<thead>
                                    <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>Codice Articolo</th>
                                                <th>Nome Articolo</th>
                                                <th>Qta Richiesta</th>
                                                <th>Qta Consegnata</th>
                                                <th>Data Consegna</th>
                                                <th>Qta Consegnata Parziale</th>
                                                <th>Data Consegna Parziale</th>
                                                <th>LC</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
												
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
                                                    Response.write rs2("nomart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("qtarich")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss

                                                    s2 =  "SELECT count(*) as ordconsparz FROM ORD_CONS_PARZIALI WHERE CODART='" & rs2("codart") & "' AND NUMORD =" & nror
                                                    Set rs4 = dbConn.Execute(s2)
                                                    'response.write s2
                                                   ' response.write rs4("ordconsparz")
                                                    ordconsparz= rs4("ordconsparz")
                                                    'response.end

                                                   if ordconsparz > 0 then
                                                    s =  "SELECT * FROM ORD_CONS_PARZIALI WHERE CODART='" & rs2("codart") & "' AND NUMORD =" & nror
                                                    Set rs3 = dbConn.Execute(s)
                                                    'response.write s
                                                    'response.write "passo qui"
                                                    'response.end
                                                    end if



                                                    if ordconsparz >0 then
                                                                if rs3("qtacons") <>"" then
                                                                diffcons = rs2("qtarich") - rs3("qtacons")
                                                                Response.write diffcons
                                                                end if
                                                    else
													 Response.write rs2("qtarich")
                                                     end if
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataConsegna")
												Else
													Response.write "&nbsp;"
												End If
												%>
                                                <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    if ordconsparz >0 then
                                                    Response.write rs3("qtacons")
                                                    end if
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
                                                     if ordconsparz >0 then
													Response.write rs3("DataConsegna")
                                                    end if
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
													Response.write rs2("DataPagamento")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataOrdine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>   
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
