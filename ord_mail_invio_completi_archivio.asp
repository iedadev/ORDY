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

su = "UPDATE ORD_COMPLETATI SET ARCHIVIO4 = 1 WHERE NUMORD = " & request("ORDINE") & " AND LC = '" & request("LC") & "'"
Set rs = dbConn.Execute(su)

%>

<%

sarc = "INSERT INTO ORD_Mail_Archivio (LC, Ordine, TipoMail, DataOperazione) VALUES ('" & request("LC") & "', " & request("ORDINE") & ", 'Completo', Now())"
Set rsa = dbConn.Execute(sarc)   

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Email Ordine " & request("ORDINE") & " completi Archvio', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_mail_completi.asp"

set rs = Nothing
set DbConn = Nothing
%>