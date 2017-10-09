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
su = "UPDATE ORD_RICHIESTE SET ARCHIVIO1 = 1 WHERE NUMORD = " & request("ORDINE") & " AND LC = '" & request("LC") & "'"
Set rs = dbConn.Execute(su)
'Response.write su
'Response.end

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sarc = "INSERT INTO ORD_Mail_Archivio (LC, Ordine, TipoMail, DataOperazione) VALUES ('" & request("LC") & "', " & request("ORDINE") & ", 'Preso in carico', Now())"
Set rsa = dbConn.Execute(sarc)   


sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Email Ordine " & request("ORDINE") & " preso in carico Archivio', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_mail_presiincarico.asp"

set rs = Nothing
set DbConn = Nothing
%>