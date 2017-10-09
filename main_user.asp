<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%

'response.end
  
'assegnazioni
 'sa= "SELECT COUNT(*) as Tot FROM ORD_Assegnazioni WHERE STATOORDINE =0"
 sa="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Assegnazioni WHERE STATOORDINE =0 GROUP BY NUMORD) AS Step1"
 Set rsa = dbConn.Execute(sa)

'richieste
 'sr= "SELECT COUNT(*) as Tot FROM ORD_Richieste WHERE 1=1"
 sr="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Richieste WHERE LC ='" & session("usr") & "' GROUP BY NUMORD) AS Step1"
 'Set rsr = dbConn.Execute(sr)
 ' response.write sr
 'response.end

'mail da inviare per ordini completati
sc= "SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_COMPLETATI WHERE LC ='" & session("usr") & "' GROUP BY NUMORD) AS Step1;"
Set rsc = dbConn.Execute(sc)

'mail da inviare per ordini in stato incompleti ma pagati
s="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_Richieste  WHERE STATOORDINE =0 AND DATAPAGAMENTO IS NOT NULL AND LC='" & session("usr") & "' ) AS Step1"
Set rs = dbConn.Execute(s)

'mail da inviare per ordini in stato incompleti in attesa di pagamento
si="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Richieste  WHERE STATOORDINE =2 AND Datapagamento IS NULL AND LC='" & session("usr") & "'GROUP BY NUMORD) AS Step1"
Set rsi = dbConn.Execute(si)

'conteggio storico ordini
spc="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_COMPLETATI_STORICO WHERE LC='" & session("usr") & "'GROUP BY NUMORD) AS Step1"
Set rspc = dbConn.Execute(spc)

 'articoli non attivi
ssna = "SELECT COUNT(*) as Tot FROM ORD_Articoli WHERE ATTART ='N' "
Set rssna = dbConn.Execute(ssna)

 'articoli sottoscorta
ssc = "SELECT COUNT(*) as Tot FROM ORD_Articoli WHERE ATTART ='Y' AND Qtadisp < Qtamin "
Set rssc = dbConn.Execute(ssc)

'controllo data scadenza prossimo ordine
ssds = "SELECT DATASCADENZA FROM ORD_SCADENZE WHERE ATTIVO =1 "
Set rsds = dbConn.Execute(ssds)

'calcolo gg alla data scadenza prossimo ordine
data1= rsds("DATASCADENZA")
differenza = DateDiff("d", data1,Date())

'Segnalo ordini con data attesa pagamento maggiore di 5gg rispetto alla data di ricezione ordine in carico
ssda = "SELECT COUNT(*) as TotOrdAP FROM ORD_Richieste WHERE DATAORDINE<= (date()-5)"
Set rsda = dbConn.Execute(ssda)
data2= rsda("TotOrdAP")

'totale articoli presenti in magazzino attivi
ssmay = "SELECT COUNT(*) as TotArtMagY FROM ORD_Articoli WHERE QTADISP >0 AND ATTART= 'Y'"
Set rsssamy = dbConn.Execute(ssmay)
totmagatty= rsssamy("TotArtMagY")

'differenza = DateDiff("d", data1,Date())

'response.write data1
'response.write ssda
'response.write data2
'response.write "NN"
'response.write differenza
'response.end

'response.write s
'response.write sc


%>

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

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

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

        <!--#include virtual file="include/user_panel.asp"-->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                 <!--#include virtual file="include/user_head.asp"--> 
                 <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                            <i class="fa fa-info-circle"></i>  <strong>Reminder</strong>
                        </div>
						
                        <div class="alert alert-warning">        
                                <strong>Avviso per i Learning Center !</strong> Il termine ultimo per l'ordine è il <b><%=data1%></b>           
                        </div>
						
						<!-- se la data è maggiore del 15 Ottobre faccio comparire il messaggio -->
						
						<% 
						data = date()
						oggi = FormatDateTime (data, vbshortdate)
						'response.write oggi
						
						if  "15/10/2016" > oggi then %>
						
						     <div class="alert alert-warning">        
                          <strong>Attenzione</strong>
								A partire <b><em>da Novembre fino a Giugno</em></b>, gli ordini più piccoli verranno raccolti in questo modo:<br />
								ordini arrivati <b>entro il 15 del mese</b> vengono inviati alla casa madre entro il 25 del mese <br />
								ordini arrivati <b>dopo il 15 del mese</b> vengono inviati alla casa madre entro il 10 del mese successivo           
                        </div>
                    <%end if %>    
                    </div>
                </div>
                <!-- /.row -->

                <!-- /.row -->

                <!-- /.row -->
				<div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <i class="fa fa-info-circle"></i>  <strong>Stato Ordini </strong>
                        </div>
                    </div>
                </div>
				                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                       <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                         <!-- Gestione conteggio Ordini Completi -->
                                            <%
                                            if not Rsc.eof then response.write rsc("tot") else
                                            %> 

                                           <% if Rsc.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Ordini <br> Stato completo</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_mail_completi_u.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                         <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                            <!-- Gestione conteggio Ordinio in stato incompleti ma pagati -->
                                            <%
                                            if not Rs.eof then response.write rs("tot") else
                                            %> 

                                           <% if Rs.eof then response.write "0" end if%>

                                        </div>
                                        <div>Ordini <br>Stato Incompleto</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_mail_incompleti_u.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">

                                            <!-- Gestione conteggio Ordini in stato incompleti in attesa di pagamento -->
                                            <%
                                            if not Rsi.eof then response.write rsi("tot") else
                                            %> 

                                           <% if Rsi.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Ordini<br> in attesa di pagamento</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_mail_attesapagamento_u.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                         <!-- Gestione Storico Ordini-->
                                            <%
                                            if not rspc.eof then response.write rspc("tot") else
                                            %> 

                                           <% if rspc.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Storico<br> Ordini</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_storico_u.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
					
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="alert alert-info alert-dismissable">
                            <i class="fa fa-info-circle"></i>  <strong>Disponibilità Magazzino </strong>
                        </div>
                    </div>
                </div>
				    <div class="row">
                    <!--13072016-->
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file-text-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
										
                                          <!-- Gestione conteggio Articoli attivi -->
                                            <%
                                            if not rsssamy.eof then response.write rsssamy("TotArtMagY") else
                                            %> 

                                           <% if rsssamy.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Articoli Attivi Magazzino</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_articoli_elenco_u.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
					
                </div>
                    
                <!-- /.row -->

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

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
