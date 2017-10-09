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
                       		<div class="panel panel-default">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Situazione Stato Richieste Ordini</div>
                                    </div>
                                </div> 
                                <br>
                                          <a href="ord_gestione_ordini_risultati.asp?IDStatoOrdine=2"><button type="button" class="btn btn-primary"> Modifica Ordini</button></a>
                            </div>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Stato Richieste Ordini </legend>
                            </div>

                            <form role="form" method="post" Action="ord_gestione_ordini_risultati.asp" class="form-horizontal">
                                      <fieldset>
                                        <div class="form-group">
                                          <label  for="focusedInput">Codice Ordine              
                                          	<input name="cod_ord" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div> </label> 
                                          <div class="form-group">
                                          <label  for="focusedInput">Barcode          
                                          	<input name="barcode" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div> </label> 
                                        <div class="form-group">
                                         <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="id_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                             Set rs0 = dbConn.Execute("SELECT DISTINCT LC FROM ORD_Richieste ORDER BY LC")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("LC") & "'>" & rs0("LC") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>
                                        </div>
                                         <div class="form-group">
                                         <label  for="focusedInput">Data Ordine
                                          <div class="controls">
                                          <select id="selectError" name="data_ord" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT Distinct DATAORDINE FROM ORD_Richieste ORDER BY DATAORDINE")
                                              While Not rs1.EOF
	                                                response.write "<option value='" & rs1("DATAORDINE") & "'>" & rs1("DATAORDINE") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>
                                        </div>
                                        <div class="form-group">
                                         <label  for="focusedInput">Stato Ordine
                                          <div class="controls">
                                          <select id="selectError" name="IDStatoOrdine" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                              Set rs9 = dbConn.Execute("SELECT * FROM ORD_StatoOrdini ORDER BY StatoORDINE")
                                              While Not rs9.EOF
	                                                response.write "<option value='" & rs9("ID_StatoORDINE") & "'>" & rs9("StatoORDINE") & "</option>"
		                                     rs9.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>
                                             <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Cerca</button>&nbsp;
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
