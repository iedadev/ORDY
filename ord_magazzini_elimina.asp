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

'sss = "SELECT COUNT(*) as Totale FROM ORD_Clienti WHERE Stacli=1 AND IDcli = " & request("IDcli")
'Set rs = dbConn.Execute(sss)
'If rs("Totale") > 0 Then

'Response.write sss
'Response.end
'response.redirect "ord_clienti_elenco.asp?Del=0"


%>

<% 'Else 

sss = "UPDATE ORD_Magazzini SET Stamag= 0 WHERE IDmag = " & request("IDmag")
Set rs = dbConn.Execute(sss)

'Response.write "AAA"
'Response.end


'End If %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Eliminato Magazzino " & request("IDfor") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_magazzini_elenco.asp?Del=1"

set rs = Nothing
set DbConn = Nothing
%>