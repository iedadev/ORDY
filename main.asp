<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->
<%

'response.end

'attesa pagamento
' s= "SELECT COUNT(*) as Tot FROM ORD_Richieste WHERE Datapagamento IS NULL GROUP BY DATAPAGAMENTO"
' Set rs = dbConn.Execute(s)

 'completi
 'sc= "SELECT COUNT(*) as Tot FROM ORD_Richieste WHERE STATOORDINE =1"
 'Set rsc = dbConn.Execute(sc)

 'incompleti
 'si= "SELECT COUNT(*) as Tot FROM ORD_Richieste WHERE STATOORDINE =0 AND DATAPAGAMENTO IS NOT NULL"
 'Set rsi = dbConn.Execute(si)
  
'assegnazioni
 'sa= "SELECT COUNT(*) as Tot FROM ORD_Assegnazioni WHERE STATOORDINE =0"
 sa="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Assegnazioni WHERE STATOORDINE =0 GROUP BY NUMORD) AS Step1"
 Set rsa = dbConn.Execute(sa)

'richieste
 'sr= "SELECT COUNT(*) as Tot FROM ORD_Richieste WHERE 1=1"
 sr="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Richieste WHERE 1=1 GROUP BY NUMORD) AS Step1"
 Set rsr = dbConn.Execute(sr)

'mail da inviare per ordini completati
sc= "SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_COMPLETATI WHERE EMAIL< 2 AND ARCHIVIO4=0 GROUP BY NUMORD ) AS Step1;"
Set rsc = dbConn.Execute(sc)

'mail da inviare per ordini in stato incompleti ma pagati
s="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_Richieste  WHERE STATOORDINE =0 AND DATAPAGAMENTO IS NOT NULL AND ARCHIVIO3 =0) AS Step1"
Set rs = dbConn.Execute(s)

'mail da inviare per ordini in stato incompleti in attesa di pagamento
si="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT NUMORD FROM ORD_Richieste  WHERE STATOORDINE =2 AND Datapagamento IS NULL AND ARCHIVIO2 =0 GROUP BY NUMORD) AS Step1"
Set rsi = dbConn.Execute(si)

'mail da inviare per ordini presi in carico
spc="SELECT Count(Step1.NUMORD) AS tot FROM (SELECT DISTINCT NUMORD FROM ORD_Richieste  WHERE INCARICO =1 AND ARCHIVIO1 =0  GROUP BY NUMORD) AS Step1"
Set rspc = dbConn.Execute(spc)

 'articoli non attivi
ssna = "SELECT COUNT(*) as Tot FROM ORD_Ritiri_Manuali"
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
ssmay = "SELECT COUNT(*) as TotArtMagY FROM ORD_Articoli WHERE ATTART= 'Y'"
Set rsssamy = dbConn.Execute(ssmay)
totmagatty= rsssamy("TotArtMagY")

'totale articoli consegnati 
'ssoc = "SELECT COUNT(*) as TotOrdCons FROM ORD_Completati_Storico"
ssoc= "SELECT Count(Step1.NUMORD) AS TotOrdCons FROM (SELECT DISTINCT NUMORD FROM ORD_COMPLETATI_STORICO  WHERE DATACONSEGNA IS NULL GROUP BY NUMORD) AS Step1"
Set rsssoc = dbConn.Execute(ssoc)
totordc= rsssoc("TotOrdCons")

'totale articoli consegnati parzialmente
'ssoc = "SELECT COUNT(*) as TotOrdCons FROM ORD_Completati_Storico"
ssocp= "SELECT Count(Step1.NUMORD) AS TotOrdConsParz FROM (SELECT DISTINCT NUMORD FROM ORD_CONS_PARZIALI  WHERE DATACONSEGNA IS NULL GROUP BY NUMORD) AS Step1"
Set rsssocp= dbConn.Execute(ssocp)
totordcp= rsssocp("TotOrdConsParz")

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

    <!--Intestazione-->
	
	<!--#include virtual file="include/title.asp"-->

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

        <!--#include virtual file="include/navigation.asp"-->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
               
                 <!--#include virtual file="include/heading.asp"--> 
                 <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                            <i class="fa fa-info-circle"></i>  <strong>Reminder</strong>
                        </div>
                        <div class="alert alert-warning">        
<a href="mailto:TuttiLC@learningcenter?bcc=segreteria@motherwords.it&subject=Avviso per i Learning Center! Scadenza Prenotazioni Ordini&body=
Ciao%0A
Vi segnalavo che la prossima scadenza per effettuare l'ordine è il <%=data1%>%0A
Per informazioni puoi contattare il numero 3391027789 %0A
Grazie,%0A Lorenza %0A%0A">
<img src="images/email.png" width="32" height="32" title="Invia mail"></a> <b>

                          &nbsp;<strong>Avviso per i Learning Center !</strong> Il termine ultimo per l'ordine è il <b><%=data1%></b>  

                           <% if differenza <=0 then %>
                                    <font color="green"><i class="fa fa-check-circle-o fa-2x"></i>&nbsp; Mancano <%=differenza%> giorni alla scadenza</font></b> 
                           <% else  %>
                                  <a href="ord_mail_scadenza.asp"><font color="red">&nbsp; ATTENZIONE! INSERIRE LA PROSSIMA DATA DI SCADENZA </font></b> </a>
                           <%end if %>  

                          <% if data2 > 0 then %>
                            <br>
                            <a href="ord_mail_attesapagamento.asp"><font color="red"><b><i class="fa fa-exclamation-triangle fa-2x"></i>&nbsp; ATTENZIONE Sono presenti ordini con <font color="blue">DATA ORDINE SUPERIORE A 5GG da oggi </font> SOLLECITARE IL PAGAMENTO </font></b> </a>
                           <%end if %>                
                        </div>
                        
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <i class="fa fa-info-circle"></i>  <strong>Gestione / Modifica Ordini</strong>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-truck fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">--</div>
                                        <div>Ordini da Helen Doron</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_gestione_nrordine.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">--</div>
                                        <div>Ordini da Learning Center</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_gestione_articoliLC_start.asp?NOCODE=0&ORD=1">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                            <!-- Gestione conteggio Elenco Stato Ordini  -->
                                            <%
                                            if not Rsr.eof then response.write rsr("tot") else
                                            %> 

                                           <% if Rsr.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Gestione / Modifica Stato Ordini</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_gestione_ordini_ricerca.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-database fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                         <!-- Gestione conteggio Ordini in assegnazione  -->
                                            <%
                                            if not Rsa.eof then response.write rsa("tot") else
                                            %> 

                                           <% if Rsa.eof then response.write "0" end if%>

                                        </div>
                                        <div>Assegnazione richieste</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_gestione_articoliAS.asp">
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
				<div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <i class="fa fa-info-circle"></i>  <strong>Gestione Comunicazioni Mail Learning Center</strong>
                            &nbsp; &nbsp; <a href="ord_mail_completi.asp"><button type="button" class="btn btn-success">Ordini Stato completo  <%response.write rsc("tot")%></button></a>
                            &nbsp; &nbsp; <a href="ord_mail_incompleti.asp"><button type="button" class="btn btn-danger">Ordini Stato Incompleto  <%response.write rs("tot")%></button></a>
                            &nbsp; &nbsp; <a href="ord_mail_attesapagamento.asp"><button type="button" class="btn btn-warning">Ordini in attesa di pagamento  <%response.write rsi("tot")%></button></a>
                            &nbsp; &nbsp; <a href="ord_mail_presiincarico.asp"><button type="button" class="btn btn-info">Ordini presi in carico  <%response.write rspc("tot")%></button></a>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                            &nbsp; &nbsp; <a href="ord_mail_archivio.asp"><button type="button" class="btn btn-primary">Archivio Mail </button></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <i class="fa fa-info-circle"></i>  <strong>Gestione Magazzino e Consegne Ordini </strong>
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
										
                                          <!-- Gestione Ordini Completi -->
                                            <%
                                            if not rsssoc.eof then response.write rsssoc("TotOrdCons") else
                                            %> 

                                           <% if rsssoc.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Richieste <b>COMPLETATE</b> in attesa di consegna</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_storico_ordini_consegnati_risultati.asp">
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
                                        <i class="fa fa-file-text-o fa-5x"></i>
                                    </div>
                                        <div class="col-xs-9 text-right">
                                        <div class="huge">
										
                                          <!-- Gestione Ordini Completi -->
                                            <%
                                            if not rsssocp.eof then response.write rsssocp("TotOrdConsParz") else
                                            %> 

                                           <% if rsssocp.eof then response.write "0" end if%>
                                        
                                        </div>
                                       <div>Richieste <b>PARZIALI</b> in attesa di consegna</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_storico_ordini_consegnati_parziali_risultati.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                        <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-check-square-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">

                                            <!-- Gestione conteggio Articoli non attivi -->
                                            <%
                                            if not Rsi.eof then response.write rssna("tot") else
                                            %> 

                                           <% if Rsi.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Gestione <b>CONSEGNE MANUALI KIT</b></div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_gestione_ordini_ritiro_start.asp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
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
                            <a href="ord_articoli_elenco.asp">
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
                                        <i class="fa fa-bell fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        
                                         <!-- Gestione Articoli Sottoscorta -->
                                            <%
                                            if not rssc.eof then response.write rssc("tot") else
                                            %> 

                                           <% if rssc.eof then response.write "0" end if%>
                                        
                                        </div>
                                        <div>Articoli Sottoscorta</div>
                                    </div>
                                </div>
                            </div>
                            <a href="ord_articoli_sottoscorta.asp">
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
