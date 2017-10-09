<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->

<%
    
'elenco ordini incompleti'
s =  "SELECT DISTINCT numord, DataOrdine FROM ORD_Richieste  WHERE LC ='" & session("usr") & "' AND STATOORDINE =0 AND DATAPAGAMENTO IS NOT NULL" 
Set rs = dbConn.Execute(s)

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
 <div class="col-lg-2 text-center">
        <div></div>
</div>                 
 <div class="col-lg-8 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Ordini Incompleti </legend>
                            </div>

                             <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                   <tr>
									  <th>Numero Ordine</th>
                                      <th>Data Ordine</th>
                                      <th>Nr.Articoli</th>
									  <th>Scheda</th>
											</tr>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            <td>
												<%
												If Not rs.eof Then
													'Response.write sss
                                                    Response.write rs("numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                       <td>
												<%
												If Not rs.eof Then
													Response.write rs("DataOrdine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												 <td>
												<%
												If Not rs.eof Then

                                                'numero ordini incompleti
                                                sc= "SELECT Count(NUMORD) AS tot FROM ORD_Richieste WHERE NUMORD =" & rs("numord") &" AND STATOORDINE =0 AND DATAPAGAMENTO IS NOT NULL AND LC='" & session("usr") & "'"
                                                Set rsc = dbConn.Execute(sc)
													Response.write rsc("tot")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												 <td>
												<a href="ord_ordini_user.asp?INC=1&nrordine=<%=rs("Numord")%>"><i class="fa fa-list-alt fa-2x"></i></a>
												</td>	
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
 <div class="col-lg-2 text-center">
        <div></div>
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
