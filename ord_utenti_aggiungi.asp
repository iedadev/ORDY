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

sss = "INSERT INTO ORD_User (usr,pwd,ruolo,attivo,DataCreated) VALUES ('" & request("user_lc") & "','" & request("user_pwd") & "','" & request("user_ruolo") & "','" & request("user_at") & "',Now() )"
Set rs1 = dbConn.Execute(sss)

sss = "SELECT MAX(ID_usr) as nuovo FROM ORD_User"
Set rs2 = dbConn.Execute(sss)
NuovoID = rs2("nuovo")

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Cliente " & NuovoID & "', Now())"
Set rs3 = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "ord_gestione_utenti.asp?New=1"

set rs = Nothing
set DbConn = Nothing
%>