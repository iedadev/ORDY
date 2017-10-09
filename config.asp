<% 
   dim dbconn
   Set dbconn = Server.CreateObject("ADODB.Connection")  

   'connessione in rete
   'dbconn.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("../mdb-database/ORDY1.mdb")
   
   'connessione in locale
    dbconn.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("/mdb-database/ORDY1.mdb")
%>
