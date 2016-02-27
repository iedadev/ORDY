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

If session("id_usr")= "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
    'response.redirect "hd_todo.asp"
'End If

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

sss = "INSERT INTO SIM_Temp_MagicBox (IDKit, IDUser, Barcode, Categoria, Sottocategoria, Nomekit, Desckit, Pos, Qta, Stato, Data) VALUES ('" & request("IDKit") & "', '" & session("id_usr") & "','" & request("BARCODE") & "','" & request("CATEGORIA") & "','" & request("SOTTOCATEGORIA") & "','" & request("NOMEKIT") & "','" & request("DESCKIT") & "','" & request("POS") & "','" & request("QTA") & "','" & request("STATO") & "', Now())"
'response.write sss
'response.end

Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.write sss

Set rs = Nothing
Set DbConn = Nothing

'response.redirect "cb_esame_modifica.asp?ID_Storico_CB=" & request("ID_Storico_CB") & "&ID_Studente_CB=" & request("ID_Studente_CB")
'response.redirect "sim_inventario_magicbox.asp" 
response.redirect "sim_inventario_ricerca.asp"
%>

