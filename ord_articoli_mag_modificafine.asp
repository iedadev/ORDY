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

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "UPDATE ORD_ARTICOLI SET Barcode = " 
sss = sss & "'" & request("art_bar") & "'"
sss = sss & ", Codart = '" & request("art_cod") & "'"
sss = sss & ", Nomart =  '" & request("art_nom") & "'"
sss = sss & ", Przart = '" & request("art_prz") & "'"
sss = sss & ", Attart = '" & request("art_sta") & "'"
sss = sss & ", Qtadisp ='" & request("art_dis") & "'"
sss = sss & ", Qtamin ='" & request("art_qta") & "'" 
sss = sss & " WHERE IDart= " & request("art_idart")

'response.write sss
Set rs1 = dbConn.Execute(sss)
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificato Magazzino " & request("ord_idmag") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set rs1 = Nothing
Set DbConn = Nothing

response.redirect "ord_articoli_elenco.asp?MOD=1"
%>