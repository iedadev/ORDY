<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="../../include/funzioni.asp"-->
<%

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

Dim sss, i

%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Motherwords - Modulo Iscrizione Corsi Helen Doron</title>
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
					<h2>&nbsp;Modulo di iscrizione Corsi Helen Doron</h2>
				</hgroup>
				<hgroup>
					<h3>Dati del Genitore richiedente</h3>
				</hgroup>
				<form method="post" name="P2" action="salva.asp" onsubmit="return controllo()">
				<input required name='Gen_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Gen_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
				<input required name='Gen_Indirizzo' placeholder='Indirizzo' type = "text" size="75"><br><br>
				<input required name='Gen_CAP' maxlength="5" placeholder='CAP' type = "text" size="5">&nbsp;
				<input required name='Gen_Citta' placeholder='Città' type = "text" size="58">&nbsp;
				<input required name='Gen_Prov' placeholder='Prov.' type = "text" size="2" maxlength="2"><br><br>
				<input name='Gen_Phone' placeholder='Telefono' type = "text" size="35">&nbsp;
				<input name='Gen_Mobile' placeholder='Cellulare' type = "text" size="35"><br><br>
				<input required name='Gen_Email' placeholder='E-Mail' type="email" size="35"><br><br>
				<input name='Gen_CF' placeholder='Codice Fiscale' type = "text" size="35" maxlength="16">&nbsp;
				<input name='Gen_PI' placeholder='Partita Iva' type = "text" size="35" maxlength="11"><br><br>
				<hgroup><h3>Dati del bambino</h3></hgroup>
				<input required name='Stu_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Stu_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
				<hgroup>
					<h3>Data di nascita</h3>
				</hgroup>
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
				<hgroup>
					<h3>Asilo di provenienza</h3>
				</hgroup>
				<select required name='ID_Sede' size="1">
					<option value='65' >Guido Reni 1</option>
					<option value='54' >Guido Reni 11</option>
				</select>
				<br><br>
				<input type="hidden" name="ID_Programma" value="86">
				<input type="hidden" name="Frequenza" value="Monosettimanale">
				<hgroup>
					<h3>Ha già frequentato un Corso presso di noi?</h3>
				</hgroup>
				<select required name='gia_frequentato' size="1">
					<option value='' >Selezionare una risposta</option>
					<option value='SI' >SI</option>
					<option value='NO' >NO</option>
				</select>
				<br><br>
				<hgroup>
					<h3 style="height: 14px">Note</h3>
				</hgroup>
				<textarea name="commenti" cols="80" rows="3"></textarea>
				<br><br>
				<hgroup>
					<h3>Informazioni Utili</h3>
				</hgroup>
				<label>L'iscrizione ai corsi si intende perfezionata a fronte del versamento 
					della quota di iscrizione di &euro; 125,00. Pertanto, una volta effettuato il versamento, sarà necessario inviare la ricevuta attestante tale versamento all'indirizzo: <a href="mailto:direzione@motherwords.it">segreteria@motherwords.it</a><br></label><br>
				<hgroup>
					<h3 style="height: 14px">Come intendete pagare la quota di iscrizione di &#8364; 125,00?</h3>
				</hgroup>
				<select required name='Pagamento' size="1">
					<option value='' >Selezionare il metodo</option>
					<!--<option value='Contanti' >Contanti</option>-->
					<!--<option value='Assegno' >Assegno</option>-->
					<option value='Bonifico' >Bonifico</option>
					<option value='Carta di Credito' >Carta di Credito (Pagamento Immediato)</option>
					<!--<option value='Finanziamento' >Finanziamento Deutsche Bank (10 rate)</option>-->
				</select>
				<br><br>
				<hgroup><h3>Condizioni Generali e Accettazione</h3></hgroup>

				<ul id="container" class="form">
					<li class="check">
						<label>Il Genitore richiedente dichiara di aver letto le condizioni generali di fornitura della Motherwords di Gamberini Lorenza  e conferma l'iscrizione ai corsi sopra indicati</label>
					    <a onclick="document.getElementById('txt1').style.display='block'" href="javascript:void(0);" class="txtPop">
						Leggi e accetta le Condizioni Generali relative ai Corsi</a>
						<div class="txtPop" id="txt1" style="display: none; width: 600px; height: 400px;">
						<a onclick="$('#txt1').hide();" href="javascript:void(0);">
							Chiudi</a>
						<span style="width: 600px; height: 400px;"><strong>CONDIZIONI GENERALI RELATIVE AI CORSI</strong>
							<br/>
					        <br/>	
							<strong>Art. 1. Conclusione del Contratto</strong>
							<br/>
							<br/>
							La proposta contrattuale è formulata dal partecipante, sottoscrivendo il modulo di iscrizione tramite Motherwords di Gamberini Lorenza (di seguito "Motherwords").<br/>
							Nel modulo di iscrizione il partecipante precisa il corso a cui desidera partecipare tra quelli indicati nel modulo. Il modulo deve essere compilato e firmato in ogni sua parte e per i minori è necessaria la firma del genitore o del tutore esercente la potestà ed inoltrato ovvero consegnato a Motherwords.<br/>
							Motherwords si riserva il diritto di accettare la proposta per iscritto, facendo pervenire al partecipante conferma di prenotazione. Il modulo di iscrizione, che deve essere accompagnato dal versamento della somma prevista a titolo di preiscrizione, una volta accettato da Motherwords, costituisce parte integrante delle presenti condizioni generali.<br/>
							Qualora Motherwords non accetti l'iscrizione, restituirà al partecipante senza alcun interesse la somma da questi versata.<br/>
							<br/>
							<strong>Art. 2. Prestazioni a cui ha diritto il partecipante</strong>
							<br/>
							<br/>
							Le prestazioni a cui ha diritto il partecipante sono esclusivamente quelle indicate nel modulo di iscrizione.<br/>
							<br/>
							<strong>Art. 3. Luoghi e tempi</strong>
							<br/>
							<br/>
							I corsi saranno tenuti nei giorni e nelle sedi definiti al momento della organizzazione dei gruppi.<br/>
							<br/>
							<strong>Art. 4. Rinvio, cancellazione e sostituzioni dei corsi</strong>
							<br/>
							<br/>
							Motherwords si riserva il diritto di annullare o rinviare i corsi, dandone semplice comunicazione scritta o telefonica al partecipante.<br/>
							Le lezioni non tenute a causa impedimenti dell'insegnante (malattia, formazione), saranno comunque garantite da insegnanti supplenti.<br/>
							In caso di cancellazione del corso da parte di Motherwords prima dell'inizio delle lezioni, Motherwords sarà tenuta all'integrale rimborso di eventuali quote di iscrizione già versate dal partecipante, che potranno, altresì, su richiesta dello stesso partecipante, essere trattenute quale pagamento anticipato per la re-iscrizione ai corsi in nuove date.<br/>
							Resta espressamente esclusa qualsiasi altra forma di risarcimento o rimborso a favore del partecipante da parte di Motherwords.<br/>
							Qualora l'alunno sia impossibilitato a frequentare la lezione, sarà gradita tempestiva comunicazione in merito.<br/>
							<br/>
							<strong>Art. 5. Limitazioni di responsabilità</strong>
							<br/>
							<br/>
							In merito ai contenuti e al materiale utilizzato per i corsi, Motherwords dichiara che essi sono tenuti al massimo livello possibile di correttezza e congruenza.<br/>
							Nessuna richiesta di responsabilità potrà essere avanzata verso Motherwords qualora le informazioni fossero errate o per qualsiasi danno derivante dall'uso diretto o indiretto delle stesse.<br/>
							Per i corsi, da considerarsi quali prestazioni qualificate d'opera intellettuale, Motherwords non assumerà alcuna obbligazione oltre quelle previste dal presente contratto e non presterà alcuna garanzia in merito alle prestazioni fornite anche in relazione ai risultati di tali prestazioni o alla loro rispondenza ad uno scopo specifico.<br/>
							<br/>
							<strong>Art. 6. Modalità di pagamento</strong>
							<br/>
							<br/>
							Al momento della sottoscrizione del modulo di iscrizione il partecipante versa la somma a titolo di preiscrizione pari ad euro 290,00 (duecentonovanta/00) a copertura del costo del corso settimanale. Al momento dell'accettazione dell'iscrizione, tale somma è imputata in conto del pagamento dei servizi.<br/>
							Il versamento dell'acconto può avvenire secondo le seguenti modalità: tramite carta di credito, ovvero mediante bonifico bancario alle seguenti coordinate: IT02E0303201613010000001577.<br/>
							Il partecipante verserà l'intero corrispettivo pattuito anche nel caso in cui dovesse rimanere assente o interrompere temporaneamente o definitivamente la frequentazione per motivi non dipendenti da Motherwords.<br/>
							<br/>
							<strong>Art. 7. Clausola risolutiva espressa</strong>
							<br/>
							<br/>
							L'eventuale mancato rispetto dei termini di pagamento sopra indicati da parte del partecipante darà titolo a Motherwords di sospendere l'erogazione dei servizi nei confronti del partecipante.<br/>
							Motherwords potrà risolvere il contratto per fatto e colpa del partecipante nel caso in cui l'inadempimento si protragga per oltre 15 giorni.<br/>
							In tal caso, la risoluzione si verificherà di diritto a seguito di una comunicazione in tal senso di Motherwords, rimanendo a carico del partecipante l'obbligo di pagare l'intera prestazione.<br/>
							<br/>
							<strong>Art. 8. Mancato pagamento</strong>
							<br/>
							<br/>
							In caso di mancato saldo del prezzo Motherwords si riserva il diritto di trattenere a titolo di penale ogni somma ricevuta ed ottenere giudizialmente, anche in via monitoria, il pagamento del saldo e degli interessi di mora.<br/>
							<br/>
							<strong>Art. 9. Recesso nei contratti negoziati fuori dai locali commerciali</strong>
							<br/>
							<br/>
							Nel caso in cui il partecipante abbia concluso il presente Contratto in luogo diverso dai locali di Motherwords, questi ha diritto di recedere senza alcuna penalità e senza specificarne il motivo, entro il termine di dieci giorni lavorativi, mediante l'invio di una comunicazione scritta mediante lettera raccomandata con avviso di ricevimento indirizzata a Motherwords di Gamberini Lorenza, via Previati 74, Milano.<br/>
							La comunicazione potrà essere inviata, entro lo stesso termine, anche mediante telegramma, telex, posta elettronica e fax, a condizione che sia confermata mediante lettera raccomandata con avviso di ricevimento entro le quarantotto ore successive.<br/>
							<br/>
							<strong>Art. 10. Reclami</strong>
							<br/>
							<br/>
							Eventuali mancanze nell'esecuzione del contratto dovranno essere previamente contestate per iscritto e senza ritardo in modo da dare a Motherwords la possibilità di porvi rimedio.<br/>
							<br/>
							<strong>Art. 11. Regole Sanitarie</strong>
							<br/>
							<br/>
							Ad insindacabile giudizio di Motherwords, i partecipanti devono essere in uno stato di salute tale da poter partecipare attivamente alle attività proposte senza arrecare danno a se stessi o agli altri.<br/>
							Il genitore (o chi ne fa le veci) del minore è tenuto a comunicare tempestivamente e in forma scritta all'atto dell'iscrizione se il minore presenta patologie, allergie e/o fa uso di medicinali ecc., indicando chiarezza quali patologie sono presenti, allergie (alimentari, dermatologiche, respiratorie), infortuni, eventuali medicine in uso e altre notizie di carattere medico-sanitario.<br/>
							Qualora Motherwords rilevi che le condizioni sanitarie del partecipante non siano consone alle attività proposte, ovvero possano arrecare danno anche solo potenziale ad altri, il partecipante viene escluso dal corso per il tempo necessario, ovvero definitivamente, qualora le condizioni sanitarie non siano suscettibili di significativo miglioramento.<br/>
							Solo in quest'ultimo caso, viene rimborsata al partecipante la quota residua del corso.<br/>
							<br/>
							<strong>Art. 12. Regolamento interno</strong>
							<br/>
							<br/>
							All'interno dei locali di Motherwords è tassativamente vietato mangiare, fumare o fare uso di bevande alcoliche.<br/>
							E' assolutamente vietato tenere comportamenti pericolosi per sé e per gli altri, nonché comportamenti che, arrecando disturbo al regolare svolgimento delle lezioni, ne impediscano una soddisfacente fruizione agli altri partecipanti.<br/>
							In caso di Inosservanza del Regolamento Interno da parte dell'Allievo, Motherwords potrà risolvere il rapporto in qualsiasi momento, previa contestazione scritta degli addebiti mossi.<br/>
							In tale ipotesi il partecipante non avrà diritto al rimborso delle quote già versate. E' fatta salva la facoltà per Motherwords di esigere il risarcimento dell'eventuale maggior danno da essa sofferto o conseguente.<br/>
							<br/>
							<strong>Art. 13. Trattamento dati personali</strong>
							<br/>
							<br/>
							Ai sensi dell'art. 13 del D. Lgs. 196/2003, la società Motherwords informa che: il trattamento dei dati personali (di seguito, "Dati") conferiti alla società verranno utilizzati per la corretta erogazione dei servizi richiesti; la raccolta ed il trattamento dei Dati avviene anche con l'ausilio di strumenti elettronici, con accesso controllato e mediante l'adozione di misure di sicurezza previste nel Codice della Privacy;<br/>
							si precisa che non verranno trattati Dati di cui all'art. 4, lett. D) D. Lgs. 196/2003; titolare del trattamento Dati è Motherwords, con le modalità e per le finalità sopra indicate.<br/>
							Essi potranno essere conosciuti anche da collaboratori e dipendenti della società in qualità di responsabili o incaricati; i Dati potranno essere comunicati all'esterno della società a soggetti pubblici o privati a cui gli stessi debbono essere necessariamente comunicati per adempiere obblighi di legge e/o regolamento;<br/>
							i Dati potranno essere trasferiti anche temporaneamente fuori dal territorio dello Stato, verso soggetti con sede in Paesi non appartenenti all'Unione Europea per il corretto sviluppo dell'istruttoria e degli altri adempimenti procedimentali; in ogni momento il partecipante ha diritto di conoscere quali sono i suoi dati presso la società e come vengono utilizzati.<br/>
							Ha pure diritto di farli aggiornare, rettificare, integrare o cancellare ai sensi dell'art. 7 D. Lgs. 196/2003; i Dati vengono custoditi presso la sede operativa di Motherwords di Gamberini Lorenza, via Previati n. 74, Milano.<br/>
							Sottoscrivendo il presente contratto darete altresì il consenso al trattamento dei Dati sopra descritto.<br/>
							<br/>
							<strong>Art. 14. Liberatoria in relazione a riprese e a uscite</strong>
							<br/>
							<br/>
							Il genitore (o chi ne fa le veci) del succitato minore lo autorizza a partecipare a tutte le iniziative e uscite programmate dal Summer Camp.<br/>
							E' a conoscenza delle coperture assicurative valide durante l&#8217;erogazione dei servizi e libera gli operatori ed i rappresentanti della società Motherwords di Gamberini Lorenza da ogni responsabilità, sia civile che penale.<br/>
							Si autorizza la ditta Motherwords di Gamberini Lorenza e/o aventi causa ad effettuare foto e video e di utilizzarli in qualsiasi forma, purchè la pubblicazione non avvenga per perseguire finalità di natura economica.<br/>
							Ne vieta altresì l&#8217;uso in contesti che ne pregiudichino la dignità personale ed il decoro.<br/>
							La posa e l'utilizzo delle immagini sono da considerarsi effettuate in forma gratuità.<br/>
							<br/>
						</span> 
						</div>
						<div>
						<div><label>Accetto</label><input required type="checkbox" name="check-condizioni"></div>
						</div>
						</li>
					<li class="check">
						<div class="txtInfo">Ai sensi e per gli effetti dell'art. 1341 c.c. il partecipante da atto della propria approvazione specifica delle clausole e pattuizioni seguenti:<br>
						Art. 4 - Rinvio,cancellazione sostituzioni dei corsi;<br>
						Art. 5 - Limitazioni di responsabilità;<br>
						Art. 6 - Modalità di pagamento;<br>
						Art. 7 - Clausola risolutiva espressa;<br>
						Art. 11 - Regole sanitarie;<br>
						Art. 12 - Regolamento interno;</div>
						<div><label>Accetto</label><input required type="checkbox" name="check-articoli-aggiuntivi"></div>
					</li>
				</ul>
				<div class="contBtn ok">
				<input type="submit" value="ISCRIVITI" style="font-family: Arial; color: #054c71; font-size: 12pt; font-weight: bold; background-color: #bfc8cf">
				</div>
				</form>
			</article>
			
			<footer>
				<div class="credits">Motherwords di Gamberini Lorenza - Via 
					Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href="mailto:direzione@motherwords.it">direzione@motherwords.it
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
