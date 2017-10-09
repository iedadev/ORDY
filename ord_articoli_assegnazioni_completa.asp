<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1,dataordine, numord

s =  "SELECT * FROM ORD_Assegnazioni WHERE 1=1"
s = s & " ORDER BY DATAPAGAMENTO ASC"
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
qtarichiesta2 ="SELECT QTADIFF FROM ORD_Assegnazioni WHERE IDASS = " & nrordine & " AND NUMORD = " & numord & " AND BARCODE = '" & barcode & "'" 
Set rsqtarichiesta2 = dbConn.Execute(qtarichiesta2)


'estraggo qta gia ricevuta
qtarice ="SELECT QTARICH,QTARICE FROM ORD_Assegnazioni WHERE IDASS = " & nrordine & " AND NUMORD = " & numord & " AND BARCODE = '" & barcode & "'" 
Set rsqtarice = dbConn.Execute(qtarice)

response.write qtarice
'response.end


Response.Write "  differenza per completare ordine  "
qtarichiesta2= rsqtarichiesta2("QTADIFF")
response.write qtarichiesta2

Response.Write "  disponibilita magazzino  "
qtadisponibile = rsqta("QTADISP")
response.write qtadisponibile

Response.Write "  qta gia ricevuta  "
qtagiaricevuta = rsqtarice("QTARICE")
response.write qtagiaricevuta

Response.Write "  qta richiesta  "
qtarichiesta = rsqtarice("QTARICH")
response.write qtarichiesta


'response.end

'Response.Write "   NUOVA QTA DISP:"
'response.write qtadisponibile

'Response.Write "   QTA DIFFE ASSEGNAZIONI:"
'qtarichiesta2= rsqtarichiesta2("QTADIFF")
'response.write qtarichiesta2

'response.end

'diff = qtadisponibile + qtarichiesta2

'Response.Write(barcode) 
'Response.Write "QTA DISPONIBILE ATTUALE"
'Response.Write(qtadisponibile)
'Response.Write "++"
'Response.Write(nrordine)
'Response.Write "++"
'Response.Write(qtarichiesta)
'Response.Write "DIFFERENZA:"
'Response.Write(diff)

'response.end


'if diff < 0 then  

if qtadisponibile <= 0 then

'updqta1 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtarichiesta & ",  QTADIFF = " & diff & ", STATOORDINE =1 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
'Set xxx1 = dbConn.Execute(updqta1)
'' fare update su ord_articoli delle quantita disponibile
'response.write updqta1
'updqtarich1 ="UPDATE ORD_RICHIESTE SET QTARICE = " & qtarichiesta & ",  QTADIFF = " & diff & ", STATOORDINE =1, DATACOMPLETO=Date() WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
'Set yyy1 = dbConn.Execute(updqtarich1)
'response.write  updqtarich
'response.write "maggiore/uguale a zero"

Response.Write " bisogna effettuare prima ordine a casa madre:"
response.redirect "ord_gestione_articoliAS.asp?NODISP=0"

'response.write qtadisponibile

'updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & DIFF & " WHERE BARCODE = '" & barcode & "'" 
'Set rsupdqtadispart = dbConn.Execute(updqtadispart)
'response.write updqtadispart

'response.end

'response.redirect "ord_gestione_articoliAS.asp?CODART=1"

else

Response.Write " articoli presenti in magazzino:"

Response.Write "  NUOVA qta gia ricevuta  "
nuovaqtaricevuta = qtagiaricevuta + qtadisponibile
response.write nuovaqtaricevuta

'response.end

Response.Write "  NUOVA differenza a completare ordine  "
diffcomple = qtarichiesta  - nuovaqtaricevuta
response.write diffcomple

'response.end

' in caso di ordine COMPLETO

if diffcomple = 0 then

Response.Write "caso di ORDINE COMPLETO"
'response.end

'aggiorno tabella assegnazioni
datacompleto=Date()
updqtac ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & nuovaqtaricevuta & ",  QTADIFF = " & diffcomple & ", STATOORDINE =1, DATACOMPLETO = '" & datacompleto & "'" & " WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
Set xxx2 = dbConn.Execute(updqtac)
Response.Write updqtac

'response.end
'aggiorno tabella richieste
updqtarichcompl ="UPDATE ORD_RICHIESTE SET QTARICE = " & nuovaqtaricevuta & ",  QTADIFF = " & diffcomple & ", STATOORDINE =1, DATACOMPLETO = '" & datacompleto & "'" & " WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
Set yyy2 = dbConn.Execute(updqtarichcompl)
response.write updqtarichcompl

'response.end

'aggiorno tabella articoli
updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & diffcomple & " WHERE BARCODE = '" & barcode & "'" 
Set rsupdqtadispart = dbConn.Execute(updqtadispart)
response.write updqtadispart

'response.end

response.write "ordine completo qui"

'response.end

else

' caso di ORDINE INCOMPLETO
Response.Write "caso di ORDINE INCOMPLETO"
'response.end

'aggiorno tabella assegnazioni
updqtai ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & nuovaqtaricevuta & ",  QTADIFF = " & diffcomple & ", STATOORDINE =0 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
Set xxx2 = dbConn.Execute(updqtai)
Response.Write updqtai

'response.end
'aggiorno tabella richieste
updqtarichcompl ="UPDATE ORD_RICHIESTE SET QTARICE = " & nuovaqtaricevuta & ",  QTADIFF = " & diffcomple & ", STATOORDINE =0 WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
Set yyy2 = dbConn.Execute(updqtarichcompl)
response.write updqtarichcompl

'response.end
'aggiorno tabella articoli
DIFF = 0
updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & DIFF & " WHERE BARCODE = '" & barcode & "'" 
Set rsupdqtadispart = dbConn.Execute(updqtadispart)
response.write updqtadispart

'response.end

response.write "ordine incompleto qui"
end if 

response.redirect "ord_gestione_articoliAS.asp"
'response.end




'response.end




'qtarichiestacomp = qtarichiesta2 * -1

'diffcomple = qtarichiesta2  + qtarichiestacomp

'Response.Write qtarichiestacomp
'response.write " +++ "
'Response.Write diffcomple

'datacompleto = Date()
'Response.Write datacompleto


'updqta2 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtarichiestacomp & ",  QTADIFF = " & diffcomple & ", STATOORDINE =1, DATACOMPLETO = '" & datacompleto & "'" & " WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
'Set xxx2 = dbConn.Execute(updqta2)
'Response.Write updqta2


'response.end

'diff = 0

'updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & DIFF & " WHERE BARCODE = '" & barcode & "'" 
'Set rsupdqtadispart = dbConn.Execute(updqtadispart)
'response.write updqtadispart

'updqtarichcompl ="UPDATE ORD_RICHIESTE SET QTARICE = " & qtarichiestacomp & ",  QTADIFF = " & diffcomple & ", STATOORDINE =1, DATACOMPLETO = '" & datacompleto & "'" & " WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
'response.write updqtarichcompl
'Set yyy2 = dbConn.Execute(updqtarichcompl)

'
'response.redirect "ord_gestione_articoliAS.asp?CODART=99"

'response.end
'' fare update su ord_articoli delle quantita disponibile

'response.write updqta2
'response.write "MINORE zero"

'Response.Write "   QTA DISP ARTICOLi:"
'response.write qtadisponibile





end if


'response.redirect "ord_gestione_articoliAS.asp"

'UPDATE table_name
'SET column1=value1,column2=value2,...
'WHERE some_column=some_value;

'response.end

Set rs = Nothing
Set rs1 = Nothing
Set rs2 = Nothing
Set dbconn = Nothing
%>