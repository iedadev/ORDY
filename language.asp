<%
   
'DETERMINO LA LINGUA DEL SITO   
    
    session("lingua") = "ITA"

If session("lingua") = "ENG" Then
    response.write "ENG" %>
    <!--#include virtual file="include/lang_eng.asp"-->
<% Else 
    response.write "ITA"  %>
    <!--#include virtual file="include/lang_ita.asp"-->
<%End If%>