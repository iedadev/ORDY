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

sss = "INSERT INTO ORD_Articoli(Codart,Nomart,Przart,DataCreated) VALUES ('" & request("ord_codart") & "','" & request("ord_nomart") & "','" & request("ord_przart") & "',Now())"
response.write sss
Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDart) as nuovo FROM ORD_Articoli"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Articolo " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_articoli.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>