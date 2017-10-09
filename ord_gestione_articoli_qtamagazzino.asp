<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>
<%

Dim sss, IP,qtaarr,qtatot, qtadisp

codicearticolo = request("codart")
numeroarticolo = request("NumOrd")

'response.write request("codart")
'response.write request("qta_arr")
'response.write request("NumOrd")

'response.write "XXX"
s =  "SELECT COUNT(*) as articolo FROM ORD_Arrivi WHERE CODART ="& codicearticolo &" AND NUMORD =" & numeroarticolo
response.write s
Set rs = dbConn.Execute(s)
'response.end

'19.11.2016 Tolto il controllo di verifica di un articolo gia presente nell'ordine

'if rs("articolo") > 0 then
'response.write "Gia inserito"
'response.redirect "ord_gestione_articoliIN.asp?Err=3"
'end if

'response.end

s1 = "INSERT INTO ORD_Arrivi (Codart, Qtaarr, NumOrd, Dataarr) VALUES ( " & request("codart") & " , " & request("qta_arr") & " , " & request("NumOrd") & " , Date())"
response.write s1
'response.end

Set rs1 = dbConn.Execute(s1)

qtaarr = request("qta_arr")

s2 = "SELECT Qtadisp FROM ORD_Articoli WHERE Codart  =  " & request("Codart")
Set rs2 = dbConn.Execute(s2)

'response.write  qtaarr
'response.write  s1
'response.write  s2

qtadisp = rs2("Qtadisp")

' se la qta  disponibile è negativa ( quindi vi sono articoli già in prenotazione la somma non deve considerare il valore negativo
if qtadisp < 0 then
Qtatot = qtaarr
else
Qtatot = qtadisp + qtaarr
end if

response.write  "nuova qta disponibile:"
response.write  Qtatot
'response.write  qtatot

'nrord = request("nrordine")

'response.write  nrord
'response.end

IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio


' qui devo gestire se la qta è negativa devo azzerare la qta diisponibile per aggiungere la qta arrivata altrimenti non è sufficiente per coprire l'ordine. Mettere in rosso la qta se negativa


s3 = "UPDATE ORD_articoli SET Qtadisp = " & Qtatot 
s3 = s3 & ", Qtamin = " & request("qta_min") 
s3 = s3 & " WHERE Codart = " & request("Codart")

response.write s3
Set rs = dbConn.Execute(s3)
'response.end


sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Inserimento nuovo arrivo " & request("Codart") & "', Date())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

NumOrdine = request("NumOrd")

response.write NumOrdine
'response.end

response.redirect "ord_gestione_articoliIN.asp?nrordine=99"                             
%>

