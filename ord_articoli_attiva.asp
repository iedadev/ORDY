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

'sss = "SELECT COUNT(*) as Totale FROM ORD_Clienti WHERE Stacli=1 AND IDcli = " & request("IDcli")
'Set rs = dbConn.Execute(sss)
'If rs("Totale") > 0 Then

'Response.write sss
'Response.end
'response.redirect "ord_clienti_elenco.asp?Del=0"


%>

<% 'Else 

sss = "UPDATE ORD_Articoli SET ATTART = 'Y' WHERE CODART = " & request("Codart")
Set rs = dbConn.Execute(sss)

Response.write sss
'Response.end


'End If %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Attivato Articolo " & request("Codart") & "', Now())"
'Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.redirect "ord_clienti_elenco.asp?Del=1"
response.redirect "ord_articoli_nonattivi.asp?ATT=1"

set rs = Nothing
set DbConn = Nothing
%>