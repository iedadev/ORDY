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

sss = "SELECT COUNT(*) as Totale FROM Sim_Kit WHERE POS ='" & request("IDPos") & "'"
Set rs = dbConn.Execute(sss)
If rs("Totale") > 0 Then

'Response.write sss
response.redirect "sim_gestione_posizione.asp?Totale=99"


%>

<% Else 

sss = "DELETE FROM SIM_POSIZIONE WHERE IDPOS = " & request("IDPOS")
Set rs = dbConn.Execute(sss)
'response.write "AAAA"
'response.end

End If %>

<%

'sss = "DELETE FROM HD_Corsi WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Demos WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminata Posizione" & request("IDPOS") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_posizione.asp"

set rs = Nothing
set DbConn = Nothing
%>