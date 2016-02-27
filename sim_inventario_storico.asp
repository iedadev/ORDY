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


'response.write " & request("BARCODE") & "
'response.end

sss1 = "INSERT INTO SIM_StoricoInventario (ID_User,Barcode, Data_In, Stato_In) VALUES ('" & session("id_usr") & "','" & request("BARCODE") & "',Now(),'IN')"

Set rs = dbConn.Execute(sss1)
'response.write sss1
'response.end 

' Scrive Log - Fine

'response.write sss

Set rs = Nothing
Set DbConn = Nothing
%>