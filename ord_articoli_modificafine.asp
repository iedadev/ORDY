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

sss = "UPDATE ORD_Richieste SET Numord = " 
sss = sss & "'" & request("ord_numord") & "'"
sss = sss & ", Codart = '" & request("ord_cod") & "'"
sss = sss & ", Barcode = '" & request("ord_bar") & "'"
sss = sss & ", Qtarich = '" & request("ord_qta") & "'"
sss = sss & ", DataOrdine = '" & request("ord_data") & "'"
sss = sss & " WHERE IDRIC= " & request("ord_idric")

response.write sss
Set rs = dbConn.Execute(sss)
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Articolo Modificato " & request("ord_cod")  & " Ordine " & request("ord_numord")  & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_ordini_risultati.asp?IDStatoOrdine=2"
'response.redirect "ord_gestione_articoli_modifica.asp"
%>