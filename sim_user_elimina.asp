<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
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

sss = "DELETE FROM SIM_USER WHERE ID_usr = " & request("ID_usr")
Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Corsi WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Demos WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminato User " & request("ID_usr") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_user.asp"

set rs = Nothing
set DbConn = Nothing
%>