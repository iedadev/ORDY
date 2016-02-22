<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="../../include/funzioni.asp"-->
<%

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

Dim sss, i

%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Helen Doron Milano Fiera - Modulo Iscrizione Esami Cambridge</title>
		<link rel="stylesheet" href="main.css">
		<script language="JavaScript" src="jquery-1.7.2.min.js"></script>
		<script language="JavaScript" src="jquery.blockUI.js"></script>
		<script language="JavaScript" src="jquery.uniform.min.js"></script>
		<link href="favicon.ico" rel="icon" /> 
		<link href="reset.css" rel="stylesheet" type="text/css" title="default" />
		<link rel="stylesheet" href="uniform.default.css" media="screen" />
		<link href="form.css" rel="stylesheet" type="text/css" title="default" />
		
		<!--[if lt IE 9]>
		<script>
		document.createElement('header');
		document.createElement('nav');
		document.createElement('section');
		document.createElement('article');
		document.createElement('aside');
		document.createElement('footer');
		document.createElement('hgroup');
		</script>
		
		<link href="formIE.css" rel="stylesheet" type="text/css" title="default" />
		
		<![endif]-->
		<style type="text/css">
			input.error, select.error{
				background-color: #F9E4E4 !important;
				border: 1px solid #D44D4D !important;
			}
			span.error{
				background-position: 0 -217px !important;
			}
			span.error.checked{
				background-position: -34px -217px !important;
			}
			.selector span.error{
				background-position: right -328px !important;
			}
			div.selector.error{
				background-position: 0 -370px !important;
			}				
		</style>
<script type="text/javascript">

<!--
function controllo()
{

if ((document.P2.Gen_CF.value == "") && (document.P2.Gen_PI.value == ""))
	{
	alert("E' necessario inserire il Codice Fiscale e/o la Partita IVA");
	document.P2.Gen_PI.style.backgroundColor = 'Orange';
	document.P2.Gen_CF.style.backgroundColor = 'Orange';
	return false;
	}

if ((document.P2.Gen_Phone.value == "") && (document.P2.Gen_Mobile.value == ""))
	{
	alert("E' necessario inserire almeno un recapito telefonico");
	document.P2.Gen_Phone.style.backgroundColor = 'Orange';
	document.P2.Gen_Mobile.style.backgroundColor = 'Orange';
	document.P2.Gen_PI.focus();
	return false;
	}


}
//-->
</script>

	</head>
	<body>			
		<div class="container clearfix">
			<header 
			          >
				<h1 class="logo"> <a href="#"></a>
				</h1>
				
			</header>
			<article>
				<hgroup>
					<h2>&nbsp;Modulo di iscrizione Esame Cambridge</h2>
				</hgroup>
				<hgroup><h3>Dati del Genitore richiedente</h3></hgroup>
				<form method="post" name="P2" action="salva.asp" onsubmit="return controllo()">
				<input required name='Gen_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Gen_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
				<input required name='Gen_Indirizzo' placeholder='Indirizzo' type = "text" size="75"><br><br>
				<input required name='Gen_CAP' maxlength="5" placeholder='CAP' type = "text" size="5">&nbsp;
				<input required name='Gen_Citta' placeholder='Città' type = "text" size="58">&nbsp;
				<input required name='Gen_Prov' placeholder='Prov.' type = "text" size="2" maxlength="2"><br><br>
				<input name='Gen_Phone' placeholder='Telefono' type = "text" size="35">&nbsp;
				<input name='Gen_Mobile' placeholder='Cellulare' type = "text" size="35"><br><br>
				<input name='Gen_Email' placeholder='E-Mail' type="email" size="35"><br><br>
				<input name='Gen_CF' placeholder='Codice Fiscale' type = "text" size="35" maxlength="16">&nbsp;
				<input name='Gen_PI' placeholder='Partita Iva' type = "text" size="35" maxlength="11"><br><br>
				<hgroup><h3>Dati del bambino</h3></hgroup>
				<input required name='Stu_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Stu_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
				<input required name='Stu_Nazionalita' placeholder='Nazionalità' type = "text" size="35">&nbsp;
				<input required name='Stu_Madrelingua' placeholder='Madrelingua' type = "text" size="35"><br><br>
				<hgroup><h3>Data di nascita</h3></hgroup>
				<select required name='Stu_Giorno' size="1" style="height: 22px">
					<option value='' >Giorno</option>
					<option value='01' >01</option>
					<option value='02' >02</option>
					<option value='03' >03</option>
					<option value='04' >04</option>
					<option value='05' >05</option>
					<option value='06' >06</option>
					<option value='07' >07</option>
					<option value='08' >08</option>
					<option value='09' >09</option>
					<option value='10' >10</option>
					<option value='11' >11</option>
					<option value='12' >12</option>
					<option value='13' >13</option>
					<option value='14' >14</option>
					<option value='15' >15</option>
					<option value='16' >16</option>
					<option value='17' >17</option>
					<option value='18' >18</option>
					<option value='19' >19</option>
					<option value='20' >20</option>
					<option value='21' >21</option>
					<option value='22' >22</option>
					<option value='23' >23</option>
					<option value='24' >24</option>
					<option value='25' >25</option>
					<option value='26' >26</option>
					<option value='27' >27</option>
					<option value='28' >28</option>
					<option value='29' >29</option>
					<option value='30' >30</option>
					<option value='31' >31</option>
				</select>
				&nbsp;
				<select required name='Stu_Mese' size="1" style="height: 22px">
					<option value='' >Mese</option>
					<option value='01' >Gennaio</option>
					<option value='02' >Febbraio</option>
					<option value='03' >Marzo</option>
					<option value='04' >Aprile</option>
					<option value='05' >Maggio</option>
					<option value='06' >Giugno</option>
					<option value='07' >Luglio</option>
					<option value='08' >Agosto</option>
					<option value='09' >Settembre</option>
					<option value='10' >Ottobre</option>
					<option value='11' >Novembre</option>
					<option value='12' >Dicembre</option>
				</select>
				&nbsp;
				<input required name='Stu_Anno' placeholder='Anno' type = "text" size="4" maxlength="4"><br><br>
				<hgroup><h3>Centro di Preparazione</h3></hgroup>
				<select required name='Stu_Centro' size="1" style="height: 22px">
					<option value='' >Selezionare un Centro</option>
					<%
					Set rs = dbConn.Execute("SELECT * FROM CB_Sede Where Attivo = 'SI' ORDER BY Sede_CB")
					While not rs.eof
					%>
					<option value="<%= rs("ID_Sede_CB") %>"><%= rs("Sede_CB") %></option>
					<%
					rs.movenext
					wend
					%>
				</select>
				<br><br>
				<hgroup><h3>Corso Helen Doron di provenienza</h3></hgroup>
				<select required name='Stu_Corso_HD' size="1" style="height: 22px">
					<option value='' >Selezionare un Corso</option>
					<%
					Set rs = dbConn.Execute("SELECT * FROM HD_Programmi WHERE Visibile_Cambridge = 'SI' ORDER BY Sigla")
					While not rs.eof
					%>
					<option value="<%= rs("ID_Programma") %>"><%= rs("Sigla") %></option>
					<%
					rs.movenext
					wend
					%>
				</select>
				<br><br>
				<hgroup><h3>Scelta dell'Esame</h3></hgroup>
				<select required name='Stu_Esame' size="1">
					<option value='' >Selezionare un Esame</option>
					<%
					Set rs = dbConn.Execute("SELECT * FROM CB_Esami Where Esame_CB_Attivo = 'SI' ORDER BY ID_Esame_CB")
					While not rs.eof
					%>
					<option value="<%= rs("ID_Esame_CB") %>"><%= rs("Esame_CB") & " - &euro;" & rs("Esame_CB_Prezzo") %></option>
					<%
					rs.movenext
					wend
					%>
				</select>
				<br><br>
				<hgroup><h3>Sede dell'Esame</h3></hgroup>
				<select required name='Stu_Sede_Esame' size="1">
					<option value='' >Selezionare una Sede</option>
					<%
					Set rs = dbConn.Execute("SELECT * FROM CB_Sede Where Attivo = 'SI' And Sede_Esame = 'SI' ORDER BY Sede_CB")
					While not rs.eof
					%>
					<option value="<%= rs("ID_Sede_CB") %>"><%= rs("Sede_CB") %></option>
					<%
					rs.movenext
					wend
					%>
				</select>
				<br><br>
				<!--<hgroup><h3>Data dell'Esame</h3></hgroup>
				<select required name='Esame_Giorno' size="1" style="height: 22px">
					<option value='' >Giorno</option>
					<option value='01' >01</option>
					<option value='02' >02</option>
					<option value='03' >03</option>
					<option value='04' >04</option>
					<option value='05' >05</option>
					<option value='06' >06</option>
					<option value='07' >07</option>
					<option value='08' >08</option>
					<option value='09' >09</option>
					<option value='10' >10</option>
					<option value='11' >11</option>
					<option value='12' >12</option>
					<option value='13' >13</option>
					<option value='14' >14</option>
					<option value='15' >15</option>
					<option value='16' >16</option>
					<option value='17' >17</option>
					<option value='18' >18</option>
					<option value='19' >19</option>
					<option value='20' >20</option>
					<option value='21' >21</option>
					<option value='22' >22</option>
					<option value='23' >23</option>
					<option value='24' >24</option>
					<option value='25' >25</option>
					<option value='26' >26</option>
					<option value='27' >27</option>
					<option value='28' >28</option>
					<option value='29' >29</option>
					<option value='30' >30</option>
					<option value='31' >31</option>
				</select>
				&nbsp;
				<select required name='Esame_Mese' size="1" style="height: 22px">
					<option value='' >Mese</option>
					<option value='01' >Gennaio</option>
					<option value='02' >Febbraio</option>
					<option value='03' >Marzo</option>
					<option value='04' >Aprile</option>
					<option value='05' >Maggio</option>
					<option value='06' >Giugno</option>
					<option value='07' >Luglio</option>
					<option value='08' >Agosto</option>
					<option value='09' >Settembre</option>
					<option value='10' >Ottobre</option>
					<option value='11' >Novembre</option>
					<option value='12' >Dicembre</option>
				</select>
				&nbsp;
				<select required name='Esame_Anno' size="1" style="height: 22px">
					<option value='' >Anno</option>
					<option value='<%= Year(Now) %>'><%= Year(Now) %></option>
					<option value='<%= Year(Now) + 1 %>'><%= Year(Now) + 1 %></option>
				</select>
				<br><br>-->
				<hgroup>
					<h3>Ha già sostenuto un esame Cambridge presso di noi?</h3>
				</hgroup>
				<select required name='gia_frequentato' size="1">
					<option value='' >Selezionare una risposta</option>
					<option value='SI' >SI</option>
					<option value='NO' >NO</option>
				</select>
				<br><br>
				<hgroup>
					<h3 style="height: 14px">Come intendete pagare la quota di iscrizione?</h3>
				</hgroup>
				<select required name='Pagamento' size="1">
					<option value='' >Selezionare il metodo</option>
					<!--<option value='Contanti' >Contanti</option>
					<option value='Assegno' >Assegno</option>-->
					<option value='Bonifico' >Bonifico</option>
					<option value='Carta di Credito' >Carta di Credito (Pagamento Immediato)</option>
				</select>
				<br><br>
				<hgroup>
					<h3>Informazioni Utili</h3>
				</hgroup>
				<label>
					-&nbsp;&nbsp;Le richieste di iscrizione dei candidati della scuola devono pervenire ai nostri uffici tramite questo modulo di iscrizione.<br/>
					-&nbsp;&nbsp;L'iscrizione si intende perfezionata con il pagamento della quota richiesta.<br/>In caso si decida di pagare tramite bonifico, una copia della contabile dovrà essere inviata all'indirizzo <a href="mailto:segreteria@motherwords.it">segreteria@motherwords.it</a><br/>
					-&nbsp;&nbsp;Al momento dell'iscrizione riceverete una email automatica di conferma.<br/>In caso di mancata ricezione dell'email di conferma, contattare la sede della scuola per verificare l'effettivo buon fine dell'iscrizione via email: <a href="mailto:segreteria@motherwords.it">segreteria@motherwords.it</a> oppure recandosi presso le nostre sedi: MOTHERWORDS di Gamberini Lorenza, via Previati 74, 20149 Milano<br/>In caso di problemi contattate il referente Lorenza Gamberini 3391027789<br/>
					-&nbsp;&nbsp;Le informazioni relative alla sede e all'orario delle prove di esame (scritto e orale) verranno comunicate circa 2-3 settimane prima delle prove stesse.<br/>
					-&nbsp;&nbsp;Iscrizioni oltre la data di scadenza possono essere accettate a discrezione del Centro d'esame e dietro pagamento di una sopratassa di 50,00 euro entro 05 giorni dopo la data di chiusura o di 100,00 euro dopo oltre 10 giorni dalla data di chiusura.<br/>
				</label>
				<br/>
				<hgroup><h3>Condizioni Generali relative agli Esami e Accettazione</h3></hgroup>

				<ul id="container" class="form">
					<li class="check">
						<label>Il Genitore richiedente dichiara di aver letto le condizioni generali di fornitura della Motherwords di Gamberini Lorenza  e conferma l'iscrizione all'esame 
						sopra indicato</label>
					    <a onclick="document.getElementById('txt1').style.display='block'" href="javascript:void(0);" class="txtPop">
						Leggi e accetta le Condizioni Generali relative ai Corsi</a>
						<div class="txtPop" id="txt1" style="display: none; width: 600px; height: 400px;">
						<a onclick="$('#txt1').hide();" href="javascript:void(0);">
							Chiudi</a>
						<span style="width: 600px; height: 400px;"><strong>CONDIZIONI GENERALI RELATIVE AGLI ESAMI CAMBRIDGE</strong>
							<br/>
					        <br/>	
							<strong>Art. 1.</strong>
							<br/>
							<br/>
							Le iscrizioni sono valide solo per una sessione d'esame. Non è possible trasferire la tassa di iscrizione a sessioni successive nè ad altri tipi di esame nella stessa sessione.
							<br/>
							<br/>
							<strong>Art. 2.</strong>
							<br/>
							<br/>
							L'iscrizione è nominativa e in nessun caso può essere trasferita ad altri.
							<br/>
							<br/>
							<strong>Art. 3.</strong>
							<br/>
							<br/>
							Eventuali esclusioni di date relative alle prove orali nell'ambito della finestra prevista per singoli candidati o per l'intero gruppo devono essere comunicate all'atto dell'iscrizione.<br/>
							Le date della prova orale vengono comunicate almeno due- tre settimane prima della data in cui si svolgerà la prova scritta. Per motivi organizzativi gli esami si possono svolgere anche durante il weekend. La data della prova orale, una volta stabilita dal Centro d'esame, non puo essere cambiata. La data della prova orale sara compresa tra il tempo che intercorre tra una settimana prima e una settimana dopo la data delle prove scritte e potra anche coincidere con il giorno delle prove scritte.
							<br/>
							<br/>
							<strong>Art. 4.</strong>
							<br/>
							<br/>
							Il rimborso del 30% verra concesso solo in caso di malattia certificata entro 7 giorni dalla data dell'esame scritto.
							<br/>
							<br/>
							<strong>Art. 5.</strong>
							<br/>
							<br/>
							Tutte le prove d'esame vengono corrette e valutate da Cambridge English Language Assessment che  trasmette i risultati al Centro d'esame. I risultati degli esami sono definitivi e insindacabili.<br/>
							Le prove d'esame rimangono proprieta di Cambridge English Language Assessment e non possono essere restituite. Le scuole/universita/docenti/aziende che fanno iscrizioni collettive riceveranno una copia dei risultati dei loro candidati.
							<br/>
							<br/>
							<strong>Art. 6.</strong>
							<br/>
							<br/>
							MOTHERWORDS di Gamberini Lorenza, centro d'esame IT 946 non puo essere ritenuta responsabile di eventuali interruzioni durante la gestione degli esami dovute a cause non dipendenti dalla sua volontà.
							<br/>
							<br/>
							<strong>Art. 7. Trattamento dati personali</strong>
							<br/>
							<br/>
							Nel rispetto delle disposizioni normative vigenti, si informa il candidato che i dati personali che lo riguardano raccolti, anche verbalmente, presso l'interessato o da terzi, sono trattati da Cambridge English Language Assessment Centre N° IT 946 Motherwords di Gamberini Lorenza, via Alberto Mario 6 Milano,  in qualita di titolare del trattamento. I dati saranno altresi comunicati e trattati da Cambridge English Language Assessment, con sede in Cambridge (UK), in conformita agli accordi contrattuali.<br/>
							I dati personali del candidato sono trattati dai soggetti sopra indicati per l'adempimento degli obblighi di legge, per l'esecuzione delle prestazioni oggetto del contratto e delle attivita preliminari, secondo le modalita e i termini concordati ed accettati dal candidato. I dati personali del candidato potranno essere trattati per finalita di rilevamento statistico esclusivamente in forma anonima.<br/>
							II trattamento e la comunicazione dei dati personali del candidato sono effettuati manualmente e con l'ausilio di mezzi elettronici e automatizzati, con strumenti e modalita idonei a garantire la sicurezza e la riservatezza nell'attivita di trattamento, secondo logiche correlate e connesse alle finalita del trattamento.<br/>
							Fermo quanto previsto dall'art. 24, primo comma, D. Legis. 196/2003, il conferimento dei dati personali richiesti e il consenso al relativo trattamento, anche da parte dei terzi ai quali i dati sono comunicati per l'esecuzione delle prestazioni contrattuali, e necessario e in mancanza di essi non e possibile effettuare la prestazione richiesta dall'interessato.<br/>
							Con riferimento al trattamento dei propri dati personali, il candidato puo esercitare i diritti di cui all'art. 7 D. Legis. 196/2003, che di seguito si riporta:<br/>
							"Art. 7. Diritto di accesso ai dati personali ed altri diritti<br/>
							1.&nbsp;&nbsp;L'interessato ha diritto di ottenere la conferma dell'esistenza o meno di dati personali che lo riguardano, anche se non ancora registrati, e la loro comunicazione in forma intelligibile.<br/>
							2.&nbsp;&nbsp;L'interessato ha diritto di ottenere l'indicazione:<br/>
							&nbsp;a)&nbsp;&nbsp;dell'origine dei dati personali;<br/>
							&nbsp;b)&nbsp;&nbsp;delle finalita e modalita del trattamento;<br/>
							&nbsp;c)&nbsp;&nbsp;della logica applicata in caso di trattamento effettuato con l'ausilio di strumenti elettronici;<br/>
							&nbsp;d)&nbsp;&nbsp;degli estremi identificativi del titolare, dei responsabili e del rappresentante designato ai sensi dell'articolo 5, comma 2;<br/>
							&nbsp;e)&nbsp;&nbsp;dei soggetti o delle categorie di soggetti ai quali i dati personali possono essere comunicati o che possono venirne a conoscenza in qualita di rappresentante designato nel territorio dello Stato, di responsabili o incaricati.<br/>
							3.&nbsp;&nbsp;L'interessato ha diritto di ottenere:<br/>
							&nbsp;a)&nbsp;&nbsp;l'aggiornamento, la rettificazione ovvero, quando vi ha interesse, l'integrazione dei dati;<br>
							&nbsp;b)&nbsp;&nbsp;la cancellazione, la trasformazione in forma anonima o il blocco dei dati trattati in violazione di legge, compresi quelli di cui non e necessaria la conservazione in relazione agli scopi per i quali i dati sono stati raccolti successivamente trattati;<br/>
							&nbsp;c)&nbsp;&nbsp;l'attestazione che le operazioni di cui alle lettere a) e b) sono state portate a conoscenza, anche per quanto riguarda il loro contenuto, di coloro ai quali i dati sono stati comunicati o diffusi, eccettuato il caso in cui tale adempimento si rivela impossibile o comporta un impiego di mezzi  manifestamente sproporzionato rispetto al diritto tutelato.<br/>
							&nbsp;d)&nbsp;&nbsp;L'interessato ha diritto di opporsi, in tutto o in parte:<br/>
							&nbsp;e)&nbsp;&nbsp;per motivi legittimi al trattamento dei dati personali che lo riguardano, ancorche pertinenti allo scopo della raccolta;<br/>
							&nbsp;f)&nbsp;&nbsp;al trattamento di dati personali che lo riguardano a fini di invio di materiale pubblicitario o di vendita diretta o per il compimento di ricerche di mercato o di comunicazione commerciale.<br/><br/>
							Dichiaro di aver ricevuto l'informativa rilasciatami ai sensi dell'art. 13, D.Legis. 30 Giugno 2003 n. 196 e di dare il mio consenso al trattamento ed alla comunicazione dei miei dati personali.
							<br/>
							<br/>
						</span> 
						</div>
						<label>Accetto</label><input required type="checkbox" name="check-condizioni">
					</li>
					<!--<li class="check">
						<div class="txtInfo">Ai sensi e per gli effetti dell'art. 1341 c.c. il partecipante da atto della propria approvazione specifica delle clausole e pattuizioni seguenti:<br>
						Art. 4 - Rinvio,cancellazione sostituzioni dei corsi;<br>
						Art. 5 - Limitazioni di responsabilità;<br>
						Art. 6 - Modalità di pagamento;<br>
						Art. 7 - Clausola risolutiva espressa;<br>
						Art. 11 - Regole sanitarie;<br>
						Art. 12 - Regolamento interno;</div>
						<div><label>Accetto</label><input required type="checkbox" name="check-articoli-aggiuntivi"></div>
					</li>-->
				</ul>
				<div class="contBtn ok">
				<input type="submit" value="ISCRIVITI" style="font-family: Arial; color: #054c71; font-size: 12pt; font-weight: bold; background-color: #bfc8cf">
				</div>
				</form>
			</article>
			
			<footer>
				<div class="credits">Motherwords di Gamberini Lorenza - Via Previati, 74 20159 Milano - Tel. 02-87381568 - <a href="mailto:direzione@motherwords.it">direzione@motherwords.it
					</a>- P.I. 04593400965</div>
			</footer>
		</div>
		<script type="text/javascript">
   			 $(document).ready(sortDropDownListByText);
		</script>
	</body>
</html>
<%
set rs = Nothing
set dbconn = Nothing
%>
