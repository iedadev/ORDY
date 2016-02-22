<%@ Language="VBScript" %>
<% 
   dim conn, StrConn
   Set conn = Server.CreateObject("ADODB.Connection")  
   '*******  2007  
   'StrConn="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="&Server.MapPath("db/DB_Pokemon_Universe.accdb")&";Persist Security Info=False"
   conn.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("../mdb-database/SIM.mdb")
%>
