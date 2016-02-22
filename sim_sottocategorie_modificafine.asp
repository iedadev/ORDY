<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "UPDATE SIM_sottocategorie SET sottocategoria = '" & ModificaApici(Trim(request("sottocategoria")))
sss = sss & "' WHERE IDscat = " & request("IDscat")

response.write sss
Set rs = dbConn.Execute(sss)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificata Sottocategoria " & request("IDscat") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "sim_gestione_sottocategorie.asp"
%>