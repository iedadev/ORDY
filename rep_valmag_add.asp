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

datavalorizzazione = request("data_valorizzazione")

'" & request("Data_Ordine") & "'

sss =  "SELECT Count(*) AS Nrarticoli FROM ORD_Articoli WHERE ATTART ='Y'"
Set rs = dbConn.Execute(sss)

updqtaval ="UPDATE ORD_Articoli SET VALQTA = Qtadisp * Przart"
Set rsu = dbConn.Execute(updqtaval)
response.write updqtaval

'response.end

stot =  "SELECT SUM(VALQTA) AS Totale FROM ORD_Articoli WHERE ATTART ='Y'"
Set rstot = dbConn.Execute(stot)

response.write stot

suni =  "SELECT SUM(QTADISP) AS TotaleUnita FROM ORD_Articoli WHERE ATTART ='Y'"
Set rsuni = dbConn.Execute(suni)

response.write suni


TotVal =  rstot("Totale")
NrArtVal = rs("Nrarticoli")
TotUni =  rsuni("TotaleUnita")

response.write datavalorizzazione
response.write TotVal
response.write NrArtVal
response.write TotUni

'response.end

ins =  "INSERT INTO ORD_VALORIZZAZIONI (DatVal,TotVal,NrArtVal,TotUni) VALUES ('" & request("data_valorizzazione") & "', "& TotVal &", "& NrArtVal &", "& TotUni &") "
Set rsins = dbConn.Execute(ins)
response.write ins
'response.end

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Inserita Valorizzazione Magazzino" & request("ord_idfor") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rsins = Nothing
Set DbConn = Nothing

response.redirect "rep_valmag.asp"
%>