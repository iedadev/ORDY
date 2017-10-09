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

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio
codicearticolo =  ltrim(request("codart"))

sss = "UPDATE ORD_CONS_PARZIALI SET DataConsegna = " 
sss = sss & "'" & request("data_consegna") & "'"
sss = sss & " WHERE DATACONSEGNA IS NULL AND IDCONSPARZ = " & request("idconsparz") &" AND NUMORD= " & request("nr_ordine") &" AND CODART = '" & codicearticolo &"'"

response.write sss
Set rs = dbConn.Execute(sss)
'response.end

slog = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Data Consegna Parziale Ordine " & request("nr_ordine") & "', Now())"
Set rs = dbConn.Execute(slog)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_storico_ordini_consegnati_parziali_risultati.asp"

%>