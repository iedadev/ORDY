<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->

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

'If session("ruolo") <> "A" Then
  '  response.redirect "hd_todo.asp"
'End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO SIM_Kit (IDMcat, IDCat, IDScat, Barcode, Nomekit, Desckit, Pos, Qta, "
sss = sss & "DataIn, IDStato, Prz, Keywords,VERIFICATO) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
sss = sss & request("kit_IDMCat") & ", "
sss = sss & request("kit_IDCat") & ", "
sss = sss & request("kit_IDScat") & ", "
sss = sss & "'" & request("kit_Barcode") & "', "
sss = sss & "'" & request("kit_nomekit") & "', "
sss = sss & "'" & request("kit_descrizione") & "', "
sss = sss & request("kit_IDPosizione") & ", "
sss = sss & request("kit_quantita") & ", "
sss = sss & "'" & request("Kit_Data_Acquisto") & "', "
sss = sss & request("kit_IDStato") & ", "
sss = sss & request("Kit_prezzo") & ", "
sss = sss & "'" & request("kit_keyword1") & "', "
sss = sss & "1)"

Response.write sss
'Response.write request("kit_Barcode")
'response.end

Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDKit) as nuovo FROM SIM_Kit"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuovo Kit da Validare " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.redirect "sim_schedakit_validare.asp?IDKit=" & NuovoID & "&origin=new"
response.redirect "sim_kit_creauser.asp"

set rs = Nothing
set DbConn = Nothing
%>