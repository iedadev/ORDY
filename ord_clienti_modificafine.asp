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

sss = "UPDATE ORD_Clienti SET Nomcli = " 
sss = sss & "'" & request("ord_nomcli") & "'"
sss = sss & ", Indcli = '" & request("ord_indcli") & "'"
sss = sss & ", emacli = '" & request("ord_emacli") & "'"
sss = sss & ", telcli = '" & request("ord_telcli") & "'"
sss = sss & " WHERE IDcli = " & request("ord_idcli")

'response.write sss
Set rs = dbConn.Execute(sss)
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificato Cliente " & request("ord_idcli") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_clienti.asp"
%>