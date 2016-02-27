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
If session("usr") = "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "UPDATE SIM_KIT SET IDMcat = " & request("IDMcat")
sss = sss & ", Barcode = '" & request("Barcode") & "'"
sss = sss & ", Nomekit = '" & request("Nomekit") & "'"
sss = sss & ", Desckit = '" & request("descrizione") & "'"
sss = sss & ", IDCat = " & request("IDCat")
sss = sss & ", IDScat = " & request("IDScat")
sss = sss & ", IDStato = " & request("Stato")
sss = sss & ", Pos = " & request("posizione")
sss = sss & ", Prz = " & request("Prz")
sss = sss & ", Datain = '" & request("Datain") & "'"
sss = sss & ", Keywords = '" & ModificaApici(Trim(request("Keywords"))) & "'"
sss = sss & " WHERE IDKIT = " & request("IDKIT")

'response.write sss
Set rs = dbConn.Execute(sss)
'response.end

sss = "UPDATE SIM_Kit_Segnalazioni SET VERIFICATO = 0 WHERE ID_KIT = " & request("IDKIT")

Set rs = dbConn.Execute(sss)
response.write sss1


sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificato Kit segnalato " & request("IDKIT") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "sim_schedakit_validare.asp?IDKIT="& request("IDKIT")
%>