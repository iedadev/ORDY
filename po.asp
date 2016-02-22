<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<%

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

Dim sss, i

'Set rs = dbConn.Execute("UPDATE HD_Demos Set ID_Teacher = 10 WHERE ID_Teacher = 34")

'response.write dateadd("h",-27,"18/07/2010 03:02:00")

%>