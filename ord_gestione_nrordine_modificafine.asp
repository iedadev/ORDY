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

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "UPDATE ORD_Arrivi SET Numord = " 
sss = sss & "'" & request("ord_numord") & "'"
sss = sss & " WHERE Numord= " & request("ord_nrordold")

' response.write sss
Set rs = dbConn.Execute(sss)
' response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Nr ordine Modificato " & request("ord_numord")  & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_nrordine.asp"
%>