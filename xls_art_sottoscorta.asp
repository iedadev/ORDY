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

FileName="Articoli_Sottoscorta.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 

sss = "SELECT * FROM ORD_Articoli WHERE ATTART ='Y' AND Qtadisp < Qtamin "

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
<p><b><font face='Calibri'>Report Articoli Sottoscorta</font></b></p>
<p><b><font face='Calibri'>Data Estrazione <%=Date()%></font></b></p>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Codice</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Barcode</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Nome</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Prezzo</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Qta Disponibile</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Qta Minima</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("Codart") %></td>
		<td><%= rs("Barcode") %></td>
		<td><%= rs("Nomart") %></td>
        <td><%dim Numero
               Numero = rs("Przart")
               Response.write "Euro: " & FormatNumber (Numero,2,,,-1)%></td>
        <td><%= rs("Qtadisp") %></td>
        <td><%= rs("Qtamin") %></td>
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