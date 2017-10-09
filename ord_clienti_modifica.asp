<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss1, i ,sss

sss1 =  "SELECT * FROM ORD_Clienti WHERE IDcli = " & request("IDCli")
'response.write sss
Set rs1 = dbConn.Execute(sss1)

sss = "SELECT * FROM ORD_Clienti WHERE 1 = 1"
'sss = sss & " ORDER BY Datain"
session("sss") = sss
set rs2 = dbConn.Execute(sss)



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
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Learning Center</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-4 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Learning Center</legend>
                            </div>
                                     <form name="P2" method="post" Action="ord_clienti_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="ord_idcli"  value="<%= rs1("IDcli") %>">
                                      <fieldset>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Nome cliente: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("Nomcli") %>" name="ord_nomcli" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                           <div class="control-group">
                                          <label class="control-label" for="focusedInput">Indirizzo Cliente: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("Indcli") %>" name="ord_indcli" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Email Cliente: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("emacli") %>" name="ord_emacli" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">Telefono Cliente: </label>
                                          <div class="controls">
                                            <input value="<%= rs1("telcli") %>" name="ord_telcli" class="input-xlarge focused" id="focusedInput" type="text">&nbsp;&nbsp;
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Salva Modifiche">Salva</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form> 
                             </div>
                        </div>
</div>
 <div class="col-lg-5 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Learning Center </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
                                                <th>Nome LC</th>
                                                <th>Referente</th>
												<th>Indirizzo</th>
												<th>Email</th>
												<th>Telefono</th>
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
                                                    Response.write rs2("refcli")
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
												If Not rs2.eof Then
													Response.write rs2("Telcli")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
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
