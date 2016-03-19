<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--#include virtual file="include/title.asp"-->
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
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

sss2 = "SELECT COUNT(BARCODE) as TOTALE FROM SIM_Temp_MagicBox WHERE IDUSER = " & session("id_usr") & " AND BARCODE ='" & request("BARCODE") & "'"
'response.write sss2
Set rs2 = dbConn.Execute(sss2)
'response.end

    If rs2("Totale") = 0 Then
                'response.write "Il totale è 0"
		        'response.redirect "sim_magicbox_barcode_start.asp"
                sss = "INSERT INTO SIM_Temp_MagicBox (IDKit, IDUser, Barcode, Categoria, Sottocategoria, Nomekit, Desckit, Pos, Qta, Stato, Data) VALUES ('" & request("IDKit") & "', '" & session("id_usr") & "','" & request("BARCODE") & "','" & request("CATEGORIA") & "','" & request("SOTTOCATEGORIA") & "','" & request("NOMEKIT") & "','" & request("DESCKIT") & "','" & request("POS") & "','" & request("QTA") & "','" & request("STATO") & "', Now())"
                Set rs = dbConn.Execute(sss)
                'response.write sss
                'response.end
    Else
                'response.write "Il totale è diverso 0"
                response.redirect "sim_inventario_ricerca_risultati.asp?CTRBAR=XXX"

                %>
    <%End If%>

<%

' Scrive Log - Fine

'response.write sss
'response.end

Set rs = Nothing
Set DbConn = Nothing

'response.redirect "cb_esame_modifica.asp?ID_Storico_CB=" & request("ID_Storico_CB") & "&ID_Studente_CB=" & request("ID_Studente_CB")
'response.redirect "sim_inventario_magicbox.asp" 
response.redirect "sim_inventario_ricerca_risultati.asp"
%>

