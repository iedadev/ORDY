<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1

dim dataordine

dataordine = request.form("data_ord")

i = 1
									
s =  "SELECT * FROM ORD_Ritiri_Manuali WHERE 1=1"
Set rs2 = dbConn.Execute(s)




'response.write ss
'response.end



'response.write s
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

   <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P3.cod_ord.value == "")
			{
			alert("Attenzione! Inserire Codice Ordine Dato Obbligatorio");
			document.P3.cod_ord.style.backgroundColor = 'Yellow';
			document.P3.cod_ord.focus();
			return false;
			}
		}
		//-->
		</script>


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
                            	<legend>Elenco Situazione Kit Ordini Consegnati a richiesta </legend>
                                 <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro"></a>                                   
                            </div>
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
                                                <th>LC</th>
												<th>Codice Articolo</th>
                                                <th>Nome Articolo</th>
												<th>Qta Ritirata</th>
                                                <th>Data Ritiro</th>
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
                                                    Response.write rs2("codart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>		
                                                <td>
												<%
											    If Not rs2.eof Then
													'Response.write sss

                                                    nomearticolo=rs2("CODART")
                                                    'response.write barcode1

                                                    ss =  "SELECT Nomart FROM ORD_Articoli WHERE codart =" & nomearticolo 
                                                    Set rs3 = dbConn.Execute(ss)

                                                    Response.write rs3("nomart")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>												
												<td>
                                                <%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("QtaRitirata")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataRitiro")
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
