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

sss = "INSERT INTO ORD_Fornitori (Nomfor,Indfor,Emafor,Telfor,DataCreated) VALUES ('" & request("ord_nomfor") & "','" & request("ord_indfor") & "','" & request("ord_emafor") & "','" & request("ord_telfor") & "',Now())"
Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDfor) as nuovo FROM ORD_Fornitori"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Fornitore " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_fornitori.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>