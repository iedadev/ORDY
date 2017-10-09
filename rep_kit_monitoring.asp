<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

    <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    

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

     <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.id_lc.value == "")
			{
			alert("Attenzione! Learning Center Dato Obbligatorio");
			document.P2.id_lc.style.backgroundColor = 'Yellow';
			document.P2.id_lc.focus();
			return false;
			}
       if (document.P2.data_kit_dal.value == "")
			{
			alert("Attenzione! Inserire data inizio Dato Obbligatorio");
			document.P2.data_kit_dal.style.backgroundColor = 'Yellow';
			document.P2.data_kit_dal.focus();
			return false;
			}
        if (document.P2.data_kit_al.value == "")
			{
			alert("Attenzione! Data fine Dato Obbligatorio");
			document.P2.data_kit_al.style.backgroundColor = 'Yellow';
			document.P2.data_kit_al.focus();
			return false;
			}
        if (document.P2.time_period.value == "")
			{
			alert("Attenzione! Periodo di estrazione Cliente Dato Obbligatorio");
			document.P2.time_period.style.backgroundColor = 'Yellow';
			document.P2.time_period.focus();
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
                    <div class="col-lg-4 text-center">
                       		<div class="panel panel-default">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Kit Learning Center</div>
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
                            	<legend>Gestione Stato Monitoring Kit</legend>
                            </div>

                            <form name="P2" role="form" method="post" Action="ord_gestione_kitmonitoring_risultati.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>
                                        <div class="form-group">
                                         <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="id_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                              <%
                                             Set rs0 = dbConn.Execute("SELECT DISTINCT LC FROM ORD_Completati ORDER BY LC")
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
                                                

                                       <%datadaa=request ("datadaa")%>

                                                <label  for="focusedInput">Periodo
                                                <div class="controls"> 
                               
                                          <%  if datadaa = 1 then %>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">dal: </label>
                                          <div class="controls">
                                            <input name="data_kit_dal" class="input-large focused" id="focusedInput" placeholder="GG/MM/AAAA" value="<%= Date()-10 %>" type="text" style="width:100px;">
                                          </div>
                                        </div>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">al: </label>
                                          <div class="controls">
                                            <input name="data_kit_al" class="input-large focused" id="focusedInput" placeholder="GG/MM/AAAA" value="<%= Date()+10 %>"type="text" style="width:100px;">
                                          </div>
                                          </div>
                                            <%else%>

                                          <select id="periodo" name="time_period" class="form-control" type="text" style="width:200px;">
                                                    <option value="1">Trimestre 1</option>
                                                    <option value="2">Trimestre 2</option>
                                                    <option value="3">Trimestre 3</option>
                                                    <option value="4">Trimestre 4</option>
                                                    <option value="12">Anno solare</option>
                                                    <option value="99">Data dal/al</option>
                                                 </select></div></label>

                                              <%end if %>


                                        <div class="form-actions"><br>
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Cerca</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                              <%  if datadaa = 1 then %>
                                           <a href="rep_kit_monitoring.asp" class="btn btn-info" role="button">Nuova Ricerca</a>
                                            <%end if%>
                                        </div>
                                      </fieldset>
                                    </form>
                            </div>
                          </div>
                        </div>
                    <div class="col-lg-4 text-center">
                        &nbsp;
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
