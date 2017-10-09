<%

If session("usr") = "" Then
    response.redirect "default.asp"
End If

If session("ruolo") <> "A" Then
    response.redirect "main_user.asp"
End If

user= session("usr")

%>