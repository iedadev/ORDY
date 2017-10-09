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
    

'17092016 viene memorizzata in una variabile passata dalla pagina precedente(QTAORIGINALE), e aggiunta la nuova qta inputata

QTAORIGINALE = request("ord_qta_orig")
QTAARRIVATA = request("ord_qta")

'response.write QTAORIGINALE
'response.write QTAARRIVATA

'response.end

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

'aggiorno tabella ORD_ARRIVI da Isr

sss = "UPDATE ORD_Arrivi SET Numord = " 
sss = sss & "'" & request("ord_numord") & "'"
sss = sss & ", Codart = '" & request("ord_cod") & "'"
sss = sss & ", Qtaarr = '" & request("ord_qta") & "'"
sss = sss & ", Dataarr = '" & request("ord_data") & "'"
sss = sss & " WHERE IDArr= " & request("ord_idarr")

'response.write sss
Set rs = dbConn.Execute(sss)
' response.end

'17092016 estraggo dalla tabella ORD_ARTICOLI la qta presente per l'articolo selezionato e lo aggiungo alla qta precedentemente inserita con l'ordine
'in caso di storno sarà sufficiente inserire una quantità negativa
sss = " SELECT QTADISP FROM ORD_Articoli WHERE Codart =" & request("ord_cod")
'response.write sss
Set rs = dbConn.Execute(sss)
'response.end

QTADEF = CInt(QTAORIGINALE) + CInt(QTAARRIVATA)
'response.write QTADEF
'response.end

'17092016 aggiorno la qta anche nella tabella ORD_ARTICOLI (Magazzino)

sss = "UPDATE ORD_Articoli SET Qtadisp = '"
sss = sss & QTADEF & "'"
sss = sss & " WHERE Codart= " & request("ord_cod")

'response.write sss
Set rs= dbConn.Execute(sss)
'response.end


sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Articolo Modificato " & request("ord_cod")  & " Ordine " & request("ord_numord")   & " Qta inserita in Arrivi " & request("ord_qta")   & " Qta inserita in Articoli " & QTADEF  & "', Now())"
'response.write sss
Set rs = dbConn.Execute(sss)
'response.end

' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

' response.redirect "ord_gestione_ordini_risultati.asp?IDStatoOrdine=2"
response.redirect "ord_gestione_articoliIN.asp?nrordine=" & request("ord_numord")
'response.redirect "ord_gestione_articoli_modifica.asp"
%>