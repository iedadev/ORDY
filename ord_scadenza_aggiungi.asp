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

datascd = request("ord_scadenza")
response.write datascd
'response.end

'aggriono la precedente data d scadenza
susc = "UPDATE ORD_Scadenze SET ATTIVO =0 WHERE ATTIVO =1"
Set rsus = dbConn.Execute(susc)
response.write susc
'response.end

'inserisco la nuova data di scadenza
sss = "INSERT INTO ORD_Scadenze (DATA,DATASCADENZA,ATTIVO) VALUES (Date(),'" & datascd & "',1)"
Set rs = dbConn.Execute(sss)
response.write sss
'response.end

'sssc= "SELECT MAX(DATASCADENZA) as datascadenzaordine FROM ORD_SCADENZE WHERE ATTIVO =1"
'Set rssc = dbConn.Execute(sssc)
'DATASCAD = rs("DATASCADENZA")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunta Data Scadenza Ordine " & datascd & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_mail_scadenza.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>