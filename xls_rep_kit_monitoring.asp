<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="config.asp"-->
<%
If session("usr")= "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
'    response.redirect "main.asp"
'End If

Dim sss, FileName

i = 1

FileName="Kit_Scontistca.xls"

Response.Buffer = true
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename=" & FileName 


Dim s, i, s1,dt1,dt2

dim datakitadal
dim datakitaal

lc= request.form ("id_lc")
timeperiod= request.form ("time_period")
datakitadal = FormatDateTime(request.form("data_kit_dal"),0)
datakitaal = FormatDateTime(request.form("data_kit_al"),0)

dt1="#"&month(datakitadal)&"/"&day(datakitadal)&"/"&year(datakitadal)&"#"
dt2="#"&month(datakitaal)&"/"&day(datakitaal)&"/"&year(datakitaal)&"#"
'response.write dt1
'response.write dt2

'response.write (DatePart("q",datacompleto))

'response.write dataordine

'response.write timeperiod
'response.end


if timeperiod = 99 then
 response.redirect "rep_kit_monitoring.asp?datadaa=1"
end if

'response.end
i = 1


'ATTENZIONE DEBBO ESTRARRE SOLO QUELLI PRESENTI IN AMBEDUE LE TABELLE ORD_COMPLETATI e ORD_MONITORING

select case timeperiod
  case 1, 2, 3, 4
    s = "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE TRIM =" & timeperiod &" AND LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
  'response.write s

   case 12
    s = "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
  '  response.write s

  case else
    s =  "SELECT * FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart WHERE datacompleto between " & dt1 & " and " & dt2 & " AND LC='" & lc & "'"
    Set rs2 = dbConn.Execute(s)
 '   response.write s

end select

'calcolo quantita di articoli acquistatin degli articoli da monitorare per accedere alla scontistica
sc= "SELECT SUM(QTARICH) as totart FROM ord_completati INNER JOIN ord_monitoring ON CLng(ord_completati.codart) = ord_monitoring.codart"
Set rssc = dbConn.Execute(sc)

'response.end

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--#include virtual file="include/title.asp"-->
</head>
<body>
<p><b><font face='Calibri'>Elenco Articoli Special Kit </font></b></p>
<p><b><font face='Calibri'>Data Stampa Report <%=Date()%></font></b></p>

<table border="1" cellpadding="3" cellspacing="0">
    <tr>
    <td bgcolor="#99CCFF"><b><font face="Calibri">Totale Articoli</font></b></td>
    </tr>
    <td><%= rssc("Totart") %></td>
</table>
    <br />
   
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Numero Ordine</font></b></td>
		<td bgcolor="#99CCFF"><b><font face="Calibri">Barcode</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Data Pagamento</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Data Ordine</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Data Completo</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Trimestre</font></b></td>
        <td bgcolor="#99CCFF"><b><font face="Calibri">Nr Articoli</font></b></td>
	</tr>
	<% While Not rs2.EOF	%>
	<tr>
		<td><%= rs2("Numord") %></td>
		<td><%= rs2("Barcode") %></td>
        <td><%= rs2("DataPagamento") %></td>
        <td><%= rs2("DataOrdine") %></td>
		<td><%= rs2("DataCompleto") %></td>
        <td><%= DatePart("q",rs2("dataCompleto")) %></td>
        <td><%= rs2("Qtarich") %></td>
		</tr>
	<%
	rs2.MoveNext
	Wend
	%>
</table>
</body>
</html>
<%
Set dbconn = nothing
Set rs2 = nothing
Response.flush 
Response.end
%>