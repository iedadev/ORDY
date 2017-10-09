<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file ="include/security.asp"-->

<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>
<%

numord = request("NUMORD")
codart = request("CODART")

response.write numord
response.write codart

'response.end




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

sss = "DELETE FROM ORD_RICHIESTE WHERE CODART ='"& request("codart") &"' AND NUMORD =" & request("numord")
Set rs = dbConn.Execute(sss)

'Response.write sss
'Response.end


'End If %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Articolo Eliminato " & request("codart")  & " Ordine " & request("numord")  & " ', Now())"
Set rs = dbConn.Execute(sss)
response.write sss
' Scrive Log - Fine
'response.end

response.redirect "ord_gestione_ordini_risultati.asp?IDStatoOrdine=2&Del=2"

set rs = Nothing
set DbConn = Nothing
%>