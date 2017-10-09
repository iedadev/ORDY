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

Dim qtadisponibile, qtaricevuta, barcode,nrordine, diff

'estraggo barcode, numero ordine e qta disponibile a magazzino
qtadis ="SELECT BARCODE, QTADISP, CODART FROM ORD_Articoli WHERE CODART =" & request("CODART")
Set rsqta = dbConn.Execute(qtadis)

numord = request("NUMORD")
barcode = rsqta("BARCODE")
qtadisponibile = rsqta("QTADISP")

'estraggo numero di ordine dalla tabella delle assegnazioni
nrordine ="SELECT IDASS as NORD FROM ORD_Assegnazioni WHERE  CODART =" & request("CODART") & " AND STATOORDINE =0 AND NUMORD=" & request("numord") & " AND BARCODE = '" & barcode & "'" 
Set rsnord = dbConn.Execute(nrordine)
 
nrordine = rsnord("NORD")

'estraggo Stato ordine  Questa parte serve per estrarre il numero ordine, ma si possono avere piu articoli con lo numeri di ordine diversi quindi avree piu stati ordine
'stordine ="SELECT STATOORDINE FROM ORD_Assegnazioni WHERE  BARCODE = '" & barcode & "'" 

'modifica 09092016 inserendo anche come parametro numord per avere uno stato ordine univoco
stordine ="SELECT STATOORDINE FROM ORD_Assegnazioni WHERE  NUMORD=" & request("numord") & " AND BARCODE = '" & barcode & "'" 
Set rsstord = dbConn.Execute(stordine)
'response.write stordine

'Response.Write "   NRORDINE ASSEGNAZIONE:"
'nrordine = rsnord("NORD")
'response.write nrordine

'estraggo qtarichiesta dal LC
qtarichiesta2 ="SELECT QTARICH,QTARICE FROM ORD_Assegnazioni WHERE IDASS = " & nrordine & " AND NUMORD = " & numord & " AND BARCODE = '" & barcode & "'" 
Set rsqtarichiesta = dbConn.Execute(qtarichiesta2)
qtarichiesta= rsqtarichiesta("QTARICH")
qtaricevuta= rsqtarichiesta("QTARICE")

'calcolo la disponibilità a magazzino
'qta disponibile a magazzino - quantita richiesta dal LC
'diff = qtadisponibile - qtarichiesta
'29092016
diff = qtadisponibile - qtarichiesta + qtaricevuta
response.write diff
response.write "-> differenza tra qta richiesta e qta disponibile"
'response.end

'se la differenza è positiva
if diff >= 0 then 
                'aggiorno tabella Assegnazioni assegnando la qta ricevuta = alla qta richiesta e la qtadiff con la qta rimanente disponibile a magazzino
                updqta1 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtarichiesta & ",  QTADIFF = " & diff & ", STATOORDINE =1 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                Set xxx1 = dbConn.Execute(updqta1)
                '' fare update su ord_articoli delle quantita disponibile
                'response.write updqta1

                'aggiorno tabella Richieste assegnando la qta ricevuta = alla qta richiesta e la qtadiff con la qta rimanente disponibile a magazzino ed aggiorno lo stato dell'ordine a COMPLETO
                updqtarich1 ="UPDATE ORD_RICHIESTE SET QTARICE = " & qtarichiesta & ",  QTADIFF = " & diff & ", STATOORDINE =1, DATACOMPLETO=Date() WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                Set yyy1 = dbConn.Execute(updqtarich1)

                'Aggiorno la tabella Articoli (Magazzino) assegnando la qta diponibile  ottenuta dalla differenza tra la richiesta e la disponibilità precedente a magazzino
                updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & DIFF & " WHERE BARCODE = '" & barcode & "'" 
                Set rsupdqtadispart = dbConn.Execute(updqtadispart)

                'reindirizzamento alla pagina 
                response.redirect "ord_gestione_articoliAS.asp?CODART=1"

else

'updqta2 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtadisponibile & ",  QTADIFF = " & diff & ", STATOORDINE =0 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
'modfica 09092016 
'diff2= qtarichiesta* -1

response.write " adesso sono qui"
response.write qtadisponibile
'response.end

'se la diff<0 assegno la qta ricevuta 
                    if qtadisponibile > 0 then
                                qtarice = qtadisponibile + qtaricevuta
                               ' diff2 = qtadisponibile-qtarichiesta
                                'aggiorno tabella Assegnazioni assegnando la qta ricevuta = alla qta richiesta e la qtadiff con la qta rimanente disponibile a magazzino
                                'updqta2 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE =0,  QTADIFF = " & diff2 & ", STATOORDINE =0 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                                'modifica16092016
                                updqta2 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtarice & ",  QTADIFF = " & diff & ", STATOORDINE =0 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'"
                                Set xxx2 = dbConn.Execute(updqta2)
                                response.write updqta2
                               ' response.end

                                'aggiorno tabella Richieste assegnando la qta ricevuta = alla qta richiesta e la qtadiff con la qta rimanente disponibile a magazzino
                                'updqtarich2 ="UPDATE ORD_RICHIESTE SET QTARICE = " & qtadisponibile & ",  QTADIFF = " & diff & ", STATOORDINE =0 WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                                'modfica 09092016
                                'updqtarich2 ="UPDATE ORD_RICHIESTE SET QTARICE = 0,  QTADIFF = " & diff2 & ", STATOORDINE =0 WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                                'modifica 15092016
                                updqtarich2 ="UPDATE ORD_RICHIESTE SET QTARICE =  " & qtarice & ",  QTADIFF = " & diff & ", STATOORDINE =0 WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                                response.write updqtarich2
                                Set yyy2 = dbConn.Execute(updqtarich2)
                                'response.end

                                'aggiorno tabella Articoli (Magazzino) assegnando la qta disponibile = alla somma negativa qta rimanente disponibile a magazzino e della qta richiesta
                                'updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & diff2 & " WHERE BARCODE = '" & barcode & "'" 
                                '29092016
                                nuovaqtadisp=  qtadisponibile + qtaricevuta - qtarichiesta 
                                updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & nuovaqtadisp & " WHERE BARCODE = '" & barcode & "'" 
                                Set rsupdqtadispart = dbConn.Execute(updqtadispart)
                                response.write updqtadispart
                                response.write " passo di qui XXXX"

                               'response.end

                                response.redirect "ord_gestione_articoliAS.asp?CODART=1"



                    else
                                'modifica15092016
                                'qtarice = qtadisponibile
                                diff3 = qtadisponibile-qtarichiesta

                                updqta2 ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtaricevuta & ",  QTADIFF = " & diff3 & ", STATOORDINE =0 WHERE IDASS = " & nrordine & " AND NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'"
                                Set xxx2 = dbConn.Execute(updqta2)
                                'modifica 15092016
                                'aggiorno tabella Richieste assegnando la qta ricevuta =0 e la qtadiff con la somma negativa qta rimanente disponibile a magazzino e della qta richiesta
                                updqtarich2 ="UPDATE ORD_RICHIESTE SET QTARICE =  " & qtaricevuta & ",  QTADIFF = " & diff3 & ", STATOORDINE =0 WHERE NUMORD =  " & numord & " AND BARCODE = '" & barcode & "'" 
                                response.write updqtarich2
                                Set yyy2 = dbConn.Execute(updqtarich2)

                                'aggiorno tabella Articoli (Magazzino) assegnando la qta disponibile = alla somma negativa qta rimanente disponibile a magazzino e della qta richiesta
                                updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & diff3 & " WHERE BARCODE = '" & barcode & "'" 
                                Set rsupdqtadispart = dbConn.Execute(updqtadispart)
                                response.write updqtadispart
                                'response.redirect "ord_gestione_articoliAS.asp?CODART=1"
                                response.write "sono passato di qui ..."
                                'response.end
                    end if

'updqtadispart ="UPDATE ORD_ARTICOLI SET QTADISP = " & DIFF & " WHERE BARCODE = '" & barcode & "'" 
'Set rsupdqtadispart = dbConn.Execute(updqtadispart)
'response.write updqtadispart

'response.redirect "ord_gestione_articoliAS.asp?CODART=1"

end if
'response.end

response.redirect "ord_gestione_articoliAS.asp?CODART=99"

'UPDATE table_name
'SET column1=value1,column2=value2,...
'WHERE some_column=some_value;

'response.end

Set rs = Nothing
Set rs1 = Nothing
Set rs2 = Nothing
Set dbconn = Nothing
%>