<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

Dim sss, i

i = 1

sss = "SELECT * FROM ORD_SCADENZE WHERE 1 = 1"
'sss = sss & " ORDER BY Datain"
'session("sss") = sss
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
		if (document.P2.ord_scadenza.value == "")
			{
			alert("Attenzione! Data Prossima Scadenza Dato Obbligatorio");
			document.P2.ord_scadenza.style.backgroundColor = 'Yellow';
			document.P2.ord_scadenza.focus();
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
                                        <i class="fa fa-envelope fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Scadenza Ordini</div>
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
                            	<legend>Data Scadenza Prossimo Ordine </legend>
                            </div>
                                <% If request("New") <> 0 Then%>	
                                    <div class="alert alert-success">
                                        <strong> Nuova Scadenza aggiunta con successo.</strong>
                                    </div>
                                    <%end if%>	
                                     <form name="P2" method="post" Action="ord_scadenza_aggiungi.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                          <div class="form-group">
                                          <label  for="focusedInput">Data Scadenza Ordine   
                                          	<input name="ord_scadenza" class="form-control" id="focusedInput" value="GG/MM/AAAA"type="text" style="width:120px;">
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
 <div class="col-lg-6 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Scadenza Ordini </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
                                                <th>Data Inserimento</th>
                                                <th>Data Scadenza Ordine</th>
                                                <th>Attiva/Disattiva</th>
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
                                                    Response.write rs2("DATA")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                 <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("DATASCADENZA")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<% If rs2("ATTIVO") = 1 Then %>
												<td>
                                                     <i class="fa fa-check fa-2x"></i>
                                                </td>
                                                 <%Else%>
                                                <td>
                                                    <i class="fa fa-times fa-2x"></i>
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
