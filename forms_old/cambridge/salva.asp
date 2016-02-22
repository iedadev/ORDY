<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="../../include/funzioni.asp"-->
<!-- #include virtual file = "../../include/hex_sha1_js.asp" -->
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
<%

Dim zzz, sss, testohtml, alias, importo, divisa, codTrans, mail, url_back, languageId, urlpost, mac, url, prezzoesame

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

sss = "INSERT INTO CB_Iscrizioni "
sss = sss & "(Genitore_Nome, Genitore_Cognome, Genitore_Indirizzo, "
sss = sss & "Genitore_CAP, Genitore_Citta, Genitore_Prov, Genitore_Phone, Genitore_Mobile, Genitore_Email, "
sss = sss & "Genitore_CF, Genitore_PIVA, Studente_Nome, Studente_Cognome, Studente_Data_Nascita, "
sss = sss & "Studente_Nazionalita, Studente_Madrelingua, ID_Sede_Prep, ID_Corso_Prep, ID_Esame, ID_Sede_Esame, Dataesame, "
sss = sss & "gia_frequentato, [check-condizioni], [check-articoli-aggiuntivi], Datains, Verificato, Pagamento, codtrans, codtrans_esito) VALUES "
sss = sss & "('" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Indirizzo")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_CAP")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Citta")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Prov")))) & "',"
sss = sss & " '" & ModificaApici(PulisciTel(request("Gen_Phone"))) & "',"
sss = sss & " '" & ModificaApici(PulisciTel(request("Gen_Mobile"))) & "',"
sss = sss & " '" & LCase(ModificaApici(Trim(Request("Gen_Email")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_CF")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_PI")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Nazionalita")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Madrelingua")))) & "',"
sss = sss & " " & Request("Stu_Centro") & ","
sss = sss & " " & Request("Stu_Corso_HD") & ","
sss = sss & " " & Request("Stu_Esame") & ","
sss = sss & " " & Request("Stu_Sede_Esame") & ","
'sss = sss & " '" & Request("Esame_Giorno") & "/" & Request("Esame_Mese") & "/" & Request("Esame_Anno") & "',"
sss = sss & " Null,"
sss = sss & " '" & Request("gia_frequentato") & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-condizioni")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-articoli-aggiuntivi")))) & "',"
sss = sss & " '" & Now() & "', 'NO', '" & Request("Pagamento") & "', Null, Null)"

Set rs = dbConn.Execute(sss)

Set rs1 = dbConn.Execute("SELECT * FROM CB_Esami WHERE ID_Esame_CB = " & Request("Stu_Esame"))

prezzoesame = Replace(Trim(rs1("Esame_CB_Prezzo")), ",", "")

Set rs2 = dbConn.Execute("SELECT * FROM CB_Sede WHERE ID_Sede_CB = " & Request("Stu_Sede_Esame"))

Set rs3 = dbConn.Execute("Select MAX(ID_Iscrizione) AS MaxID From CB_Iscrizioni")

''---------------- INVIO EMAIL A SEGRETERIA ------------------------------

	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Modulo Iscrizione Corsi 2014-2015 - Motherwords</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script><link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' /><link href='form.css' rel='stylesheet' type='text/css' title='default' /><!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script>"
	testohtml = testohtml & "<link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]--><style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head><body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header><article><hgroup><h2><span id=':1tl' dir='ltr'>Ciao Loretta,<br>&eacute; arrivata una nuova iscrizione ad un esame Cambridge</span></h2></hgroup><hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "<br>"
	testohtml = testohtml & UCase(ModificaApici(Trim(Request("Gen_Indirizzo")))) & "<br>" & Request("Gen_CAP") & " " & UCase(ModificaApici(Trim(Request("Gen_Citta")))) & " (" & UCase(ModificaApici(Trim(Request("Gen_Prov")))) &")<br>"
	testohtml = testohtml & "Telefono: " & Request("Gen_Phone") & "<br>"
	testohtml = testohtml & "Cellulare: " & Request("Gen_Mobile") & "<br>"
	testohtml = testohtml & "Email: " & Request("Gen_Email") & "<br>"
	testohtml = testohtml & "Codice Fiscale: " & Request("Gen_CF") & "<br>"
	testohtml = testohtml & "Partita Iva: " & Request("Gen_PI") & "<br>"
	testohtml = testohtml & "<hgroup><h3>Dati del bambino</h3></hgroup>"
	testohtml = testohtml & "Nome e Cognome: " & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "<br>"
	testohtml = testohtml & "Data di nascita: " & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno")))
	testohtml = testohtml & "<br><br><hgroup><h3>Dati Esame</h3></hgroup>"
	testohtml = testohtml & "Esame: " & rs1("Esame_CB") & " - &euro;" & rs1("Esame_CB_Prezzo") & "<br>"
	testohtml = testohtml & "Sede: " & rs2("Sede_CB") & "<br>"
	'testohtml = testohtml & "Giorno: " & Request("Esame_Giorno") & "/" & Request("Esame_Mese") & "/" & Request("Esame_Anno") & "<br>"
	testohtml = testohtml & "Pagamento: " & Request("Pagamento") & "<br>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Previati, 74 20159 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>"
	testohtml = testohtml & "direzione@motherwords.it</a>- P.I. 04593400965</div></footer></div></body></html>"

	'Crea l'oggetto configurazione (per eventuale invio tramite un SMTP selezionato
	Set objConfig = Server.CreateObject("CDO.Configuration")
	'Out going SMTP server 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.googlemail.com" 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "iscrizioni@motherwords.it"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "iscrizioni14"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objConfig.Fields.Update 
	'Crea l'oggetto Mail
	Set objMail = Server.CreateObject("CDO.Message")
	'Assegnazione dati agli oggetti
	Set objMail.Configuration = objConfig
	objMail.From = "iscrizioni@motherwords.it"
	objMail.To = "segreteria@motherwords.it"
	'objMail.To = "erik.tagliabue@gmail.com"
	'objMail.CC = LCase(trim(request("CC")))
	'objMail.BCC = "erik.tagliabue@gmail.com"
	objMail.ReplyTo = "segreteria@motherwords.it"
	objMail.Organization = "Motherwords"
	objMail.Subject= "Iscrizione Esame Cambridge"
	'objMail.TextBody = ModificaApici(trim(request("Testo")))
	'objMail.AddAttachment "e:\allegatimail"
	'objMail.AddAttachment server.mappath("DEM_ITA_Cosmit.pdf")
	objMail.HTMLBody = testohtml
	'Stabiliamo il livello di importanza (1 o 2)
	objMail.Fields("urn:schemas:httpmail:importance").Value = 2
	objMail.Fields.Update()
	'Invia la mail
	objMail.Send 
	
	'Pulizia Oggetti
	Set objMail = Nothing
	Set objConfig = Nothing
		
'---------------- INVIO EMAIL ------------------------------

'---------------- INVIO EMAIL A Genitore ------------------------------

	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Iscrizione Corsi 2014-2015 - Motherwords</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script><link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' />"
	testohtml = testohtml & "<link href='form.css' rel='stylesheet' type='text/css' title='default' /><!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script>"
	testohtml = testohtml & "<link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]--><style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head><body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header>"
	testohtml = testohtml & "<article><hgroup><h2><span id=':1tl' dir='ltr'>"
	testohtml = testohtml & "Gentile genitore,<br>il Vostro bambino agli esami Cambridge YL presso il centro di esame autorizzato IT946 - Helen Doron Fiera</span></h2></hgroup>"
	testohtml = testohtml & "<hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "<br>"
	testohtml = testohtml & UCase(ModificaApici(Trim(Request("Gen_Indirizzo")))) & "<br>" & Request("Gen_CAP") & " " & UCase(ModificaApici(Trim(Request("Gen_Citta")))) & " (" & UCase(ModificaApici(Trim(Request("Gen_Prov")))) &")<br>"
	testohtml = testohtml & "Telefono: " & Request("Gen_Phone") & "<br>"
	testohtml = testohtml & "Cellulare: " & Request("Gen_Mobile") & "<br>"
	testohtml = testohtml & "Email: " & Request("Gen_Email") & "<br>"
	testohtml = testohtml & "Codice Fiscale: " & Request("Gen_CF") & "<br>"
	testohtml = testohtml & "Partita Iva: " & Request("Gen_PI") & "<br><hgroup><h3>Dati del bambino</h3></hgroup>"
	testohtml = testohtml & "Nome e Cognome: " & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "<br>"
	testohtml = testohtml & "Data di nascita: " & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "<br><br><hgroup><h3>Esame scelto</h3></hgroup>"
	testohtml = testohtml & "Esame: " & rs1("Esame_CB") & " - &euro;" & rs1("Esame_CB_Prezzo") & "<br>"
	testohtml = testohtml & "Sede: " & rs2("Sede_CB") & "<br>"
	'testohtml = testohtml & "Giorno: " & Request("Esame_Giorno") & "/" & Request("Esame_Mese") & "/" & Request("Esame_Anno") & "<br>"
	testohtml = testohtml & "Pagamento: " & Request("Pagamento") & "<br>"
	testohtml = testohtml & "<h2>Ricordiamo che l'iscrizione verrà considerata valida solo dopo il pagamento della quota d'iscrizione.</h2>"
	testohtml = testohtml & "<h2>Ecco le coordinate bancarie riservate ai pagamenti:</h2>"
	testohtml = testohtml & "<h2>Motherwords di Gamberini Lorenza</h2>"
	testohtml = testohtml & "<h2>CREDEM Dip. 372 Milano Ag. 13</h2>"
	testohtml = testohtml & "<h2>IBAN IT02E0303201613010000001577</h2>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Alberto Mario, 6 20159 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>"
	testohtml = testohtml & "direzione@motherwords.it</a>- P.I. 04593400965</div></footer></div></body></html>"

	'Crea l'oggetto configurazione (per eventuale invio tramite un SMTP selezionato
	Set objConfig = Server.CreateObject("CDO.Configuration")
	'Out going SMTP server 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.googlemail.com" 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "iscrizioni@motherwords.it"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "iscrizioni14"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objConfig.Fields.Update 
	'Crea l'oggetto Mail
	Set objMail = Server.CreateObject("CDO.Message")
	'Assegnazione dati agli oggetti
	Set objMail.Configuration = objConfig
	objMail.From = "iscrizioni@motherwords.it"
	'objMail.To = "erik.tagliabue@gmail.com"
	objMail.To = LCase(ModificaApici(Trim(Request("Gen_Email"))))
	'objMail.CC = LCase(trim(request("CC")))
	'objMail.BCC = "erik.tagliabue@gmail.com"
	objMail.ReplyTo = "segreteria@motherwords.it"
	objMail.Organization = "Motherwords"
	objMail.Subject= "Iscrizione Esame Cambridge"
	'objMail.TextBody = ModificaApici(trim(request("Testo")))
	'objMail.AddAttachment "e:\allegatimail"
	'objMail.AddAttachment server.mappath("DEM_ITA_Cosmit.pdf")
	objMail.HTMLBody = testohtml
	'Stabiliamo il livello di importanza (1 o 2)
	objMail.Fields("urn:schemas:httpmail:importance").Value = 2
	objMail.Fields.Update()
	'Invia la mail
	objMail.Send 
	
	'Pulizia Oggetti
	Set objMail = Nothing
	Set objConfig = Nothing
		
'---------------- INVIO EMAIL ------------------------------


If request("Pagamento") = "Carta di Credito" Then

		codTransh = "codTrans=529878-CB-" & Right("000000" & rs3("MaxID"), 6)
		divisah = "divisa=EUR"
		importoh = "importo=" & prezzoesame
		chiaveh="U529531QFpTL355885nzNk91492U66Kn5kQDWbX4"
		
		codTrans = "529878-CB-" & Right("000000" & rs3("MaxID"), 6)
		divisa = "EUR"
		importo = prezzoesame
		alias = "payment_529878"
		mail = Request("Gen_Email")
		url_back = "http://www.motherwords.biz/forms/cambridge/ec_cancel.asp"
		languageId = "ITA"
		'urlpost = "http://www.motherwords.biz/forms/cambridge/ec_ok.asp"
		url = "http://www.motherwords.biz/forms/cambridge/ec_ok.asp"
		
		Set rs4 = dbConn.Execute("UPDATE CB_Iscrizioni SET codTrans = '" & codTrans & "' WHERE ID_Iscrizione = " & rs3("MaxID"))
		
		mac = hex_sha1(codTransh & divisah & importoh & chiaveh)
		
		zzz = "https://ecommerce.keyclient.it/ecomm/ecomm/DispatcherServlet"
		zzz = zzz & "?alias=" & alias
		zzz = zzz & "&importo=" & importo
		zzz = zzz & "&divisa=" & divisa
		zzz = zzz & "&codTrans=" & codTrans
		zzz = zzz & "&mail=" & mail
		zzz = zzz & "&languageId=" & languageId
		zzz = zzz & "&urlpost=" & urlpost
		zzz = zzz & "&url_back=" & url_back
		zzz = zzz & "&mac=" & mac
		zzz = zzz & "&url=" & url
		
		response.redirect zzz
		
Else
	response.redirect "conferma.html"
End If

Set dbconn = nothing
Set rs = nothing
Set rs1 = nothing
Set rs2 = nothing
Set rs3 = nothing
Set rs4 = nothing

%>
</body>
</html>