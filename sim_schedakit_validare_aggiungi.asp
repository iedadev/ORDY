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

If session("ruolo") <> "A" Then
    response.redirect "hd_todo.asp"
End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO SIM_KIT (IDCat,Sottocategoria,DataCreated) VALUES ('" & request("sim_IDCat") & "','" & request("sim_sottocategoria") & "',Now())"

'sss = sss & " DataCreated) VALUES ("
'sss = sss & "[Note], Attivo, Datains, Esportato) VALUES ("
'sss = sss & "'" & ModificaApici(trim(request("Origine"))) & "', "
'sss = sss & request("sim_macrocategoria") & 
'sss = sss & "Now()")"

'Response.write sss
'Response.write request("kit_Barcode")
'response.end

Set rs = dbConn.Execute(sss)

sss = "SELECT MAX(IDScat) as nuovo FROM SIM_sottocategorie"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuova Sottocategoria " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_gestione_sottocategorie.asp"

set rs = Nothing
set DbConn = Nothing
%>