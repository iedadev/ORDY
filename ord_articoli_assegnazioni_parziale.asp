<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1,dataordine, numord

s =  "SELECT * FROM ORD_Assegnazioni WHERE 1=1"
s = s & " ORDER BY DATAPAGAMENTO ASC"

'response.write ins
'Set rs3 = dbConn.Execute(ins)
Set rs2 = dbConn.Execute(s)

i = 1

'lastbar = "SELECT LAST(A.BARCODE) as BAR FROM ORD_Articoli as A INNER JOIN ORD_Assegnazioni as B ON A.CODART=B.CODART"
'Set rsbar = dbConn.Execute(lastbar)

'estraggo barcode e qta ricevuta dall LC
'qtadis ="SELECT BARCODE, QTADISP FROM ORD_Articoli WHERE  BARCODE ='" & rsbar("BAR") & "'" 
qtadis ="SELECT BARCODE, QTADISP, CODART FROM ORD_Articoli WHERE CODART =" & request("CODART")
Set rsqta = dbConn.Execute(qtadis)

numord = request("NUMORD")

'response.write lastbar
'response.write qtadis 
'Response.Write "   NUMORDINE_ART:"
'response.write qtadis
'response.write numord

'Response.Write "-----------"

Dim qtadisponibile, qtaricevuta, barcode,nrordine, diff
barcode = rsqta("BARCODE")
qtadisponibile = rsqta("QTADISP")

'estraggo numero di ordine
nrordine ="SELECT IDASS as NORD FROM ORD_Assegnazioni WHERE  CODART =" & request("CODART") & " AND STATOORDINE =0 AND NUMORD=" & request("numord") & " AND BARCODE = '" & barcode & "'" 
Set rsnord = dbConn.Execute(nrordine)
 
nrordine = rsnord("NORD")


'Response.Write "  NRORDINE_ASS:"
'response.write nrordine
'Response.Write "  BARCODE:"
'response.write barcode

'estraggo Stato ordine  Questa parte serve per estrarre il numero ordine, ma si possono avere piu articoli con lo numeri di ordine diversi quindi avree piu stati ordine
stordine ="SELECT STATOORDINE FROM ORD_Assegnazioni WHERE  BARCODE = '" & barcode & "'" 
Set rsstord = dbConn.Execute(stordine)
'response.write stordine

'Response.Write "   NRORDINE ASSEGNAZIONE:"
'nrordine = rsnord("NORD")
'response.write nrordine

'estraggo qtarichiesta
'qtarichiesta2 ="SELECT QTARICE FROM ORD_Assegnazioni WHERE IDASS = " & nrordine & " AND NUMORD = " & numord & " AND BARCODE = '" & barcode & "'" 
'Set rsqtarichiesta2 = dbConn.Execute(qtarichiesta2)

'Response.Write "  vvv  "
'response.write qtarichiesta2

'Response.Write "   NUOVA QTA DISP:"
'response.write qtadisponibile

'Response.Write "   QTA DIFFE ASSEGNAZIONI:"
'qtarichiesta2= rsqtarichiesta2("QTARICE")

'verifico che non siano già presenti ordini assegnati parzialmente consegnati
consegnaparziale ="SELECT COUNT (*) as consparz  FROM ORD_CONS_PARZIALI WHERE BARCODE = '" & barcode & "'" 
Set rsconpar = dbConn.Execute(consegnaparziale)
response.write consegnaparziale
if rsconpar("consparz") = 0 then
                insconspar =  "INSERT INTO ORD_CONS_PARZIALI (Numord,Codart,Barcode,LC,Nomart,Qtacons) "
                insconspar = insconspar &" SELECT Numord,Codart,Barcode,LC,Nomart,QtaRice FROM ORD_Richieste WHERE STATOORDINE = 0 AND QtaRice >0  AND CODART = '" & request("codart") & "'" 
                Set rs2 = dbConn.Execute(insconspar)
                Response.Write insconspar
                'response.end  
end if



' Scrive Log - Inizio
Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")

ss= "SELECT Numord,Codart,Barcode,LC,Nomart,QtaRice FROM ORD_Richieste WHERE STATOORDINE = 0 AND QtaRice >0  AND CODART = '" & request("codart") & "'"
Set rs3 = dbConn.Execute(ss)
response.write ss
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Assegnazione Parziale Ordine " & rs3("LC") & " Numord " & rs3("Numord") & " Barcode " & rs3("Barcode") & " Qta " & rs3("QtaRice") & "', Now())"
Set rs = dbConn.Execute(sss)
response.write sss
'response.end
' Scrive Log - Fine             

 response.redirect "ord_gestione_articoliAS.asp?QTACONS=1"

Set rs = Nothing
Set rs1 = Nothing
Set rs2 = Nothing
Set dbconn = Nothing
%>