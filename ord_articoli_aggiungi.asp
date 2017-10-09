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

barcart = request("ord_barcart")
ssb = "SELECT COUNT(BARCODE) as totbar FROM ORD_Articoli WHERE BARCODE = '" &barcart & "'"
Set rs = dbConn.Execute(ssb)
'response.write rs("totbar")
'response.write ssb
'response.end
'NuovoBarcode = rs("nuovobar") +1
if rs("totbar") >0 then
'response.write "codice duplicato"
response.redirect "ord_gestione_articoli.asp?Dupl=1"
'else
'response.write "codice ok"
end if
'response.write "fuori ciclo ok"
'response.end

codiceart = request("ord_codart")
response.write codiceart
ssc = "SELECT COUNT(Codart) as totcod FROM ORD_Articoli WHERE CODART = " &codiceart
Set rsc = dbConn.Execute(ssc)
'response.write rsc("totcod")
'response.write ssc
'response.end
'NuovoBarcode = rs("nuovobar") +1
if rsc("totcod") >0 then
'response.write "codice duplicato"
response.redirect "ord_gestione_articoli.asp?Dupl=2"
'else
'response.write "codice ok"
end if
'response.write "fuori ciclo ok"
'response.end

sss = "INSERT INTO ORD_Articoli(Barcode,Codart,Nomart,Przart,Qtadisp, Qtamin,DataCreated,IDCODMAG) VALUES ('" & request("ord_barcart") & "','" & request("ord_codart") & "','" & request("ord_nomart") & "','" & request("ord_przart") & "','" & request("ord_qtadisp") & "','" & request("ord_qtamin") & "',Now(),1)"
response.write sss
'response.end
Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDart) as nuovo FROM ORD_Articoli"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Articolo " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_articoli.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>