<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="config.asp"-->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main.asp"
End If

Dim sss, FileName

i = 1

FileName="Valorizzazione_Magazzino.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 

sss = "SELECT * FROM ORD_VALORIZZAZIONI WHERE 1=1 "

session("sss") = sss

Set rs = dbConn.Execute(sss)

response.write sss
'response.write ""
response.write s1
'response.write ""

'response.end

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--#include virtual file="include/title.asp"-->
</head>
<body>
<p><b><font face='Calibri'>Report Valorizzazioni Magazzino</font></b></p>
<p><b><font face='Calibri'>Data Stampa Report <%=Date()%></font></b></p>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Data Valorizzazione</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Numero articoli</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Numero Pezzi</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Valore articoli</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("DatVal") %></td>
		<td><%= rs("Nrartval") %></td>
        <td><%= rs("TotUni") %></td>
        <td><%= rs("TotVal") %></td>
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