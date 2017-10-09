<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%

 nrord = request("nrordine")
 pdfordine = "ordineHD_"&nrord
 'nrord1 = request("NumOrdine")

 'response.write nrord
 'response.write "--" & pdfordine
 'response.write NumOrdine
 'response.write nrord1
 'response.end

 'response.write pdfordine

if request("nrordine") = 99  then

sss =  "SELECT Numord FROM ORD_Arrivi WHERE IDArr = (SELECT MAX(IDarr)  FROM ORD_Arrivi)"
Set rs = dbConn.Execute(sss)

nrord = rs("Numord")
pdfordine = rs("Numord")
pdfordine = "ordineHD_"&pdfordine


'response.write sss
'response.write pdfordine

end if

'modificata 08092016 per evitare di visualizzare date diverse per stesso ordine
sto_ord =  " select TOP 5 numord FROM (select distinct numord, codart,dataarr from ord_arrivi) group by numord ORDER BY numord desc"
'sss = sss & " ORDER BY Datain"
Set rssto = dbConn.Execute(sto_ord)
'response.write sto_ord
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
		if (document.P3.nrordine.value == "")
			{
			alert("Attenzione! Inserire il Numero d'Ordine. Dato Obbligatorio");
			document.P3.nrordine.style.backgroundColor = 'Yellow';
			document.P3.nrordine.focus();
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
 <div class="col-lg-3 text-center">
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Ordini da Helen Doron</div>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
 <div class="col-lg-5 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Ordini </legend>
                            </div>
                                    <% if  nrord = "" Then
												 'response.write "passqui"
										     %>
                                <table class="table table-condensed">
									<tbody>  
                                   Inserire il codice dell'ordine ricevuto. <br>
                                        <small>Se non vi fosse un numero d'ordine, inserire un codice personale (es.2016mmdd)</small>
                                        <form name="P3" method="post" Action="ord_gestione_articoliIN.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                            <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine          
                                          	<input name="nrordine" class="form-control" id="focusedInput" type="text" style="width:200px;">
                                        </div></label> 
                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Inserisci</button>&nbsp;
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
                                

                                <% if request("nrordine") = 98  then%>

                                   <div class="alert alert-danger">
                                      <strong>Attenzione!</strong> Il codice inserito non è presente tra gli articoli di magazzino.
                                    </div>

                                    <%end if%>
                            </div>
                        </div>
                    </div>
<div class="col-lg-4 text-center">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Storico Ordini </legend>
                                <div align="center">
                                    <a href="ord_elenco_arrivi.asp"><button type="button" class="btn btn-success" align="right">Elenco Ordini</button></a>
                                    </div>
                            </div>
                            <div class="block-content collapse in">      
                                <div class="span12">

                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <th>
                                                Ultimi 5 ordini inseriti 
                                            </th>
                                            <tr>
                                                <th>Numero Ordine</th>
                                                <th>Scheda</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rssto.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>     
                                                <td>
												<%
												If Not rssto.eof Then
													'Response.write sss
                                                    Response.write rssto("Numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                       <td>
												<a href="ord_gestione_articoliIN.asp?nrordine=<%=rssto("Numord")%>"><i class="fa fa-list-alt fa-2x"></i></a>
												<a href="ord_gestione_nrordine_modifica.asp?nrordine=<%=rssto("Numord")%>"><i class="fa fa-pencil fa-2x" title="Modifica Numero Ordine"></i></a>
												</td>
												</tr>
											<%
											rssto.MoveNext 
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
