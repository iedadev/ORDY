<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%



nro=request("NUMORD")
learningcenter=request("LC")
' response.write nro
codice=request ("nocode")
barcode = request("BARCODE")
' response.write codice


numord= "SELECT * FROM ORD_ARTICOLI WHERE barcode ='" & request("barcode") & "'"
Set rsnumord = dbConn.Execute(numord)
' response.write numord

' controllo che non vi siano piu date per lo stesso ordine
codo="SELECT Count(Step1.DATAORDINE) AS codt FROM (SELECT DATAORDINE FROM ORD_Richieste WHERE NUMORD =" & nro & " GROUP BY DATAORDINE) AS Step1"
Set rscodo = dbConn.Execute(codo)
' response.write codo
' response.end

if  rscodo("codt") > 1 then
response.redirect "ord_gestione_articoli_modifica.asp?Err=1&COD_ORD=" & nro
else
sss = "SELECT DISTINCT DATAORDINE FROM ORD_Richieste WHERE NUMORD = " & nro
Set rsdt = dbConn.Execute(sss) 
'response.write sss
end if
' response.end
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

		<script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.qta_ric.value == "")
			{
			alert("Attenzione! Inserire Quantità richiesta. Dato Obbligatorio");
			document.P2.qta_ric.style.backgroundColor = 'Yellow';
			document.P2.qta_ric.focus();
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
<div class="col-lg-4 text-center">
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
<div class="col-lg-6 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Nuovo Articolo Ordine <%=nro%></legend>
                            </div>

                                     <form name="P2" method="post" Action="ord_gestione_articoli_aggiungi.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>

                                          <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine
                                          <input name="nr_ordine" class="form-control" id="focusedInput" readonly  type="text" value="<%=nro%>" style="width:200px;">
                                           </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <input name="ord_lc2" class="form-control" id="focusedInput" readonly  type="text" value ="<%=learningcenter%>" style="width:200px;">
                                          
                                            <%
                                             sss = "SELECT IDCLI FROM ORD_Clienti WHERE Nomcli = '"& request("LC") & "'"
                                             Set rs = dbConn.Execute(sss)     
                                             'response.write  sss
                                            ' response.end
                                              %>
                                           <input type="hidden" class="form-control" name="ord_lc" value="<%= rs("IDCLI") %>">
                                            </select>
                                            </div></label>
                                          </div>

                                          <div class="form-group">
                                          <label  for="focusedInput">Data Ordine <br> (<%=rsdt("DATAORDINE")%>)
                                            <input name="Data_Ordine" class="form-control" id="focusedInput"  type="text" value="<%= Date() %>" style="width:100px;">
                                           </div></label> 
                                                                       
                                                        <% if request ("nocode") = 1 then %>
                                                            <div class="alert alert-danger">
                                                              <strong>Attenzione!</strong> Il codice inserito non corrisponde a nessun prodotto.
                                                            </div>
                                                        <%end if%>
 
                                                        <% if request ("nocode") = 2 then %>
                                                            <div class="alert alert-danger">
                                                              <strong>Attenzione!</strong> Il codice inserito corrisponde ad un articolo non attivo. Vuoi attivarlo?<a href="ord_articoli_nonattivi.asp">&nbsp;<img src="images/buttonedit.png" width="25" height="25" title="Attiva Articolo"></a><br>
                                                                     oppure inserisci un altro codice articolo
                                                            </div>
                                                        <%end if%>

                                          <div class="form-group">
                                          <label  for="focusedInput">Barcode 
                                          <input name="barcode" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Qta Richiesta 
                                          <input name="qta_ric" class="form-control" id="focusedInput" type="number" min="0" max="999" maxlength="3" style="width:100px;">
                                           </div></label> 

                                        <br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                                 <table class="table table-condensed">
									<tbody>
                                        <tr>
											<th>Barcode</th>
											<th>Codice articolo</th>
											<th>Nome articolo</th>
										</tr>
                                        <tr>
										    <td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
                                       <td colspan="4">&nbsp;</td>
										<tr>
											<th>Prezzo</th>
											<th>Qta disponibile</th>
										</tr>
                                        <tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
                            </div>
                          </div>
<div class="col-lg-2 text-center">
        <div></div>
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
