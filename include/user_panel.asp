<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main_user.asp">ORDY Milano Fiera</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%= session("usr") %><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="logoff.asp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="main.asp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
 
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-users fa-arrows-v"></i> Anagrafiche <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="ord_gestione_clienti.asp">Learning Center</a>
                            </li>
                            <li>
                                <a href="ord_gestione_fornitori.asp">Fornitori</a>
                            </li>
							<li>
                                <a href="ord_gestione_magazzini.asp">Magazzini</a>
                            </li>
                            <li>
                                <a href="ord_anag_mon.asp">Kit Monitoring LC</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-building-o fa-arrows-v"></i> Ordini Magazzino <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="ord_gestione_nrordine.asp">Ordini da Helen Doron</a>
                            </li>
                            <li>
                                <a href="ord_gestione_articoliLC_start.asp?NOCODE=0&ORD=1">Ordini da Learning Center</a>
                            </li>
							<li>
                                <a href="ord_gestione_ordini_risultati.asp?IDStatoOrdine=2">Modifica Articoli Ordini</a>
                            </li>
							<li>
                                <a href="ord_gestione_ordini_ricerca.asp">Stato Ordini</a>
                            </li>
							<li>
                                <a href="ord_gestione_articoliAS.asp">Assegnazione Ordini</a>
                            </li>
                            <li>
                                <a href="ord_storico.asp">Storico Ordini</a>
                            </li>
                        </ul>
                    </li>
                                        <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-building-o fa-arrows-v"></i> Articoli Magazzino <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo3" class="collapse">
                            <li>
                                <a href="ord_articoli_elenco.asp">Gestione Articoli Magazzino</a>
                            </li>
							<li>
                                <a href="ord_articoli_sottoscorta.asp">Articoli Sottoscorta</a>
                            </li>
                             <li>
                                <a href="ord_articoli_nonattivi.asp">Articoli non Attivi</a>
                            </li>
                            <li>
                                <a href="ord_gestione_articoli.asp">Nuovo Articolo</a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-envelope fa-arrows-v"></i> Comunicazioni <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="ord_mail_presiincarico.asp">Ordini Presi in carico</a>
                            </li>
                            <li>
                                <a href="ord_mail_attesapagamento.asp">Ordini Attesa Pagamento</a>
                            </li>
                            <li>
                                <a href="ord_mail_incompleti.asp">Ordini Incompleti</a>
                            </li>
                            <li>
                                <a href="ord_mail_completi.asp">Ordini Completi</a>
                            </li>
                             <li>
                                <a href="ord_mail_scadenza.asp">Data Scadenza Prossimo Ordine</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo4"><i class="fa fa-signal"></i> Reportistica <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo4" class="collapse">
                            <li>
                                <a href="rep_valmag.asp">Totale Magazzino</a>
                            </li>
                            <li>
                                <a href="xls_articoli_elenco.asp">Situazione Articoli Magazzino <i class="fa fa-file-excel-o"></i></a>
                            </li>
							                            <li>
                                <a href="rep_kit_monitoring.asp">Kit Learning Center</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="ord_crediti.asp"><i class="fa fa-fw fa-file"></i> Crediti</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
