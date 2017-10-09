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

nro = request("barcode")
response.write nro
response.write "numero ordine"
'response.end

' ATTENZIONE METTERE UN CONTROLLO PER GLI ARTICOLI CN NON DOVREBBERO ESSERE ATTIVI

nomeart = "SELECT Nomart, Codart FROM ORD_ARTICOLI WHERE barcode ='" & request("barcode") & "'"
Set rsna = dbConn.Execute(nomeart)
articolo=rsna("Nomart")
codicearticolo=rsna("Codart")
response.write nomeart
response.write articolo
response.write codicearticolo
' response.end

sss = "INSERT INTO ORD_RICHIESTE (Numord,Codart,Barcode,QtaRich,LC,Nomart,DataOrdine,StatoOrdine,Incarico) VALUES ('" & request("nr_ordine") & "','" & codicearticolo & "','" & request("Barcode") & "','" & request("qta_ric") & "','" & request("ord_lc2") & "','" & articolo & "','" & request("data_ordine") & "','2','1')"
Set rs = dbConn.Execute(sss)
' response.write sss
' response.end

' sss = "SELECT MAX(IDmag) as nuovo FROM ORD_Magazzini"
' Set rs = dbConn.Execute(sss)
' NuovoID = rs("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Articolo " & codicearticolo & " Ordine  " & request("nr_ordine") & " ', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_ordini_risultati.asp?IDStatoOrdine=2&New=1"

set rs = Nothing
set DbConn = Nothing
%>