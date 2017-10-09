<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%

Dim sss1, i ,sss

sss1 =  "SELECT * FROM ORD_Arrivi WHERE NUMORD =" & request("nrordine")
 'response.write sss1
'response.end
Set rs1 = dbConn.Execute(sss1)


' sss = "SELECT * FROM ORD_Clienti WHERE 1 = 1"
' 'sss = sss & " ORDER BY Datain"
' session("sss") = sss
' set rs2 = dbConn.Execute(sss)


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
		if (document.P2.ord_numord.value == "")
			{
			alert("Attenzione! ord_nomord Dato Obbligatorio");
			document.P2.ord_numord.style.backgroundColor = 'Yellow';
			document.P2.ord_numord.focus();
			return false;
			}
       if (document.P2.ord_cod.value == "")
			{
			alert("Attenzione! ord_cod Dato Obbligatorio");
			document.P2.ord_cod.style.backgroundColor = 'Yellow';
			document.P2.ord_cod.focus();
			return false;
			}
        if (document.P2.ord_bar.value == "")
			{
			alert("Attenzione! ord_bar Cliente Dato Obbligatorio");
			document.P2.ord_bar.style.backgroundColor = 'Yellow';
			document.P2.ord_bar.focus();
			return false;
			}
        if (document.P2.ord_nom.value == "")
			{
			alert("Attenzione! ord_nom Cliente Dato Obbligatorio");
			document.P2.ord_nom.style.backgroundColor = 'Yellow';
			document.P2.ord_nom.focus();
			return false;
			}
         if (document.P2.ord_qta.value == "")
			{
			alert("Attenzione! ord_qta Cliente Dato Obbligatorio"); 
			document.P2.ord_qta.style.backgroundColor = 'Yellow';
			document.P2.ord_qta.focus();
			return false;
			}
            if (document.P2.ord_data.value == "")
			{
			alert("Attenzione! ord_data Cliente Dato Obbligatorio");
			document.P2.ord_data.style.backgroundColor = 'Yellow';
			document.P2.ord_data.focus();
			return false;
			}
		}
		//-->
		</script>

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
 <div class="col-lg-3 text-center">
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Ordini Helen Doron</div>
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
                            	<legend>Gestione Modifica Ordini Helen Doron </legend>
                            </div>
                              <form name="P2" method="post" Action="ord_gestione_nrordine_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
												<input type="hidden" name="ord_nrordold"  value="<%= request("nrordine") %>">
												<fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine
                                          	<input value="<%= request("nrordine") %>" name="ord_numord" class="form-control" id="focusedInput" type="text" align="center"style="width:200px;">
                                        </div></label> 
												<br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Aggiorna Articolo">Aggiorna</button>
                                          <button type="reset" class="btn">Annulla</button>
													<a href="javascript:history.back()"><button type="button" class="btn btn-success">Torna Indietro</button></a><br>
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
