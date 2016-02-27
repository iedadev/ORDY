<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%

Dim sss, IP, sss1
 
IP = Request.ServerVariables("REMOTE_ADDR")
session("sss") = ""
iduser=session("id_usr")

'response.write iduser

'sss1 = "DELETE FROM SIM_Temp_MagicBox WHERE IDUser ='" & iduser & "'" 'vecchia versione

'fare controllo che tutti i kit abbiano IN_OUT valorizzato ad Out altrimenti segnalare con alert e prevedere mail


sss1 = "DELETE FROM SIM_Temp_MagicBox WHERE IDUser=" & iduser & " AND IN_OUT ='OUT'"
Set rs1 = dbConn.Execute(sss1)
'response.write sss1
'response.end

' Scrive Log - Inizio
		sss = "INSERT INTO SIM_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Logoff', Now())"
        Set rs = dbConn.Execute(sss)
        
' Scrive Log - Fine
session("usr") = ""
session("pwd") = ""
session("ruolo") = ""

'response.end

response.redirect "default.asp"
%>

