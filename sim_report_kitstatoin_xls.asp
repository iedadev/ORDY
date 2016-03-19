<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, FileName

i = 1

FileName="Report_KitStatoIn.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 


        sss = "SELECT BARCODE, IDUSER, DATA, IN_OUT"
        sss = sss & " FROM SIM_Temp_MagicBox" 
        sss = sss & " WHERE IN_OUT = 'IN' ORDER BY IDUSER DESC" 

        session("sss") = sss



response.write sss
'response.write ""
response.write s1
'response.write ""

'response.end

Set rs = dbConn.Execute(sss)
Set rs1 = dbConn.Execute(s1)
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--#include virtual file="include/title.asp"-->
</head>
<body>
<p><b><font face='Calibri' size='4'>Report Kit non scaricati</font></b></p>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Barcode</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">User</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Data</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("barcode") %></td>
		<td><%= rs("iduser") %></td>
		<td><%= rs("data") %></td>
		</tr>
	<%
	rs.MoveNext
	Wend
	%>
</table>
</body>
</html>
<%
Set dbconn = nothing
Set rs = nothing
Response.flush 
Response.end
%>