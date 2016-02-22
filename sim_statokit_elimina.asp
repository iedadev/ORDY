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

sss = "SELECT COUNT(*) as Totale FROM Sim_Kit WHERE IDStato = " & request("IDStato")
Set rs = dbConn.Execute(sss)
If rs("Totale") > 0 Then

'Response.write sss
response.redirect "sim_gestione_statokit.asp?Totale=99"


%>

<% Else 

sss = "DELETE FROM SIM_STATO WHERE IDStato= " & request("IDStato")
Set rs = dbConn.Execute(sss)

'Response.write "AAA"
'Response.end


End If %>

<%
'sss = "DELETE FROM HD_Corsi WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Demos WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminato Stato kit " & request("IDStato") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_statokit.asp"

set rs = Nothing
set DbConn = Nothing
%>