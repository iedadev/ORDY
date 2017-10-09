<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%

Dim sss, IP, sss1
 
IP = Request.ServerVariables("REMOTE_ADDR")
session("sss") = ""
iduser=session("id_usr")


' Scrive Log - Inizio
		sss = "INSERT INTO ORD_Logs (IPRemoto, Utente, Operazione, DataOperazione) VALUES ('" & IP & "', '" & session("usr") & "', 'Logoff', Now())"
        Set rs = dbConn.Execute(sss)
        
' Scrive Log - Fine
session("usr") = ""
session("pwd") = ""
session("ruolo") = ""

'response.end

response.redirect "default.asp"
%>

