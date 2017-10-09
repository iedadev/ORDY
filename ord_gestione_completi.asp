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

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

'sss = "SELECT COUNT(*) as Totale FROM ORD_Clienti WHERE Stacli=1 AND IDcli = " & request("IDcli")
'Set rs = dbConn.Execute(sss)
'If rs("Totale") > 0 Then

'Response.write sss
'Response.end
'response.redirect "ord_clienti_elenco.asp?Del=0"

ins =  "INSERT INTO ORD_Completati (Numord,Codart,Barcode,LC,Nomart,Qtarich,DataPagamento,Dataordine,DataCompleto) "
ins = ins &" SELECT Numord,Codart,Barcode,LC,Nomart,Qtarich,DataPagamento,Dataordine,DataCompleto FROM ORD_Richieste WHERE STATOORDINE = 1 "

Set rs3 = dbConn.Execute(ins)

inssto =  "INSERT INTO ORD_Completati_Storico (Numord,Codart,Barcode,LC,Nomart,Qtarich,DataPagamento,Dataordine,DataCompleto) "
inssto = inssto &" SELECT Numord,Codart,Barcode,LC,Nomart,Qtarich,DataPagamento,Dataordine,DataCompleto FROM ORD_Richieste WHERE STATOORDINE = 1 "

Set rs4 = dbConn.Execute(inssto)

'response.write ins

del =  "DELETE  FROM ORD_Richieste WHERE STATOORDINE = 1 "
Set rsd = dbConn.Execute(del)

'response.write del
'response.end


%>



<%
sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Archiviati Ordini Complatetati  " & request("IDfor") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_ordini_risultati.asp?Del=1"

set rs = Nothing
set DbConn = Nothing
%>



