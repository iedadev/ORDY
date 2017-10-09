<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss1, i ,sss

sss1 =  "SELECT * FROM ORD_User WHERE usr ='" & request("IDusr") &"'"
'response.write sss
Set rs1 = dbConn.Execute(sss1)

sss = "SELECT * FROM ORD_User WHERE 1 = 1"
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
		if (document.P2.utente_pwd.value == "")
			{
			alert("Attenzione! Password Dato Obbligatorio");
			document.P2.utente_pwd.style.backgroundColor = 'Yellow';
			document.P2.utente_pwd.focus();
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
                                        <div class="huge">Gestione Utenti</div>
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
                            	<legend>Gestione Utente </legend>
                            </div>
                              <form name="P2" method="post" Action="ord_utenti_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="utente_idusr"  value="<%= rs1("ID_usr") %>">
                                      <fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Utente    
                                          	<input value="<%= rs1("usr") %>" name="utente_usr" readonly class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 

                                         <div class="form-group">
                                          <label  for="focusedInput">Password       
                                          	<input value="<%= rs1("pwd") %>" name="utente_pwd" class="form-control" id="focusedInput" type="text" style="width:200px;">
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
