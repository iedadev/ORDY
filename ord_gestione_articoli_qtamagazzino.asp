<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, IP,qtaarr,qtatot, qtadisp

'response.write request("codart")
'response.write request("qta_arr")
'response.write request("NumOrd")

'response.write "XXX"

s1 = "INSERT INTO ORD_Arrivi (Codart, Qtaarr, NumOrd, Dataarr) VALUES ( " & request("codart") & " , " & request("qta_arr") & " , " & request("NumOrd") & " , Now())"
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

'response.write  qtadisp

Qtatot = qtadisp + qtaarr

'response.write  qtatot

'nrord = request("nrordine")

'response.write  nrord
'response.end

IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

s3 = "UPDATE ORD_articoli SET Qtadisp = " & Qtatot 
s3 = s3 & ", Qtamin = " & request("qta_min") 
s3 = s3 & " WHERE Codart = " & request("Codart")

response.write s3
Set rs = dbConn.Execute(s3)
'response.end


sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Inserimento nuovo arrivo " & request("Codart") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

NumOrdine = request("NumOrd")

response.write NumOrdine
'response.end

response.redirect "ord_gestione_articoliINbis.asp?&codart=" & request("Codart")
%>