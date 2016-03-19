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

iduser = session("id_usr")
'response.write iduser

'If session("ruolo") <> "A" Then
'    response.redirect "hd_todo.asp"
'End If

Dim sss, IP, NuovoID
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

SEGNAL = request("SEGNAL")

    if SEGNAL=1 then
        'response.write "XXX"
                sss3 = "INSERT INTO SIM_Comunicazioni (DATA,OGGETTO, TESTO, MITTENTE, DESTINATARIO, STATOLETTURA) VALUES ("
                sss3 = sss3 & "Date()" & ", "
                sss3 = sss3 & "3" & ", "
                sss3 = sss3 & "'" & "Il Kit con barcode " & request("OGGETTO") & " risulta essere ancora in tuo possesso dal " & request("STATOIN") & " , potresti effettuare un controllo?', "
                sss3 = sss3 & "35" & ", "
                sss3 = sss3 & request("USER") & ", "
                sss3 = sss3 & "0" & ")"
        response.write sss3
        'response.end
                Set rs = dbConn.Execute(sss3)
        response.redirect "sim_report_kitstatoin_result.asp?SEGNAL=2"
else

 response.write "passo di qui"

sss = "INSERT INTO SIM_Comunicazioni (Data, Oggetto, Testo, Mittente, Destinatario, Statolettura) VALUES ('" & request("data_com") & "','" & request("oggetto_com") & "','" & request("desc_com") & "','" & iduser & "','" & request("sendto_com") & "',0)"

Set rs = dbConn.Execute(sss)
end if
Response.write sss
'Response.write request("kit_Barcode")
'response.end



sss = "SELECT MAX(IDCOM) as nuovo FROM SIM_Comunicazioni"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")

sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Aggiunto Nuova Comunicazione " & NuovoID & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

response.redirect "sim_comunicazione.asp"

set rs = Nothing
set DbConn = Nothing
%>