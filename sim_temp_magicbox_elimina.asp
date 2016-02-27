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

iduser=session("id_usr")
response.write iduser

sss = "DELETE FROM SIM_Temp_MagicBox WHERE BARCODE='"& request("BARCODE") & "'AND IDKIT="& request("IDKIT") & " AND IDUSER =" &iduser

'response.write sss
'response.end

Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.write sss

Set rs = Nothing
Set DbConn = Nothing

'response.redirect "cb_esame_modifica.asp?ID_Storico_CB=" & request("ID_Storico_CB") & "&ID_Studente_CB=" & request("ID_Studente_CB")
response.redirect "sim_inventario_ricerca.asp" 
%>

