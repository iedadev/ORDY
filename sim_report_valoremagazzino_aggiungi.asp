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
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "hd_todo.asp"
End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio


sss = "INSERT INTO SIM_Magazzino (DataEstrazione, ValoreMagazzino, NrArticoli) VALUES (Date(),"&"" & request("ValoreMagazzino") & ","&"" & request("NrArticoli") & ")"

'sss = sss & " DataCreated) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
'sss = sss & request("sim_macrocategoria") & 
'sss = sss & "Now()")"

Response.write sss
'Response.write request("ValoreMagazzino")
'Response.write request("NrArticoli")

'response.end

Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDmagazzino) as nuovo FROM SIM_Magazzino"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Resoconto Mgazzino " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_report_valoremagazzino.asp"

set rs = Nothing
set DbConn = Nothing
%>