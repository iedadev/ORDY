<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Senza nome 1</title>
</head>

<body>
<%
Dim Item, fieldName, fieldValue
Dim a, b, c, d

Set d = Server.CreateObject("Scripting.Dictionary")

For Each Item In Request.Form
    fieldName = Item
    fieldValue = Request.Form(Item)

    d.Add fieldName, fieldValue
Next

' Rest of the code is for going through the Dictionary
a = d.Keys  ' Field names  '
b = d.Items ' Field values '

For c = 0 To d.Count - 1
    Response.Write a(c) & " = " & b(c)
    Response.Write "<br>"
Next
%>
</body>

</html>
