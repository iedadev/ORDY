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
    response.redirect "main.asp"
End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO SIM_Kit_SEGNALAZIONI (ID_KIT, ID_USR, BARCODE, NOTE, DATAIN VALUES ("
'sss = sss & "DataIn, IDStato, Prz, Keywords) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
sss = sss & request("IDKIT") & ", "
sss = sss & request("IDUSR") & ", "
sss = sss & "'" & request("BARCODE") & "', "
sss = sss & "'" & request("NOTE") & "', "
sss = sss & "'" & request("DATAIN") & "')"

Response.write sss
'Response.write request("kit_Barcode")
'response.end

Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDKit) as nuovo FROM SIM_Kit"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Kit " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_schedakit.asp?IDKit=" & NuovoID & "&origin=new"

set rs = Nothing
set DbConn = Nothing
%>