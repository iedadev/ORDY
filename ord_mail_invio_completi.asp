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

su = "UPDATE ORD_COMPLETATI SET EMAIL = 1 WHERE NUMORD = " & request("ORDINE") & " AND LC = '" & request("LC") & "'"
Set rs = dbConn.Execute(su)

' Response.write su
' Response.end

'archivio mail ordini completati'

archivio = request ("ARCHIVIO")

if archivio = 1 then
sa = "UPDATE ORD_COMPLETATI SET EMAIL = 2 WHERE NUMORD = " & request("ORDINE") & " AND LC = '" & request("LC") & "'"
Set rs = dbConn.Execute(sa)
end if



 %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Email Ordine " & request("ORDINE") & " completato', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_mail_completi.asp"

set rs = Nothing
set DbConn = Nothing
%>