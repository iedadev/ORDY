<SCRIPT language="VB" RUNAT="server">

 Sub BtnUp_Click(sender As Object, e As EventArgs)

  inputFile.PostedFile.SaveAs( Server.MapPath(inputNome.Value) )
  Results.InnerHTML = "FileUploadato su " & inputNome.Value & "</b>!"

End Sub

</SCRIPT>
<form enctype="multipart/form-data" RUNAT="server">
<DIV id=Results RUNAT="server"></DIV>

Upload di questo file: <input id="inputFile" type=file RUNAT="server"><br>

Nome: <input id="inputNome" type="text" RUNAT="server"><br>
<input type=button id="BtnUp" value="Upload!"
OnServerClick="BtnUp_Click" RUNAT="server">
</form>
