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

codart = request("CODART")
brc = request("BARCODE")


response.write codart
response.write brc
' response.end

'If session("ruolo") <> "A" Then
   ' response.redirect "hd_todo.asp"
'End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio


%>

<% 'Else 

sss = "DELETE FROM ORD_ARTICOLI WHERE BARCODE ='"& brc &"' AND CODART =" & request("codart")
Set rs = dbConn.Execute(sss)

' Response.write sss
' Response.end


'End If %>

<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Articolo Eliminato " & request("codart")  & " Barcode " & brc  & " ', Now())"
Set rs = dbConn.Execute(sss)
' response.write sss
' Scrive Log - Fine
' response.end

response.redirect "ord_articoli_elenco.asp?Del=1"

set rs = Nothing
set DbConn = Nothing
%>