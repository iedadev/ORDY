<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss, i 

sss3 =  "SELECT * FROM ORD_Articoli WHERE CODART =" & request("codart") 
Set rs3 = dbConn.Execute(sss3)

sss2 =  "SELECT NomCli FROM ORD_Clienti WHERE IDCLI = " & request("ord_lc") 
Set rs2 = dbConn.Execute(sss2)

'response.write sss6
'response.write sss3
'response.write sss2
'response.end


'response.write sss3
'response.write sss2
'response.end

'response.write"FAR PARTIRE COMUNICAZIONE DI ORDINE PRESO IN CARICO"

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
                                      <form name="P2" method="post" Action="ord_gestione_ordini_ritiro_richiesta.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>

                                          <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <input name="ord_lc" class="form-control" id="focusedInput" readonly  type="text" value="<%=rs2("Nomcli")%>" style="width:200px;">
                                           </div></label>  
                                          
                                           <div class="form-group">
                                          <label  for="focusedInput">Data Ritiro
                                           <input name="Data_Ritiro" class="form-control" id="focusedInput"  readonly  type="text" value="<%=request("Data_Ritiro")%>" style="width:100px;">
                                           </div></label> 

                                           <div class="form-group">
                                          <label  for="focusedInput">Codice Articolo
                                           <input name="codart" class="form-control" id="focusedInput" readonly  type="text" value="<%=rs3("codart")%>" style="width:200px;">
                                           </div></label> 

                                            <div class="form-group">
                                          <label  for="focusedInput"> Articolo
                                           <input name="nomart" class="form-control" id="focusedInput" readonly  type="text" value="<%=rs3("nomart")%>" style="width:300px;">
                                           </div></label> 

                                           <div class="form-group">
                                         
                                           <label  for="focusedInput">Qta attualmente disponibile a magazzino <b> <%=rs3("qtadisp")%> </b></label><br>
                                           <label  for="focusedInput">Qta Richiesta
                                               <input name="qta_ric" class="form-control" id="focusedInput" type="number" min="0" max="999" maxlength="3" style="width:100px;">
                                           </div></label> 

                                          <br>
                                          <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Conferma richiesta</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>

                                      </fieldset>
                                    </form>
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
