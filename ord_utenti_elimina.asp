<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file ="include/security.asp"-->

<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>

<%
Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "UPDATE ORD_User SET Attivo = 'NO' WHERE usr ='" & request("IDusr") &"'"
Set rs = dbConn.Execute(sss)

' Response.write sss
' Response.end


'End If %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminato Utente " & request("IDCLi") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_clienti_elenco.asp?Del=1"

set rs = Nothing
set DbConn = Nothing
%>