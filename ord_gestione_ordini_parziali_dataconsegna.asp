<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss1, i

sss1 = "SELECT * FROM ORD_CONS_PARZIALI WHERE DATACONSEGNA IS NULL AND IDCONSPARZ= " & request("idconsparz")
' response.write sss1
Set rs1 = dbConn.Execute(sss1)

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

   <script type="text/javascript">
        <!--
        function controllo()
        {
		if (document.P2.data_consegna.value == "")
			{
			alert("Attenzione! Inserire Data di consegna. Dato Obbligatorio");
			document.P2.data_consegna.style.backgroundColor = 'Orange';
			document.P2.data_consegna.focus();
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
                                        <i class="fa fa-euro fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Ordini</div>
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
                            	<legend>Gestione Data Consegna</legend>
                            </div>
                              <form name="P2" method="post" Action="ord_gestione_ordini_parziali_dataconsegna_update.asp" class="form-horizontal" onsubmit="return controllo()">
                                    
                                      <fieldset>
										           <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine
										           <input name="nr_ordine" class="form-control" placeholder id="focusedInput"  type="text" style="width:100px;" value=" <%= rs1("numord") %>">
                                                  <input type="hidden"  name="codart" class="form-control" placeholder id="focusedInput"  type="text" style="width:100px;" value=" <%= rs1("codart") %>">
                                                  <input type="hidden"  name="barcode" class="form-control" placeholder id="focusedInput"  type="text" style="width:100px;" value=" <%= rs1("barcode") %>">
                                                  <input type="hidden"  name="idconsparz" class="form-control" placeholder id="focusedInput"  type="text" style="width:100px;" value=" <%= rs1("idconsparz") %>">
                                                   <input type="hidden"  name="qtacons" class="form-control" placeholder id="focusedInput"  type="text" style="width:100px;" value=" <%= rs1("qtacons") %>">
                                           </div></label> 
                                          <div class="form-group">
                                          <label  for="focusedInput">Data Consegna
										           <input name="data_consegna" class="form-control" id="focusedInput"  type="text" style="width:100px;" value="<%=Date()%>">
                                           </div></label> 
                                        <br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Salva Modifiche">Salva</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
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
