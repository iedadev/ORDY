<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1

dim dataordine

dataordine = request.form("data_ord")

i = 1
									
%>
    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

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

   <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P3.cod_ord.value == "")
			{
			alert("Attenzione! Inserire Codice Ordine Dato Obbligatorio");
			document.P3.cod_ord.style.backgroundColor = 'Yellow';
			document.P3.cod_ord.focus();
			return false;
			}
		}
		//-->
		</script>


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
 <div class="col-lg-12 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Archivio Mail Ordini Learning Center  </legend>
                                    <a href="javascript:history.back()"><img src="images/home.png" width="32" height="32" title="Indietro"></a>
                                    <a href="ord_gestione_completi.asp"><button type="button" class="btn btn-primary">Cerca Mail per Learning center</button></a>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Archivia Mail per Learning Center</button>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">Archivia mail per Ordine</button>
                            </div>

                              <%if request("del") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong>Ordini archiviati con successo</strong>
                                            </div>
                                     <%end if%>

                               <%if request("del") =2 then %> 
                                            <div class="alert alert-success">
                                              <strong>Articolo Eliminato con successo</strong>
                                            </div>
                                     <%end if%>
									 
								<%if request("new") =1 then %> 
                                            <div class="alert alert-success">
                                              <strong>Articolo Aggiunto con successo</strong>
                                            </div>
                                     <%end if%>	 

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">


<div class="block-content collapse in">
                                <div class="span12">
  									<table class="table table-condensed">
						              <tbody>
						              <%
                                        ss2 =  "SELECT DISTINCT LC FROM ORD_Mail_Archivio WHERE 1=1"     
						                'response.write ss2
                                       ' response.end
						              Set rs = dbConn.Execute(ss2)
						              While Not rs.EOF
						              %>

                                          <%
                                        ss3 =  "SELECT DISTINCT ORDINE FROM ORD_Mail_Archivio WHERE LC ='" & rs ("LC") & "'"     
						                'response.write ss3
						              Set rs3 = dbConn.Execute(ss3)
						              'response.end
                                      While Not rs3.EOF
						              %>

                                          <%
						              	s =  "SELECT  * FROM ORD_Mail_Archivio WHERE LC ='"& rs("LC") &"' and ordine = " & rs3("ordine")

                                    '    response.write s
                                       ' response.end
						              	Set rs1 = dbConn.Execute(s)
						              	If Not rs1.EOF Then
							              	response.write "<tr class='success'>"
							              	response.write "<td colspan='6'><div class='muted pull-left'>" & rs("LC") & "</div></td>"
							              	response.write "</tr>"
							                response.write "<tr >"
                                            response.write "<th >Numero Ordine</th>"
							                response.write "<th>Tipologia di Mail</th>"
							                response.write "<th>Data Invio Mail</th>"
							                response.write "<th>&nbsp;</th>"
							                response.write "</tr>"
						              	End If
						              	While Not rs1.EOF
						              	%>
                                          <tr>
                                          <td><%response.write rs1("Ordine")%></td>
                                           <td>
												<%
												If Not rs1.eof Then %>
													<% if rs1("TipoMail") = "Completo" then %>
                                                   <button type="button" class="btn btn-success">Completo</button>
                                                    <%else 
                                                      if rs1("TipoMail") = "Attesa Pagamento" then %>
                                                   <button type="button" class="btn btn-warning">Attesa pagamento</button>
                                                    <%else 
                                                      if rs1("TipoMail") = "Preso in carico" then %>
                                                   <button type="button" class="btn btn-info">Preso in carico</button>
                                                    <%else%>
                                                    <button type="button" class="btn btn-danger">Incompleto</button>
                                                   <% end if%>
                                                <% end if%>

                                                <%end if %>  
												

                                                <% Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                          <td><%response.write rs1("DataOperazione")%></td>
                                                <td>
                                          </tr>

						                <%
						                rs1.MoveNext
						                Wend
						                %>

						               <%
						               rs3.MoveNext
						               Wend
						               %>
						              	

						               <%
						               rs.MoveNext
						               Wend
						               %>
						              </tbody>
                                </table>

                                </div>

                            </div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Registra Data Pagamento</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <!--<form method="post" Action="ord_gestione_ordini_risultati_pagamento.asp" class="form-horizontal">-->
                                        <form method="post" Action="ord_gestione_ordini_datapagamento.asp" class="form-horizontal">
                                      <fieldset>

                                           <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="id_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                             Set rs0 = dbConn.Execute("SELECT DISTINCT LC FROM ORD_Richieste WHERE Statoordine =2 ORDER BY LC")
                                              While Not rs0.EOF
	                                              response.write "<option value='" & rs0("LC") & "'>" & rs0("LC") & "</option>"
		                                          'End If
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>
                                           </div>

                                          <div class="form-group">
                                          <label  for="focusedInput">Numero Ordine
                                          <div class="controls">
                                          <select id="selectError" name="cod_ord" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT Distinct NUMORD FROM ORD_Richieste WHERE Statoordine =2 ORDER BY NUMORD")
                                              While Not rs1.EOF
	                                                response.write "<option value='" & rs1("NUMORD") & "'>" & rs1("NUMORD") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="<%=response.write (etichettabottonecerca)%>"><%=response.write (testobottonecerca)%></button>&nbsp;
                                          <button type="reset" class="btn"><%=response.write (testobottoneannulla)%></button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>    
    
    <!-- Modal 2-->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modifica Ordini</h4>
      </div>
      <div class="modal-body" align="center">
        <!--<p>Selezionare il Nr ordine di cui registrare pagamento.</p>-->
          <div class="block">
                            <div class="block-content collapse in">
                                <div class="span12">
                                        <form name="P3" method="post" Action="ord_gestione_articoli_modifica.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                           <b>Selezionare il numero d'ordine da modificare</b>
                                          <br><br>
                                          <div class="form-group">
                                          <label  for="focusedInput">
                                          <div class="controls">
                                          <select id="selectError" name="cod_ord" class="form-control" type="text" style="width: auto;">
                                              <option value=""></option>
                                              <%
                                              Set rs1 = dbConn.Execute("SELECT DISTINCT NUMORD FROM ORD_Richieste WHERE Statoordine =2 ORDER BY NUMORD")
                                              While Not rs1.EOF
	                             response.write "<option value='" & rs1("NUMORD") & "'>" & rs1("NUMORD") & "</option>"
		                                     rs1.MoveNext
                                              Wend
                                              %>
                                            </select>
                                          </div></label>

                                              <br>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Modifica">Modifica</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
