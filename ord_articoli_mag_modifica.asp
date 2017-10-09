<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss1, i ,sss

sss1 =  "SELECT * FROM ORD_ARTICOLI WHERE BARCODE ='"& request("barcode") &"' AND CODART="& request("codart")
' response.write sss1
' response.end
Set rs1 = dbConn.Execute(sss1)


sss = "SELECT * FROM ORD_Clienti WHERE 1 = 1"
'sss = sss & " ORDER BY Datain"
session("sss") = sss
set rs2 = dbConn.Execute(sss)


%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.art_cod.value == "")
			{
			alert("Attenzione! Codice Articolo Dato Obbligatorio");
			document.P2.art_cod.style.backgroundColor = 'Yellow';
			document.P2.art_cod.focus();
			return false;
			}
       if (document.P2.art_bar.value == "")
			{
			alert("Attenzione! Barcode Articolo Dato Obbligatorio");
			document.P2.art_bar.style.backgroundColor = 'Yellow';
			document.P2.art_bar.focus();
			return false;
			}
        if (document.P2.art_nom.value == "")
			{
			alert("Attenzione! Nome Articolo Dato Obbligatorio");
			document.P2.art_nom.style.backgroundColor = 'Yellow';
			document.P2.art_nom.focus();
			return false;
			}
         if (document.P2.art_prz.value == "")
			{
			alert("Attenzione! Prezo Articolo Dato Obbligatorio"); 
			document.P2.art_prz.style.backgroundColor = 'Yellow';
			document.P2.art_prz.focus();
			return false;
			}
            if (document.P2.art_sta.value == "")
			{
			alert("Attenzione! Stato Articolo Dato Obbligatorio");
			document.P2.art_sta.style.backgroundColor = 'Yellow';
			document.P2.art_sta.focus();
			return false;
			}
			if (document.P2.art_qta.value == "")
			{
			alert("Attenzione! Qunatità Articolo Dato Obbligatorio");
			document.P2.art_qta.style.backgroundColor = 'Yellow';
			document.P2.art_qta.focus();
			return false;
			}
		}
		//-->
		</script>

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
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Articoli Magazzino</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-7 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Modifica Articoli  Magazzino</legend>
                            </div>
                              <form name="P2" method="post" Action="ord_articoli_mag_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="art_idart"  value="<%= rs1("IDART") %>">
                                      <fieldset>
                                         <div class="form-group">
                                          <label  for="focusedInput"> Codice Articolo       
                                          	<input value="<%= rs1("CODART") %>" name="art_cod" class="form-control" id="focusedInput" type="text" align="center"style="width:100px;">
                                        </div></label  
                                          
                                          <div class="form-group">
                                          <label  for="focusedInput"> Barcode Articolo       
                                          	<input value="<%= rs1("BARCODE") %>" name="art_bar" class="form-control" id="focusedInput" type="text" align="center" style="width:130px;">
                                        </div></label> 

                                          <div class="form-group">
                                          <label  forord_data="focusedInput">Nome Articolo          
                                          	<input value="<%= rs1("NOMART") %>" name="art_nom" class="form-control" id="focusedInput" type="text" align="center" style="width: 500px;">
                                        </div></label> 

                                         <div class="form-group">
                                          <label  for="focusedInput">Prezzo (€)
										     <%dim Numero
														Numero = rs1("Przart")
											 %>
                                          	<input value="<%=FormatNumber (Numero,2,,,-1) %>" name="art_prz" class="form-control" id="focusedInput" type="text" align="center" style="width:80px;">
                                        </div></label> 

                                        <div class="form-group">
                                          <label  for="focusedInput">Stato (Y/N)
                                         <input value="<%= rs1("ATTART") %>" name="art_sta" class="form-control" id="focusedInput" type="text" align="center" style="width:50px;">
                                        </div></label>
										
                                        <div class="form-group">
                                          <label  for="focusedInput">Qta Disponibile          
                                          	<input value="<%= rs1("QTADISP") %>" name="art_dis" class="form-control" id="focusedInput" type="text" align="center" style="width:80px;">
                                        </div></label>

										<div class="form-group">
                                          <label  for="focusedInput">Qta Minima          
                                          	<input value="<%= rs1("QTAMIN") %>" name="art_qta" class="form-control" id="focusedInput" type="text" align="center" style="width:80px;">
                                        </div></label> 		
										
                                        <br>

                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Aggiorna Articolo">Aggiorna</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
										  <a href="ord_articoli_elenco.asp"><button type="button" class="btn btn-success">Torna Elenco</button></a><br>
                                        </div>
                                      </fieldset>
                                    </form>  
                             </div>
                        </div>
</div>
 <div class="col-lg-2 text-center">
                        &nbsp;
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
