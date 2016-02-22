<% 
   dim dbconn
   Set dbconn = Server.CreateObject("ADODB.Connection")  
   'dbconn.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("../mdb-database/SIM.mdb")
   dbconn.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("/mdb-database/SIM.mdb")
%>
