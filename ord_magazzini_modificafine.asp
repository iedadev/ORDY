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

sss = "UPDATE ORD_Magazzini SET Nommag = " 
sss = sss & "'" & request("ord_nommag") & "'"
sss = sss & ", Indmag = '" & request("ord_indmag") & "'"
sss = sss & " WHERE IDmag= " & request("ord_idmag")

response.write sss
Set rs = dbConn.Execute(sss)
' response.end

slog = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificato Magazzino " & request("ord_idmag") & "', Now())"
Set rs = dbConn.Execute(slog)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_magazzini.asp"
%>