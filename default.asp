<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->

<%
Dim sss, IP, nuovapwd, nuovousr, IPserver
IP = Request.ServerVariables("REMOTE_ADDR")
IPserver = Request.ServerVariables("LOCAL_ADDR")
session.timeout = 1200
session("sss") = ""
If request("ARRIVO") = "Login" then

    'Set dbConn = CreateObject("ADODB.Connection")
	'dbConn.Open Application("Connection1_ConnectionString")
    

   	Set rs = dbConn.Execute("SELECT * FROM ORD_USER WHERE pwd = '" & request("pwd") & "' and usr='" & request("usr") & "' AND Attivo = 'SI';")
	If rs.EOF Then
		Response.Redirect "default.asp?origine=P1&msg=UserName o Password non corrette!"
	Else
		session("id_usr") = rs("id_usr")
        session("usr") = UCase(request("usr"))
		session("pwd") = UCase(request("pwd"))
		session("ruolo") = rs("ruolo")
		
		' Scrive Log - Inizio
			sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Logon', Now())"
			Set rs = dbConn.Execute(sss)
			sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IPserver & "', '" & session("usr") & "', 'Logon Server', Now())"
			Set rs = dbConn.Execute(sss)
		' Scrive Log - Fine

		if session("ruolo") = "U" then
        response.redirect "main_user.asp"
        else
        response.redirect "main.asp" 
        end if

	End If
Else
	session("id_usr") = ""
    session("usr") = ""
	session("pwd") = ""
	session("ruolo") = ""
End If

Set dbconn = nothing
Set rs = nothing
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--#include virtual file="include/title.asp"-->
	<!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    <!--new-->

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

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->




</head>
<body id="login">
<div class="container">
		<form class="form-signin" name="accesso" action="default.asp?ARRIVO=Login" method="post">
			<img src="images/ordy.png" width="290" height="290" alt="ORDY" >
			<h2 class="form-signin-heading" align="center">mORDYan<br><small>Gestionale Magazzino</small></h2>
			<input name="usr" type="text" class="input-block-level" placeholder="Username">
			<input name="pwd" type="password" class="input-block-level" placeholder="Password">
			<% If Len(Trim(request("msg"))) > 0 Then %>
				<br>
				<div class="control-group error">
					<label class="control-label" for="inputError"><%= request("msg") %></label>
				</div>
			<% End If %>
			<div align="center">
               <button class="btn btn-large btn-primary" type="submit">Login</button>
            </div>
    <div align="center">
      <p><font face="Verdana, Arial, Helvetica, sans-serif"><br>
        Version 2016.10</font></p>
      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
        <a href="mailto:segreteria@motherwords.it?subject=ORDY:Richiesta Username/Password">Dimenticata Username/Password?</a></font> 
    </div>
  </form>
  </div>
<!-- /container -->
<script src="vendors/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
    
</html>