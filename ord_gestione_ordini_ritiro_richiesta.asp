<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

codicearticolo= request("codart")
'response.write codicearticolo
'response.end

'numeroordine = request ("nr_ordine")
'response.write numeroordine
'response.end


'errorecode =  request ("nocode")
'response.write "non valorizzo errorecode"
'response.write errorecode
'response.end

snomeart="SELECT NOMART FROM ORD_ARTICOLI WHERE CODART = " & request("CODART") 
Set rsna = dbConn.Execute(snomeart)

nomearticolo= rsna("NOMART")
'response.write nomearticolo
'response.end

ss = "INSERT INTO ORD_Ritiri_Manuali (Codart, LC,DataRitiro,QtaRitirata) VALUES ('" & request("codart") & "','" & request("ord_lc") & "','" & request("Data_Ritiro") & "','" & request("qta_ric") & "')"
Set rs1 = dbConn.Execute(ss)
response.write ss
'response.end
'response.redirect "ord_gestione_articoliLC.asp"

'calcolo la qta presente in magazzino
qtadispmagazzino="SELECT QTADISP FROM ORD_ARTICOLI WHERE CODART = " & request("CODART") 
Set qtam = dbConn.Execute(qtadispmagazzino)
response.write qtadispmagazzino
'response.end

qtamagazzino = qtam("QTADISP")
qtaritirata = request("qta_ric")
nuovaqtamagazzino =  qtamagazzino - qtaritirata
response.write "nuova qta disponibile"
response.write nuovaqtamagazzino

'aggiorno la qta presente in magazzino
updmagazzino="UPDATE ORD_ARTICOLI SET QTADISP =" & nuovaqtamagazzino & " WHERE CODART = " & request("CODART") 
Set upma = dbConn.Execute(updmagazzino)
response.write updmagazzino
'response.end

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Kit " & request("CODART") & " Consegnato a mano al LC " & request("ord_lc") & " ', Now())"
Set rs = dbConn.Execute(sss)
response.write sss
' Scrive Log - Fine

response.redirect "ord_gestione_ordini_ritiro_start.asp"

'response.end


'ins =  "INSERT INTO ORD_COMUNICAZIONI (Data,LC,Statoordine,nrordine,incarico) VALUES (Date(), '" & request("ord_lc") & "', 1, " & request("nr_ordine") & ",0)"
'Set rs3 = dbConn.Execute(ins)
'response.write ins

'response.end

%>

