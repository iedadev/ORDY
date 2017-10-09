<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%

sss =  "SELECT DatVal,TotVal,NrArtVal,TotUni FROM ORD_VALORIZZAZIONI"

Set rs = dbConn.Execute(sss)

'nrord = rs("Numord")
'pdfordine = rs("Numord")
'pdfordine = "ordineHD_"&pdfordine


'response.write sss
'response.write pdfordine


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
		if (document.P3.data_valorizzazione.value == "")
			{
			alert("Attenzione! Inserire La Data di valorizzazione. Dato Obbligatorio");
			document.P3.data_valorizzazione.style.backgroundColor = 'Yellow';
			document.P3.data_valorizzazione.focus();
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
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Report</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                                <div class="panel-footer">
                                    <span class="pull-left"><a href="xls_valmag.asp"><img src="images/excel.png" width="32" height="32" title="Crea file excel"> <b> Esporta file in Excel</b></a></span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                    </div>
 <div class="col-lg-4 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Valorizzazione Magazzino </legend>
                            </div>
                                    <% if  nrord = "" Then
                                     'response.write "passqui"
                               %>
                                <table class="table table-condensed">
									<tbody>  
                                   Inserire la data di valorizzazione <p>

                                        <form name="P3" method="post" Action="rep_valmag_add.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                            <div class="form-group">
                                          <label  for="focusedInput">          
                                          	<input name="data_valorizzazione" class="form-control" id="focusedInput" value="<%= Date() %>" type="text" style="width:100px;">
                                        </div></label> 
                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Conferma">Conferma</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                            </tbody>
								</table> 
                                 <%end if%>

                                      <%If nrord <> " " then%>                               
                                    <div align="right">
                                    <a href="main.asp"><button type="button" class="btn btn-success" align="right">Torna alla home</button></a>
                                    </div>
                                <%End if%> 
                                
                            </div>
                        </div>
                    </div>
<div class="col-lg-5 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco valorizzazioni Magazzino </legend>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
                                                <th>Data </th>
                                                <th>Articoli</th>
                                                <th>Unita</th>
                                                <th>Totale Euro</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                                    <td>
                                                   <%
												If Not rs.eof Then
													'Response.write sss
                                                    Response.write rs("DatVal")
												Else
													Response.write "&nbsp;"
												End If
												%>
                                                    </td>
                                                <td>
												<%
												If Not rs.eof Then
													'Response.write sss
                                                    Response.write rs("NrArtVal") 
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs.eof Then
													'Response.write sss
                                                    Response.write rs("TotUni") 
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
                                                    dim Eu
                                                    Eu = rs("TotVal")
												If Not rs.eof Then
													'Response.write sss
                                                    'Response.write rs("TotVal")
                                                     Response.write FormatNumber (Eu,2,,,-1)
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                </tr>
											<%
											rs.MoveNext 
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
