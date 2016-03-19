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

FileName="Report_UserKit.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 


        sss = "SELECT COUNT(A.BARCODE) AS Totale, A.BARCODE, B.NOMEKIT"
        sss = sss & " FROM SIM_StoricoInventario AS A INNER JOIN SIM_KIT AS B ON A.BARCODE = B.BARCODE" 
        sss = sss & " WHERE A.DATA_IN BETWEEN #" & request("datefrom") & "# AND #" & request("dateto") & "#"
        sss = sss & " AND ID_USER = " & request("user")
        sss = sss & " GROUP BY A.BARCODE, B.NOMEKIT"

        session("sss") = sss

        Dim s1 
        
        s1 = "SELECT USR"
        s1 = s1 & " FROM SIM_User" 
        s1 = s1 & " WHERE ID_USR = " & request("user")

'response.write sss
'response.write ""
'response.write s1
'response.write ""
'esponse.write request("datefrom")

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
<p><b><font face='Calibri' size='4'>Report Lit utilizzati da <%= rs1("usr") %></font></b></p>
<p><b><font face='Calibri' size='4'>Periodo dal:<%= request("datefrom") %> al <%= request("dateto") %></font></b></p>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Barcode</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Nome Kit</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri" size="4">Totale</font></b></td>
	</tr>
	<% While Not rs.EOF	%>
	<tr>
		<td><%= rs("barcode") %></td>
		<td><%= rs("nomekit") %></td>
		<td><%= rs("totale") %></td>
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