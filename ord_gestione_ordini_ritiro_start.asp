<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
'se non viene inserito un numero d'ordine viene calcolato il valore massimo inserito e proposto un numero ordine incrementato
IF request("ORD") = 0 then
'sss = "SELECT MAX(Numord) as nuovo FROM ORD_Richieste" 11072016

sss = "SELECT MAX(Numord) as nuovo FROM (SELECT numord FROM ord_richieste UNION SELECT numord FROM ord_completati)"
Set rs = dbConn.Execute(sss)

NuovoID =rs("nuovo")
'response.write sss
'response.write "metto nr ordine vecchio"
'response.write NuovoID

else 
'sss = "SELECT MAX(Numord) as nuovo FROM ORD_Richieste" 11072016

sss = "SELECT MAX(Numord) as nuovo FROM (SELECT numord FROM ord_richieste UNION SELECT numord FROM ord_completati)"
Set rs = dbConn.Execute(sss)
NuovoID = rs("nuovo")
NuovoID = rs("nuovo") +1
'response.write "metto nr ordine nuovo"
end if

 if request ("nocode") = 2 then 
NuovoID = rs("nuovo") +1
end if

'sss = "SELECT MAX(Numord) as nuovo FROM ORD_Richieste"
'Set rs = dbConn.Execute(sss)

cou = "SELECT COUNT(Numord) as cou FROM ORD_Richieste"
Set rs1 = dbConn.Execute(cou)

'response.write cou
'response.write " COUNT "
'response.write rs1("cou")

If rs1("cou") = 0 Then
'response.write " AAA+ "
couass= "SELECT COUNT(Numord) as couass FROM ORD_Assegnazioni"
Set rsa = dbConn.Execute(couass)
'response.write couass
              
                    If rsa("couass") = 0 Then
                    'response.write "  AAASSS  "
                    coucompl= "SELECT MAX(Numord) as coucompl FROM ORD_Completati"
                    Set rsc = dbConn.Execute(coucompl)
                    'response.write coucompl
                    NuovoID = rsc("coucompl") +1
                    end if
'else
'response.write "BBB"
'sss = "SELECT MAX(Numord) as nuovo FROM ORD_Richieste"
'Set rs = dbConn.Execute(sss)
'NuovoID = rs("nuovo") +1
end if


'response.write NuovoID

'response.end   
'response.write sss
'response.write " NuovoID" 
'response.write rs("nuovo")
'response.write NuovoID
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
        if (document.P2.ord_lc.value == "")
			{
			alert("Attenzione! Inserire il Learning Center. Dato Obbligatorio");
			document.P2.ord_lc.style.backgroundColor = 'Yellow';
			document.P2.ord_lc.focus();
			return false;
			}
            if (document.P2.Data_Ritiro.value == "")
			{
			alert("Attenzione! Inserire il Data Ritiro. Dato Obbligatorio");
			document.P2.Data_Ritiro.style.backgroundColor = 'Yellow';
			document.P2.Data_Ritiro.focus();
			return false;
			}
            if (document.P2.codart.value == "")
			{
			alert("Attenzione! Inserire il Codice Articolo. Dato Obbligatorio");
			document.P2.codart.style.backgroundColor = 'Yellow';
			document.P2.codart.focus();
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
                       		<div class="panel panel-primary">
                            <div class="panel-heading">
                            <div class="panel-body">
                                     <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-center">
                                        <div class="huge">Ritiro Kit </div>
                                    </div>
                                </div>
                                          <a href="ord_gestione_ordini_ritirati_risultati.asp"><button type="button" class="btn btn-success"> Elenco Kit Ritirati a mano</button></a>
                            </div>
                                </div>
                        </div>
                    </div>
<div class="col-lg-6 text-center">
                        <div class="panel panel-default">

                            <div class="panel-body">
                             <div class="navbar navbar-inner block-header">
                            	<legend>Richieste Ritiro Kit da Learning Center </legend>
                            </div>

                                     <form name="P2" method="post" Action="ord_gestione_ordini_ritiro.asp" class="form-horizontal" onsubmit="return controllo()">
                                      <fieldset>

                                          <div class="form-group">
                                          <label  for="focusedInput">Learning Center
                                          <div class="controls">
                                          <select id="selectError" name="ord_lc" class="form-control" type="text" style="width:200px;">
                                              <option value=""></option>
                                     <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM ORD_Clienti ORDER BY NomCli")
                                              While Not rs0.EOF
	                                                  response.write "<option value='" & rs0("IDCli") & "'>" & rs0("Nomcli") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                            </div></label>
                                          </div>

                                          <div class="form-group">
                                          <label  for="focusedInput">Data Ritiro
                                            <input name="Data_Ritiro" class="form-control" id="focusedInput"  type="text" value="<%= Date() %>" style="width:100px;">
                                           </div></label> 
                                                                       
                                          <div class="form-group">
                                          <label  for="focusedInput">Articolo
                                          <div class="controls">
                                          <select id="selectError" name="codart" class="form-control" type="text" style="width:350px;">
                                              <option value=""></option>
                                             <%
                                              Set rs0 = dbConn.Execute("SELECT * FROM ORD_Articoli  WHERE QTADISP >0 ORDER BY NomArt")
                                              While Not rs0.EOF
	                                                  response.write "<option value='" & rs0("Codart") & "'>" & rs0("Nomart") & "</option>"
                                              rs0.MoveNext
                                              Wend
                                              %>
                                            </select>
                                            </div></label>
                                          </div> 

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
<div class="col-lg-2 text-center">
        <div></div>
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
