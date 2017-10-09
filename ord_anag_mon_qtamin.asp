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

'response.write request("codart")
'response.write request("qta_arr")
'response.write request("NumOrd")
response.write request ("barcode")

CODE= request ("CODE")
BRC= request ("BARCODE")
'response.write "////"
'RESPONSE.WRITE CODE
response.write  "*****"
'RESPONSE.WRITE BRC

if request("code")<> "bar" then
s="SELECT barcode FROM ord_articoli WHERE CODART=" & brc 
Set rsb = dbConn.Execute(s)
response.write s

s1 = "INSERT INTO ORD_Monitoring (Codart, Barcode, Nomart,Qtamin, Datacreated) VALUES ( " & request("codart") & " , '" & rsb("barcode") & "' , '" & request("nomart") & "' , " & request("qta_min") & ", Date())"
response.write s1
Set rs1 = dbConn.Execute(s1)

else

s1 = "INSERT INTO ORD_Monitoring (Codart, Barcode, Nomart,Qtamin, Datacreated) VALUES ( " & request("codart") & " , '" & request("barcode") & "' , '" & request("nomart") & "' , " & request("qta_min") & ", Date())"
response.write s1
Set rs1 = dbConn.Execute(s1)
end if

'response.end

IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Inserimento nuovo articolo da monitorare " & request("Codart") & "', Date())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

'NumOrdine = request("NumOrd")

'response.write NumOrdine
'response.end

response.redirect "ord_anag_mon.asp"                             
%>

