<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
Dim sss, FileName

i = 1

nrordine = request("NUMORD")

'fare update nella tabella mettendo 1 sul campo mail

response.write nordine
response.end

FileName="estrazione.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 

sss = "SELECT * FROM SIM_Magazzino"
session("sss") = sss

'response.write sss3

Set rs = dbConn.Execute(sss)
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--#include virtual file="include/title.asp"-->
</head>
<body>
<p><b><font face='Calibri' size='4'>Report Valore Magazzino</font></b></p>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Data Estrazione</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Totale(€)</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Nr. Articoli</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("DataEstrazione") %></td>
		<td><%= rs("ValoreMagazzino") %></td>
		<td><%= rs("NrArticoli") %></td>
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
