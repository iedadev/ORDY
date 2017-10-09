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

FileName="Valorizzazione_Articoli.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 

sss = "SELECT * FROM ORD_Articoli WHERE ATTART ='Y' AND IDCodmag=1 AND 1 = 1 "
session("sss") = sss
Set rs = dbConn.Execute(sss)

sta ="SELECT COUNT(Codart) AS TotaleArticoli FROM ORD_Articoli WHERE ATTART ='Y' "
Set rsta = dbConn.Execute(sta)

stu ="SELECT SUM(QTADISP) AS TotaleUnita FROM ORD_Articoli WHERE ATTART ='Y' "
Set rstu = dbConn.Execute(stu)

svq ="SELECT SUM(ValQta) AS TotaleValore FROM ORD_Articoli WHERE ATTART ='Y' "
Set rsvq = dbConn.Execute(svq)



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
<p><b><font face='Calibri'>Elenco Articoli Magazzino</font></b></p>
<p><b><font face='Calibri'>Data Stampa Report <%=Date()%></font></b></p>

<table border="1" cellpadding="3" cellspacing="0">
    <tr>
    <td bgcolor="#99CCFF"><b><font face="Calibri">Totale Articoli</font></b></td>
    <td bgcolor="#99CCFF"><b><font face="Calibri">Totale Unita</font></b></td>
    <td bgcolor="#99CCFF"><b><font face="Calibri">Totale Valore(€)</font></b></td>
    </tr>
    <td><%= rsta("TotaleArticoli") %></td>
    <td><%= rstu("TotaleUnita") %></td>
    <td><%= rsvq("TotaleValore") %></td>
</table>
    <br />
   
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Codice Articolo HD</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Barcode</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Articolo</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Prz Unitario</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Qta Magazzino</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Totale</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("Codart") %></td>
		<td><%= rs("Barcode") %></td>
        <td><%= rs("Nomart") %></td>
        <td><%= rs("Przart") %></td>
		<td><%= rs("Qtadisp") %></td>
        <td><%= rs("ValQta") %></td>
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