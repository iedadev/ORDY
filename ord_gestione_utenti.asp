<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%

Dim sss, i

i = 1

sss = "SELECT * FROM ORD_USER WHERE 1 = 1"
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
		if (document.P2.user_lc.value == "")
			{
			alert("Attenzione! Nome Utente Dato Obbligatorio");
			document.P2.user_lc.style.backgroundColor = 'Yellow';
			document.P2.user_lc.focus();
			return false;
			}
       if (document.P2.user_pwd.value == "")
			{
			alert("Attenzione! Password Dato Obbligatorio");
			document.P2.user_pwd.style.backgroundColor = 'Yellow';
			document.P2.user_pwd.focus();
			return false;
			}
		}
		//-->
		</script>

    <title>SB Admin - Bootstrap Admin Template</title>

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
 <div class="col-lg-3 text-center">
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-3x"></i>
                                    </div>
                                    <div class="col-xs-6 text-center">
                                        <div class="huge">Gestione Utenti</div>
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
                            	<legend>Gestione Utenti</legend>
                            </div>
                                <% If request("New") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Utente aggiunto con successo.</strong>
                                    </div>
                                    <%end if%>	
                                     <form name="P2" method="post" Action="ord_utenti_aggiungi.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Utente (LC)                                          
										 
													  <select id="selectError" name="user_lc" class="form-control" type="text" style="width:200px;">
													<%
																 Set rs = dbConn.Execute("SELECT DISTINCT NOMCLI FROM ORD_Clienti ORDER BY NOMCLI")
																  While Not rs.EOF
																	  response.write "<option value='" & rs("NOMCLI") & "'>" & rs("NOMCLI") & "</option>"
																	  'End If
																  rs.MoveNext
																  Wend
													  %>
                                            </select>
										 </div></label>
                                           <div class="form-group">
                                          <label  for="focusedInput">Password   
                                          	<input name="user_pwd" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                         </div></label>
										 
                                        <div class="form-group">
                                         <label  for="focusedInput">Ruolo
                                          <div class="controls">
                                          <select autofocus id="selectError" name="user_ruolo" class="form-control" type="text" style="width:100px;">
														<option value="A">Admin</option>
														<option value="U">User</option>
														</select>
                                          </div></label> <p>
										  
                                        <div class="form-group">
                                         <label  for="focusedInput">Attivo
                                          <div class="controls">
                                          <select id="selectError" name="user_at" class="form-control" type="text" style="width:100px;">
														<option value="SI">yes</option>
														<option value="NO">no</option>
														</select>
                                          </div></label><br />
										  
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top">Aggiungi</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-6 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Utenti Registrati </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">

                                    <% If request("Del") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong>Utente eliminato con successo.</strong>
                                    </div>
                                    <%end if%>


                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
                                       <th>Utente</th>
                                       <th>Password</th>
												 <th>Ruolo</th>
												<th>Attivo</th>
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
                                                    Response.write rs2("usr")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                 <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("pwd")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("ruolo")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
												<td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("attivo")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>	
												<% If rs2("attivo") = "NO" Then %>
												<td>
                                                 <img src="images/userdelete.png" width="32" height="32" title="Utente non attivo">
                                                </td>
                                                 <%Else%>
                                                <td>
                                                   <a href="ord_utenti_modifica.asp?USER=<%= session("usr") %>&IDusr=<%= rs2("usr") %>&Nomusr=<%= rs2("pwd") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/buttonedit.png" width="32" height="32" title="Modifica Utente"></a>
                                                   <a href="ord_utenti_elimina.asp?USER=<%= session("usr") %>&IDusr=<%= rs2("usr") %>&Nomusr=<%= rs2("pwd") %>&TipoQuery=<%= request("TipoQuery") %>"><img src="images/buttondelete.png" width="32" height="32" title="Elimina Utente"></a>
                                                <!-- invio Mail - con Outlook <a HREF="mailto:cc PARAMETRO ASP &bcc= -->   
											
                                                                                    
<a href="mailto:segreteria@motherwords.it&subject=LEARNING CENTER <%= rs2("usr") %> Richiesta Password &body=
Ciao%0A
Potresti per favore, inviarmi la mia password oppure genrerarne una nuova?%0A
Grazie,0A">
<img src="images/email.png" width="32" height="32" title="Invia mail"></a>
                                               </td>
												
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
