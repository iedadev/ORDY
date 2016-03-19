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

Dim sss, IP, NuovoID, sss2
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss2 = "UPDATE SIM_Comunicazioni SET STATOLETTURA = 1 WHERE IDCOM = " & request("IDCOM")

'response.write sss2
'response.end

Set rs2 = dbConn.Execute(sss2)

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Conferma di lettura " & request("IDCOM") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_comunicazione.asp"

set rs = Nothing
set DbConn = Nothing
%>