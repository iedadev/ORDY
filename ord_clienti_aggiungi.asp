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
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "hd_todo.asp"
End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO ORD_Clienti (Nomcli,Indcli,Emacli,Telcli,DataCreated) VALUES ('" & request("ord_nomcli") & "','" & request("ord_indcli") & "','" & request("ord_emacli") & "','" & request("ord_telcli") & "',Now())"
Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDcli) as nuovo FROM ORD_Clienti"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Cliente " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_clienti.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>