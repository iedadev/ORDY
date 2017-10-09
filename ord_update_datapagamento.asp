<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<!DOCTYPE html>
<html lang="it">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
</head>
</html>
<%

Dim sss, IP
IP = Request.ServerVariables("REMOTE_ADDR")
' Scrive Log - Inizio

dim dataordine

lc = request.form("learning_center")
no = request.form("nr_ordine")
datapagamento = request.form("data_pagamento")



response.write lc
response.write no
response.write datapagamento

'response.end

if lc <>"" then
sss = "UPDATE ORD_Richieste SET Datapagamento = " 
sss = sss & "'" & request("data_pagamento") & "'"
sss = sss & ",Statoordine= 0 "
sss = sss & ",INCARICO= 0 "
sss = sss & " WHERE LC = " & "'" & request("learning_center") & "' AND NUMORD =" & no
Set rs = dbConn.Execute(sss)
'response.write sss
'response.write "    a"
'response.end
response.redirect "ord_gestione_ordini_risultati.asp"
end if

if no <>"" then
sss = "UPDATE ORD_Richieste SET Datapagamento = " 
sss = sss & "'" & request("data_pagamento") & "'"
sss = sss & ",Statoordine= 0 "
sss = sss & ",INCARICO= 0 "
sss = sss & " WHERE Numord = " & request("nr_ordine")
Set rs = dbConn.Execute(sss)
'response.write sss
'response.write "    b"
'response.end
response.redirect "ord_gestione_ordini_risultati.asp"
end if

if lc ="" then
            if no ="" then
             sss = "UPDATE ORD_Richieste SET Datapagamento = " 
             sss = sss & "'" & request("data_pagamento") & "'"
             sss = sss & ",Statoordine= 0 "
              sss = sss & ",INCARICO= 0 "
             sss = sss & " WHERE Statoordine = 2"
             Set rs = dbConn.Execute(sss)
             'response.write sss
              'response.write "    c"
             'response.end
             response.redirect "ord_gestione_ordini_risultati.asp"
            end if
end if



'sss = "UPDATE ORD_Richieste SET Datapagamento = " 
'sss = sss & "'" & request("data_pagamento") & "'"
'sss = sss & " WHERE Numord = " & request("nr_ordine")


'response.write sss
'Set rs = dbConn.Execute(sss)
'response.end

sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Modificata Data Pagamento " & request("ord_idcli") & "', Now())"
Set rs = dbConn.Execute(sss)
' Scrive Log - Fine

Set rs = Nothing
Set DbConn = Nothing

response.redirect "ord_gestione_clienti.asp"
%>
