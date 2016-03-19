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

sss = "UPDATE ORD_Fornitori SET Nomfor = " 
sss = sss & "'" & request("ord_nomfor") & "'"
sss = sss & ", Indfor = '" & request("ord_indfor") & "'"
sss = sss & ", emafor = '" & request("ord_emafor") & "'"
sss = sss & ", telfor = '" & request("ord_telfor") & "'"
sss = sss & " WHERE IDfor = " & request("ord_idfor")

'response.write sss
Set rs = dbConn.Execute(sss)
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificato Fornitore " & request("ord_idfor") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_fornitori.asp"
%>