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
If session("usr") = "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio


sss = "UPDATE SIM_KIT_VALIDARE SET VERIFICATO = 1 WHERE IDKIT = " & request("IDKIT")
'response.write sss
Set rs = dbConn.Execute(sss)
'response.end


sss = "INSERT INTO SIM_Kit (IDMcat, IDCat, IDScat, Barcode, Nomekit, Desckit, Pos, Qta, "
sss = sss & "DataIn, IDStato, Prz, Keywords) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
sss = sss & request("IDMCat") & ", "
sss = sss & request("IDCat") & ", "
sss = sss & request("IDScat") & ", "
sss = sss & "'" & request("barcode") & "', "
sss = sss & "'" & request("nomekit") & "', "
sss = sss & "'" & request("descrizione") & "', "
sss = sss & request("posizione") & ", "
sss = sss & request("qta") & ", "
sss = sss & "'" & request("datain") & "', "
sss = sss & request("Stato") & ", "
sss = sss & request("prz") & ", "
sss = sss & "'" & request("keywords") & "')"

Response.write sss
'Response.write request("kit_Barcode")
'response.end

Set rs = dbConn.Execute(sss)



sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Validato Nuovo Kit  " & request("IDKIT") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "sim_kit_gestione_modifica.asp"
%>