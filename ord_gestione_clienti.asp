<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%

Dim sss, i

i = 1

sss = "SELECT * FROM ORD_Clienti WHERE 1 = 1"
'sss = sss & " ORDER BY Datain"
session("sss") = sss
set rs2 = dbConn.Execute(sss)

'response.write sss
'response.write rs2("stacli")
'response.end

%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.ord_nomcli.value == "")
			{
			alert("Attenzione! Nome Cliente Dato Obbligatorio");
			document.P2.ord_nomcli.style.backgroundColor = 'Yellow';
			document.P2.ord_nomcli.focus();
			return false;
			}
       if (document.P2.ord_refcli.value == "")
			{
			alert("Attenzione! Referente Dato Obbligatorio");
			document.P2.ord_refcli.style.backgroundColor = 'Yellow';
			document.P2.ord_refcli.focus();
			return false;
			}
        if (document.P2.ord_indcli.value == "")
			{
			alert("Attenzione! Indirizzo Cliente Dato Obbligatorio");
			document.P2.ord_indcli.style.backgroundColor = 'Yellow';
			document.P2.ord_indcli.focus();
			return false;
			}
        if (document.P2.ord_emacli.value == "")
			{
			alert("Attenzione! Email Cliente Dato Obbligatorio");
			document.P2.ord_emacli.style.backgroundColor = 'Yellow';
			document.P2.ord_emacli.focus();
			return false;
			}
         if (document.P2.ord_telcli.value == "")
			{
			alert("Attenzione! Telefono Cliente Dato Obbligatorio");
			document.P2.ord_telcli.style.backgroundColor = 'Yellow';
			document.P2.ord_telcli.focus();
			return false;
			}
		}
		//-->
		</script>

     <!--Intestazione-->

    <!--#include virtual file="include/title.asp"-->

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <!--#include virtual file="include/navigation.asp"-->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                 <!--#include virtual file="include/heading.asp"--> 
               
                 <!-- /.row -->

<div class="row">
 <div class="col-lg-2 text-center">
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-3x"></i>
                                    </div>
                                    <div class="col-xs-6 text-center">
                                        <div class="huge">Gestione Learning Center</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-3 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Learning Center </legend>
                            </div>
                                <% If request("New") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Learning Center aggiunto con successo.</strong>
                                    </div>
                                    <%end if%>	
                                     <form name="P2" method="post" Action="ord_clienti_aggiungi.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Learning Center   
                                          	<input name="ord_nomcli" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
                                           <div class="form-group">
                                          <label  for="focusedInput">Referente LC   
                                          	<input name="ord_refcli" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
                                           <div class="form-group">
                                          <label  for="focusedInput">Indirizzo
                                          	<input name="ord_indcli" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
                                           <div class="form-group">
                                          <label  for="focusedInput">Email    
                                          	<input name="ord_emacli" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
                                           <div class="form-group">
                                          <label  for="focusedInput">Telefono  
                                          	<input name="ord_telcli" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
                                          <br>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-7 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Learning Center </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">

                                    <% If request("Del") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Learning Center eliminato con successo.</strong>
                                    </div>
                                    <%end if%>


                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
                                                <th>Nome LC</th>
                                                <th>Referente</th>
												<th>Indirizzo</th>
												<th>Email</th>
												<th>Telefono</th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs2.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>

                                                <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Nomcli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                 <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Refcli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Indcli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
												<td>
                                                <%
												'Set rs2 = dbConn.Execute("SELECT * FROM SIM_KIT AS K, SIM_Sottocategorie AS SCAT WHERE K.IDSCAT = SCAT.IDSCAT AND K.IDScat = " & rs("IDScat"))
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Emacli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												'Set rs1 = dbConn.Execute("SELECT * FROM SIM_Kit WHERE IDCat = " & rs("IDCat"))
												If Not rs2.eof Then
													Response.write rs2("Telcli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<% If rs2("stacli") = 0 Then %>
												<td>
                                                    <img src="images/userdelete.png" width="32" height="32" title="LC non più attivo">
                                                </td>
                                                 <%Else%>
                                                <td>
                                                   <a href="ord_clienti_modifica.asp?USER=<%= session("usr") %>&IDcli=<%= rs2("IDcli") %>&Nomcli=<%= rs2("Nomcli") %>&Refcli=<%=rs2("Refcli")%>&Indcli=<%= rs2("Indcli") %>&Emacli=<%= rs2("Emacli") %>&Telcli=<%= rs2("Telcli") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/buttonedit.png" width="32" height="32" title="Modifica Cliente"></a>
                                                    <a href="ord_clienti_elimina.asp?USER=<%= session("usr") %>&IDcli=<%= rs2("IDcli") %>&Nomcli=<%= rs2("Nomcli") %>&Refcli=<%=rs2("Refcli")%>&Indcli=<%= rs2("Indcli") %>&Emacli=<%= rs2("Emacli") %>&Telcli=<%= rs2("Telcli") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/buttondelete.png" width="32" height="32" title="Elimina Cliente"></a>
                                                </td>
                                                <%End if%>
                                                </tr>
											<%
											rs2.MoveNext 
											Wend
											%>
										</tbody>
									</table>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
</div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
