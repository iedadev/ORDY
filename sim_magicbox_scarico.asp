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

If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
    'response.redirect "hd_todo.asp"
'End If

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss="SELECT COUNT (*) as Totale FROM SIM_Temp_MagicBox WHERE IDUSER =" & session("id_usr") & " AND BARCODE ='" & request("BARCODE") & "'"
Set rs = dbConn.Execute(sss)
response.write sss 

'If rs("Totale") = 0 Then  Prevedere Alert per segnalare che non è possibile scaricare un kit che non si ha nella magicbox

sss2 = "INSERT INTO SIM_StoricoInventario(ID_User, Barcode, Data_out, Stato_OUT) VALUES ('" & session("id_usr") & "','" & request("BARCODE") & "', Now(),'OUT')"
Set rs = dbConn.Execute(sss2)
response.write sss2
'response.end

sss = "UPDATE SIM_Temp_MagicBox SET IN_OUT = 'OUT' WHERE IDUSER =" & session("id_usr") & " AND BARCODE ='" & request("BARCODE") & "'"
response.write sss
'response.end

Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.write sss

Set rs = Nothing
Set DbConn = Nothing

'response.redirect "cb_esame_modifica.asp?ID_Storico_CB=" & request("ID_Storico_CB") & "&ID_Studente_CB=" & request("ID_Studente_CB")
'response.redirect "sim_inventario_magicbox.asp" 
response.redirect "sim_magicbox_barcode.asp"
%>

