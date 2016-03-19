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

		response.redirect "main.asp" 'sim_inventario_magicbox.asp
        
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
</head>
<body id="login">
<div class="container">
        <p align="center"><img src="images/portada.png" alt="SIM" ></p>
		<form class="form-signin" name="accesso" action="default.asp?ARRIVO=Login" method="post">
			<h2 class="form-signin-heading" align="center">ORDY<br>Milano Fiera</h2>
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
        Version 2016.1</font></p>
      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
        <a href="mailto:iedadev@gmail.com?subject=SIM:Richiesta Username/Password">Dimenticata Username/Password?</a></font> 
        
        
           
    </div>
  </form>
  </div>
<!-- /container -->
<script src="vendors/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
    
</html>