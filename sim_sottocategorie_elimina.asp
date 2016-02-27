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

sss = "SELECT COUNT(*) as Totale FROM Sim_Kit WHERE ATTIVO=1 AND IDScat = " & request("IDScat")
Set rs = dbConn.Execute(sss)
'Response.write sss
'response.end

If rs("Totale") > 0 Then
response.redirect "sim_gestione_sottocategorie.asp?Totale=99"


%>

<% Else 

sss = "DELETE FROM SIM_sottocategorie WHERE IDScat = " & request("IDscat")

'Response.write sss
'Response.end
Set rs = dbConn.Execute(sss)

End If %>

<%
 sss = "DELETE FROM SIM_sottocategorie WHERE IDCat = " & request("IDCat") & " AND IDScat =" & request("IDScat")
'response.write sss
'response.end

Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Corsi WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

'sss = "DELETE FROM HD_Demos WHERE ID_Studente = " & request("ID_Studente")
'Set rs = dbConn.Execute(sss)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminata Sottocategoria " & request("IDScat") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_sottocategorie.asp"

set rs = Nothing
set DbConn = Nothing
%>