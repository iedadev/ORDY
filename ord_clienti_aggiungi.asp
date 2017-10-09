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

sss = "INSERT INTO ORD_Clienti (Nomcli,Refcli,Indcli,Emacli,Telcli,DataCreated,Stacli) VALUES ('" & request("ord_nomcli") & "','" & request("ord_refcli") & "','" & request("ord_indcli") & "','" & request("ord_emacli") & "','" & request("ord_telcli") & "',Now(),1)"
Set rs1 = dbConn.Execute(sss)

sss = "SELECT MAX(IDcli) as nuovo FROM ORD_Clienti"
Set rs2 = dbConn.Execute(sss)
NuovoID = rs2("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Cliente " & NuovoID & "', Now())"
Set rs3 = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_clienti.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>