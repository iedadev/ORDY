<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss1, i ,sss

sss1 =  "SELECT * FROM ORD_Fornitori WHERE IDfor = " & request("IDfor")
'response.write sss
Set rs2 = dbConn.Execute(sss1)

sss = "SELECT * FROM ORD_Fornitori WHERE 1 = 1"
'sss = sss & " ORDER BY Datain"
session("sss") = sss
set rs1 = dbConn.Execute(sss)

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
		if (document.P2.ord_nomfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_nomfor.style.backgroundColor = 'Orange';
			document.P2.ord_nomfor.focus();
			return false;
			}
        if (document.P2.ord_indfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_indfor.style.backgroundColor = 'Orange';
			document.P2.ord_indfor.focus();
			return false;
			}
        if (document.P2.ord_emafor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_emafor.style.backgroundColor = 'Orange';
			document.P2.ord_emafor.focus();
			return false;
			}
        if (document.P2.ord_telfor.value == "")
			{
			alert("<%=response.write (datoobbligatorio)%>");
			document.P2.ord_telfor.style.backgroundColor = 'Orange';
			document.P2.ord_telfor.focus();
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
                                        <i class="fa fa-truck fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Gestione Fornitori</div>
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
                            	<legend>Gestione Modifica Fornitori </legend>
                            </div>
                              <form name="P2" method="post" Action="ord_fornitori_modificafine.asp" class="form-horizontal" onsubmit="return controllo()">
                                     <input type="hidden" name="ord_idfor"  value="<%= rs1("IDfor") %>">
                                      <fieldset>

                                          <div class="form-group">
                                          <label  for="focusedInput">Nome Fornitore        
                                          	<input value="<%= rs2("Nomfor") %>" name="ord_nomfor" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Indirizzo Fornitore        
                                          	<input value="<%= rs2("Indfor") %>" name="ord_indfor" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Email Fornitore        
                                          	<input value="<%= rs2("emafor") %>" name="ord_emafor" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 

                                          <div class="form-group">
                                          <label  for="focusedInput">Telefono Fornitore        
                                          	<input value="<%= rs2("telfor") %>" name="ord_telfor" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 

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
                            	<legend>Elenco Fornitori </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
                                                <th>Nome Fornitore</th>
												<th>Indirizzo Fornitore</th>
												<th>Email Fornitore</th>
												<th>Telefono Fornitore</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs1.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                                <td>
												<%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Nomfor")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Indfor")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
												<td>
                                                <%
												If Not rs1.eof Then
													'Response.write sss
                                                    Response.write rs1("Emafor")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												If Not rs1.eof Then
													Response.write rs1("Telfor")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                </tr>
											<%
											rs1.MoveNext
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
