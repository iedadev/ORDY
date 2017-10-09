<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

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
		if (document.P2.ord_codart.value == "")
			{
			alert("Attenzione! Codice prodotto Dato Obbligatorio");
			document.P2.ord_codart.style.backgroundColor = 'Yellow';
			document.P2.ord_codart.focus();
			return false;
			}
        if (document.P2.ord_nomart.value == "")
			{
			alert("Attenzione! Nome Articolo Dato Obbligatorio");
			document.P2.ord_nomart.style.backgroundColor = 'Yellow';
			document.P2.ord_nomart.focus();
			return false;
			}
        if (document.P2.ord_przart.value == "")
			{
			alert("Attenzione! Prezzo Articolo Dato Obbligatorio");
			document.P2.ord_przart.style.backgroundColor = 'Yellow';
			document.P2.ord_przart.focus();
			return false;
			}
        if (document.P2.ord_barcart.value == "")
			{
			alert("Attenzione! Barcode Articolo Dato Obbligatorio");
			document.P2.ord_barcart.style.backgroundColor = 'Yellow';
			document.P2.ord_barcart.focus();
			return false;
			}
		if (document.P2.ord_qtadisp.value == "")
			{
			alert("Attenzione! Quantità Disponibile Articolo Dato Obbligatorio");
			document.P2.ord_qtadisp.style.backgroundColor = 'Yellow';
			document.P2.ord_qtadisp.focus();
			return false;
			}	
		if (document.P2.ord_qtamin.value == "")
			{
			alert("Attenzione! Quantità minima Articolo Dato Obbligatorio");
			document.P2.ord_qtamin.style.backgroundColor = 'Yellow';
			document.P2.ord_qtamin.focus();
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
                       		<div class="panel panel-default">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Articoli &nbsp;&nbsp;<a href="ord_articoli_elenco.asp"><button type="button" class="btn btn-default">Elenco</button></a></div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Creazione Nuovo Articolo </legend>
                            </div>

                                 <% If request("New") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Articolo aggiunto con successo.</strong>
                                    </div>
                                    <%end if%>	

                            <form name="P2" method="post" Action="ord_articoli_aggiungi.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <%
                                            sss = "SELECT MAX(Codart) as nuovo FROM ORD_Articoli"
                                            Set rs = dbConn.Execute(sss)
                                            NuovoCodart = rs("nuovo") +1
                                          %>

										<% if request ("dupl") = 2 then %>
                                                 <div class="alert alert-danger">
                                                 <strong>Attenzione!</strong> Il codice articolo inserito esiste già
                                                            </div>
                                          <%end if%> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Codice Prodotto
                                          <input name="ord_codart" class="form-control" id="focusedInput"  type="text"  value="<%=NuovoCodart%>"style="width:100px;">
                                           </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Nome Articolo
                                          <input name="ord_nomart" class="form-control" id="focusedInput"  type="text"  style="width:200px;">
                                           </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Barcode Articolo

                                          <%
                                            ssb = "SELECT LAST(BARCODE) as nuovobar FROM ORD_Articoli"
                                            Set rs = dbConn.Execute(ssb)
                                            NuovoBarcode = rs("nuovobar") +1
                                          %>
                                          <input name="ord_barcart" class="form-control" id="focusedInput"  type="text" value="<%=NuovoBarcode%>" style="width:130px;">
                                           </div>   
                                           </label> 

                                          <% if request ("dupl") = 1 then %>
                                                 <div class="alert alert-danger">
                                                 <strong>Attenzione!</strong> Il barcode inserito esiste già. Utilizzare il codice suggerito
                                                            </div>
                                          <%end if%>


                                          <div class="form-group">
                                          <label  for="focusedInput">Prezzo Articolo
                                          <input name="ord_przart" class="form-control" id="focusedInput"  type="text" placeholder="0,00" style="width:80px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Qta Disp Articolo
                                          <input name="ord_qtadisp" class="form-control" id="focusedInput"  type="text" style="width:80px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Qta Min Articolo
                                          <input name="ord_qtamin" class="form-control" id="focusedInput"  type="text"  style="width:80px;">
                                           </div></label> 
                                                                                                                           
                                          <br>

                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                            </div>
                          </div>
                        </div>
                    <div class="col-lg-4 text-center">
                        &nbsp;
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
