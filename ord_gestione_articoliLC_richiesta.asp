<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

codicearticolo= request("codart")
'response.write codicearticolo
'response.end

numeroordine = request ("nr_ordine")
'response.write numeroordine
'response.end


errorecode =  request ("nocode")
'response.write "non valorizzo errorecode"
'response.write errorecode
'response.end

snomeart="SELECT NOMART FROM ORD_ARTICOLI WHERE CODART = " & request("CODART") 
Set rsna = dbConn.Execute(snomeart)

nomearticolo= rsna("NOMART")
'response.write nomearticolo
'response.end

ss = "INSERT INTO ORD_Richieste (Numord,Codart,Barcode,Qtarich, LC,Nomart,DataOrdine,STatoOrdine,incarico) VALUES ('" & request("nr_ordine") & "','" & request("codart") & "','" & request("barcode") & "','" & request("qta_ric") & "','" & request("ord_lc") & "','" & nomearticolo & "','" & request("Data_Ordine") & "',2,1)"
Set rs1 = dbConn.Execute(ss)
'response.write ss
'response.end
'response.redirect "ord_gestione_articoliLC.asp"

'response.write"FAR PARTIRE COMUNICAZIONE DI ORDINE PRESO IN CARICO"

ins =  "INSERT INTO ORD_COMUNICAZIONI (Data,LC,Statoordine,nrordine,incarico) VALUES (Date(), '" & request("ord_lc") & "', 1, " & request("nr_ordine") & ",0)"
Set rs3 = dbConn.Execute(ins)
'response.write ins

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
		if (document.P2.ord_lc.value == "")
			{
			alert("Attenzione! Inserire il Learning Center. Dato Obbligatorio");
			document.P2.ord_lc.style.backgroundColor = 'Yellow';
			document.P2.ord_lc.focus();
			return false;
			}
		if (document.P2.Data_Ordine.value == "")
			{
			alert("Attenzione! Inserire la data d'ordine. Dato Obbligatorio");
			document.P2.Data_Ordine.style.backgroundColor = 'Yellow';
			document.P2.Data_Ordine.focus();
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
                            	<legend>Richieste da Learning Center </legend>
                            </div>
                            
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form name="P2" method="post" Action="ord_gestione_articoliLC2.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>

                                          <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine 
                                          <input name="nr_ordine" class="form-control" id="focusedInput" readonly  type="text" value="<%=numeroordine %>" style="width:200px;">
                                           </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Learning Center 
                                          <input name="ord_lc" class="form-control" id="focusedInput" readonly  type="text" value="<%=request("ord_lc")%>" style="width:200px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Data Ordine 
                                          <input name="Data_Ordine" class="form-control" id="focusedInput"  type="text"  style="width:100px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Barcode 
                                          <input name="barcode" class="form-control" id="focusedInput" style="width:200px;">
                                           </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Qta Richiesta 
                                          <input name="qta_ric" class="form-control" id="focusedInput" type="number" min="0" max="999" maxlength="3" style="width:100px;">
                                           </div></label> 

                                        </div>                                    
                                          <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                          <a href="ord_gestione_articoliLC_start.asp?ORD=1" class="btn btn-info" role="button">Nuovo Ordine</a>
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
