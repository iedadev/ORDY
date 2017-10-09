<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1,dt1,dt2

dim datakitadal
dim datakitaal

lc= request.form ("id_lc")
timeperiod= request.form ("time_period")
datakitadal = FormatDateTime(request.form("data_kit_dal"),0)
datakitaal = FormatDateTime(request.form("data_kit_al"),0)

dt1="#"&month(datakitadal)&"/"&day(datakitadal)&"/"&year(datakitadal)&"#"
dt2="#"&month(datakitaal)&"/"&day(datakitaal)&"/"&year(datakitaal)&"#"
'response.write dt1
'response.write dt2

'response.write (DatePart("q",datacompleto))

'response.write dataordine

'response.write timeperiod
'response.end


if timeperiod = 99 then
 response.redirect "rep_kit_monitoring.asp?datadaa=1"
end if

'response.end
i = 1


'ATTENZIONE DEBBO ESTRARRE SOLO QUELLI PRESENTI IN AMBEDUE LE TABELLE ORD_COMPLETATI e ORD_MONITORING

select case timeperiod
  case 1, 2, 3, 4
    s = "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE TRIM =" & timeperiod &" AND LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
  'response.write s

   case 12
    s = "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
  '  response.write s

  case else
    s =  "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE datacompleto between " & dt1 & " and " & dt2 & " AND LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
 '   response.write s

end select

'calcolo quantita di articoli acquistatin degli articoli da monitorare per accedere alla scontistica
sc= "SELECT SUM(QTARICH) as totart FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart"
Set rssc = dbConn.Execute(sc)

'response.end


'response.write s
'response.write str1
'response.write str2
'response.write str3
'response.write str4

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
                            	<legend>Elenco Situazione Stato Ordini  Kit Monitoring</legend>
                                 <a href="javascript:history.back()"><button type="button" class="btn btn-success">Torna alla ricerca</button></a>&nbsp;
                                 <!-- FARE IL FILE XLS -->
                               <!--  <a href="xls_rep_kit_monitoring.asp"><img src="images/excel.png" width="32" height="32" title="Crea file excel"> <b> Esporta file in Excel</b></a> -->
                            </div>
                                <div class="alert alert-info">
                                    Attualmente il totale dei tuoi articoli acquistati per accedere al programma di scontistica  è  &nbsp;<strong> <%=rssc ("totart")%></strong> 
                                    <p>
                                   <i class="fa fa-info-circle fa-2x"  data-toggle="modal" data-target="#myModal"> </i> Info scontistica
                                </div>
                                  <% if  rssc ("totart") >100 then %>
                                <div class="alert alert-success" align="left">
                                    <strong>Ottimo!</strong> Il tuo numero di articoli acquistati ha raggiunto il programma di scontistica per il prossimo ordine. 
                                </div>
                                <%end if%>

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>LC</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>Data Completo</th>
                                                <th>Trimestre</th>
                                                <th>Articoli</th>
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
                                               <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("dataCompleto")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>        
                                                <td>
												<%
												If Not rs2.eof Then

                                                '11072016 inserisco il trimestre di completamento

                                                    trimestre = DatePart("q",rs2("dataCompleto"))

                                                    strim = "UPDATE ORD_COMPLETATI SET TRIM =" & DatePart("q",rs2("dataCompleto")) &" WHERE codart ='" & rs2("codart") &"' and NUMORD = " &  rs2("numord")
                                                    Set rstrim = dbConn.Execute(strim)
                                                    'response.write strim
                                                    response.write trimestre
                                                    'response.end

												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>  
                                               <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("Qtarich")
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

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Scontistica</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12"> 
                                    <ul align="left">
                                          <li>Up to 100 10% discount off the full price</li>
                                          <li>101–200 15% discount off the full price on the 101st -200th sets only – no additional discount to be given retroactively </li>
                                          <li>201 and more 20% discount off the full price from the 201st set onward only – no additional discount to be given retroactively</li>
                                    </ul>
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
