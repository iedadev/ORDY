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

If rs("Totale") = 0 Then

sss1 = "INSERT INTO SIM_Temp_MagicBox (IDKit, IDUser, Barcode, Categoria, Sottocategoria, Nomekit, Desckit, Pos, Qta, Stato, Data, In_Out) VALUES ('" & request("IDKit") & "', '" & session("id_usr") & "','" & request("BARCODE") & "','" & request("CATEGORIA") & "','" & request("SOTTOCATEGORIA") & "','" & request("NOMEKIT") & "','" & request("DESCKIT") & "','" & request("POS") & "','" & request("QTA") & "','" & request("STATO") & "', Now(),'IN')"
Set rs = dbConn.Execute(sss1)
response.write sss1
'response.end

sss2 = "INSERT INTO SIM_StoricoInventario (ID_User, Barcode, Data_in, Stato_IN) VALUES ('" & session("id_usr") & "','" & request("BARCODE") & "', Now(),'IN')"
Set rs = dbConn.Execute(sss2)
response.write sss2
'response.end

'sss4 = "INSERT INTO SIM_Last_MagicBox (IDKit, IDUser, Barcode, Categoria, Sottocategoria, Nomekit, Desckit, Pos, Qta, Stato, Data, In_Out) VALUES ('" & request("IDKit") & "', '" & session("id_usr") & "','" & request("BARCODE") & "','" & request("CATEGORIA") & "','" & request("SOTTOCATEGORIA") & "','" & request("NOMEKIT") & "','" & request("DESCKIT") & "','" & request("POS") & "','" & request("QTA") & "','" & request("STATO") & "', Now(),'IN')"
'Set rs = dbConn.Execute(sss4)
'response.write sss4
'response.end

else
sss3 = "UPDATE SIM_Temp_MagicBox SET IN_OUT = 'IN' WHERE IDUSER =" & session("id_usr") & " AND BARCODE ='" & request("BARCODE") & "'"
Set rs = dbConn.Execute(sss3)
response.write sss3

sss2 = "INSERT INTO SIM_StoricoInventario (ID_User, Barcode, Data_in, Stato_IN) VALUES ('" & session("id_usr") & "','" & request("BARCODE") & "', Now(),'IN')"
Set rs = dbConn.Execute(sss2)
response.write sss2
'response.end



End If

response.write "aaa"
'response.end 

Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

'response.write sss

Set rs = Nothing
Set DbConn = Nothing

'response.redirect "cb_esame_modifica.asp?ID_Storico_CB=" & request("ID_Storico_CB") & "&ID_Studente_CB=" & request("ID_Studente_CB")
response.redirect "sim_magicbox_barcode.asp"
%>

