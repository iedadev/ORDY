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

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio


sss = "UPDATE SIM_KIT SET VERIFICATO = 0 WHERE IDKIT = " & request("IDKIT")
response.write sss
'response.end
Set rs = dbConn.Execute(sss)

'sss = "INSERT INTO SIM_Kit (IDMcat, IDCat, IDScat, Barcode, Nomekit, Desckit, Pos, Qta, "
'sss = sss & "DataIn, IDStato, Prz, Keywords) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
'sss = sss & " Barcode = '" & request("Barcode") & "'"
'sss = sss & ", Nomekit = '" & request("Nomekit") & "'"
'sss = sss & ", Desckit = '" & request("desckit") & "'"
'sss = sss & ", IDMCat = " & request("IDMCat")
'sss = sss & ", IDCat = " & request("IDCat")
'sss = sss & ", IDScat = " & request("IDScat")
'sss = sss & ", IDStato = " & request("IDStato")
'sss = sss & ", Pos = '" & request("Posizione") & "'"
'sss = sss & ", Qta = " & request("qta")
'sss = sss & ", Prz = " & request("Prz")
'sss = sss & ", Datain = '" & request("Datain") & "'"
'sss = sss & ", Keywords = '" & ModificaApici(Trim(request("Keywords"))) & "')"

'Response.write sss
'Response.write request("kit_Barcode")
'response.end

'Set rs = dbConn.Execute(sss)



sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Validato Nuovo Kit  " & request("IDKIT") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "sim_magicbox_segnalazione_admin.asp"
%>