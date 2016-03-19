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
   ' response.redirect "hd_todo.asp"
'End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

s="SELECT COUNT(STATOLETTURA) as TotaleConferma FROM SIM_Comunicazioni WHERE STATOLETTURA = 0 AND IDCOM=" & request("IDCOM")
'Response.write s
'Response.end

Set rs = dbConn.Execute(s)

if rs("TotaleConferma")= 1 Then
                                    
       response.redirect "sim_comunicazione_archiviomail.asp"
Else

ss= "INSERT INTO SIM_Comunicazioni_Archivio (DATA,OGGETTO,TESTO,MITTENTE,DESTINATARIO,STATOLETTURA) SELECT DATA,OGGETTO,TESTO,MITTENTE,DESTINATARIO,STATOLETTURA FROM SIM_Comunicazioni WHERE IDCOM =" & request("IDCOM")
Set rs = dbConn.Execute(ss)


s2 = "DELETE FROM SIM_Comunicazioni WHERE IDCOM = " & request("IDCOM")
Set rs = dbConn.Execute(s2)

'Response.write sss
'Response.end

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Archiviata Mail " & request("IDCOM") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_comunicazione_archiviomail.asp"

End If

set rs = Nothing
set DbConn = Nothing
%>