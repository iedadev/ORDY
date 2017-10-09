<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss, i

i = 1

codart = request("codart")

'sss = sss & " ORDER BY Datain"

if codart <> 0 then
sss = "SELECT * FROM ORD_Articoli WHERE ATTART ='N' AND BARCODE = '" & request("codart") & "'"
else
sss = "SELECT * FROM ORD_Articoli WHERE ATTART ='N' "
end if

session("sss") = sss

Set rs2 = dbConn.Execute(sss)

'response.write rs2("Attart")
'response.write codart
'response.write "XXXXX"
'response.write sss
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
                    <div class="col-lg-3 text-center">
                       		<div class="panel panel-danger">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-exclamation-triangle fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Articoli Non Attivi</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                           <div class="panel-footer">
                                    <span class="pull-left"><a href="xls_art_nonattivi.asp"><img src="images/excel.png" width="32" height="32" title="Crea file excel"> <b> Esporta file in Excel</b></a></span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                    </div>
                    <div class="col-lg-9 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Articoli Non Attivi </legend>
                            </div>

                                    <% If request("ATT") =1 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Articolo attivato con successo </strong>
                                    </div>
                                    <% end if%>

                           <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Codice</th>
                                                <th>Barcode</th>
                                                <th>Nome</th>
												<th>Prz</th>
												<th>Qta Disp</th>
												<th>Qta Min</th>
                                                <th>Attiva</th>
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
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Categorie AS CAT WHERE K.IDCAT = CAT.IDCAT AND K.IDCat = " & rs("IDcat"))
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
												'Set rs2 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Sottocategorie AS SCAT WHERE K.IDSCAT = SCAT.IDSCAT AND K.IDScat = " & rs("IDScat"))
												If Not rs2.eof Then
													'Response.write sss
                                                    dim Numero
                                                    Numero = rs2("Przart")
                                                    Response.write "Euro: " & FormatNumber (Numero,2,,,-1)
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs2.eof Then
													Response.write rs2("Qtadisp")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs2.eof Then
													Response.write rs2("Qtamin")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                               <td>
												<%
												If Not rs2.eof Then%>
													<a href="ord_articoli_attiva.asp?Codart=<%= rs2("Codart") %>"><img src="images/buttonedit.png" width="32" height="32" title="Attiva Articolo"></a>
                                                <%
                                                Else
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
