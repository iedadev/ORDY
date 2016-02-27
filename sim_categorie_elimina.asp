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

'If session("ruolo") <> "A" Then
   ' response.redirect "hd_todo.asp"
'End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "SELECT COUNT(*) as Totale FROM Sim_Kit WHERE ATTIVO=1 AND IDCat = " & request("IDCat")
Set rs = dbConn.Execute(sss)
If rs("Totale") > 0 Then

'Response.write sss
'Response.end
response.redirect "sim_gestione_categorie.asp?Totale=99"


%>

<% Else 

sss = "DELETE FROM SIM_Categorie WHERE IDCat = " & request("IDCat")
Set rs = dbConn.Execute(sss)

'Response.write "AAA"
'Response.end


End If %>

<%
sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminata Sottocategoria " & request("IDScat") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_categorie.asp"

set rs = Nothing
set DbConn = Nothing
%>