<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%
'ordini a cui spedire email NB ricordarsi di fare update dopo aver inviato email
s =  "SELECT DISTINCT numord, DataPagamento, DataOrdine, DataCompleto, lc FROM ORD_RICHIESTE WHERE INCARICO=1 AND ARCHIVIO1 =0" 
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
 <div class="col-lg-2 text-center">
        <div></div>
</div>                 
 <div class="col-lg-8 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Ordini  presi in carico  </legend>
                            </div>

                             <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>LC</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>Data Completo</th>
                                                <th>Email</th>
												<th>Stato</th>
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
													'Response.write sss
                                                    Response.write rs("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
                                                <td>
												<%
												If Not rs.eof Then
													Response.write rs("DataPagamento")
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
													Response.write rs("DataCompleto")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                               <td> 
                                      <%'seleziono la mail del lC
                                                sm = "SELECT Emacli FROM ORD_CLIENTI WHERE NOMCLI ='" & rs("LC") & "'" 
                                                Set rsm = dbConn.Execute(sm)                              
                                                %>                                                                                                       
 <!-- invio Mail - con Outlook <a HREF="mailto:cc PARAMETRO ASP &bcc= -->           
                                                                                    
<a href="mailto:<%= rsm("Emacli") %>?bcc=segreteria@motherwords.it;it@motherwords.it&subject=LEARNING CENTER <%= rs("LC") %> ORDINE <%= rs("numord") %> STATO PRESO IN CARICO&body=
Ciao%0A
Il tuo ordine Nr <%= rs("numord") %> è STATO PRESO IN CARICO%0A
A breve riceverai la fattura per il pagamento.%0A
Verrai aggiornato sul suo stato da comunicazioni successive%0A
Per informazioni puoi contattare il numero 3391027789%0A
Grazie,%0A Lorenza %0A%0A">
<img src="images/email.png" width="32" height="32" title="Invia mail"></a>
                                               </td>
												
												<td>
												<%

												'visualizzo se una mail è stata inviata o no in funzione del suo stato 0 in carico 1 in attesa pagamento 2 incompleto 3 completo'
												sc = "SELECT COUNT(*) as nrord FROM ORD_COMUNICAZIONI WHERE LC ='" & rs("LC") & "' AND STATOORDINE =1 AND INCARICO =0 AND NRORDINE =" & rs("numord") 
												Set rsc = dbConn.Execute(sc)  
												'Response.write sc
												'Response.write rsc("nrord") 
												
												If  rsc("nrord") >0 then
												' prevedere update del campo incarico =1 nella tabella' 
												%>
												<a href="ord_mail_invio_presiincarico.asp?ORDINE=<%= rs("numord") %>&LC=<%= rs("LC") %>"><button type="button" class="btn btn-sm btn-primary">Conferma Invio</button></a>
												<%else%>
												<button type="button" class="btn btn-sm btn-success" disabled>Mail Inviata</button>
                                               <a href="ord_mail_invio_presiincarico_archivio.asp?ORDINE=<%= rs("numord") %>&LC=<%= rs("LC") %>"><button type="button" class="btn btn-sm btn-warning">Archivia</button></a>
												<%end if
												
												%>
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
