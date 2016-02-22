﻿<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="../../include/funzioni.asp"-->
<!-- #include virtual file = "../../include/hex_sha1_js.asp" -->
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
<%

Dim zzz, sss, testohtml, alias, importo, divisa, codTrans, mail, url_back, languageId, urlpost, mac, url

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

sss = "INSERT INTO HD_Iscrizioni_SummerCamp (Genitore_Nome, Genitore_Cognome, Genitore_Indirizzo, Genitore_CAP, Genitore_Citta, Genitore_Prov, Genitore_Phone, Genitore_Mobile, Genitore_Email, Genitore_CF, Genitore_PIVA, Studente_Nome, Studente_Cognome, Studente_Luogo_Nascita, Studente_Data_Nascita, Corso_Fascia, Corso_Settimane, Corso_Frequenza, [check-condizioni], [check-articoli-aggiuntivi], Datains, pagamento, codTrans, codTrans_esito, ID_Programma, ID_Sede, Verificato, Commenti) VALUES "
sss = sss & "('" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Indirizzo")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_CAP")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Citta")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Prov")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Phone")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_Mobile")))) & "',"
sss = sss & " '" & LCase(ModificaApici(Trim(Request("Gen_Email")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_CF")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gen_PI")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Nascita")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Corso_Fascia")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Corso_Settimane")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Corso_Frequenza")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-condizioni")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-articoli-aggiuntivi")))) & "',"
sss = sss & " '" & Now() & "', '" & Request("Pagamento")
sss = sss & "', Null, Null, 74, " & Request("ID_Sede") & ", 'NO', '" &  ModificaApici(Trim(Request("commenti"))) & "')"

Set rs = dbConn.Execute(sss)

Set rs = dbConn.Execute("Select MAX(ID_Iscrizione) AS MaxID From HD_Iscrizioni_SummerCamp")

Set rs1 = dbConn.Execute("Select * From HD_Programmi WHERE ID_Programma = 74")
Set rs2 = dbConn.Execute("Select * From HD_Sedi WHERE ID_Sede = " & Request("ID_Sede"))

'---------------- INVIO EMAIL A SEGRETERIA ------------------------------
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
	objMail.Subject= "Iscrizione ad Arsenal  Summer Camp Helen Doron"
	'objMail.TextBody = ModificaApici(trim(request("Testo")))
	'objMail.AddAttachment "e:\allegatimail"
	'objMail.AddAttachment server.mappath("DEM_ITA_Cosmit.pdf")
	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
	testohtml = testohtml & "<title>Motherwords - Modulo Iscrizione Arsenal Summer Camp</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script>"
	testohtml = testohtml & "<link href='favicon.ico' rel='icon' /> <link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' /><link href='form.css' rel='stylesheet' type='text/css' title='default' />"
	testohtml = testohtml & "<!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script><link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]-->"
	testohtml = testohtml & "<style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head>"
	testohtml = testohtml & "<body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header><article><hgroup><h2><span id=':1tl' dir='ltr'>Ciao Loretta,<br>&eacute; arrivata una nuova iscrizione al Summer Camp</span></h2></hgroup>"
	testohtml = testohtml & "<hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(Request("Gen_Nome")) & " " & UCase(Request("Gen_Cognome")) & "<br>" & UCase(Request("Gen_Indirizzo")) & " " & Request("Gen_CAP") & " " & UCase(request("Gen_Citta")) & " (" & UCase(Request("Gen_Prov")) & ")<br>"
	testohtml = testohtml & "<strong>Telefono:</strong> " & Request("Gen_Phone") & "<br><strong>Cellulare:</strong> " & Request("Gen_Mobile") & "<br><strong>Email:</strong> " & LCase(Request("Gen_Email")) & "<br>"
	testohtml = testohtml & "<strong>Codice Fiscale:</strong> " & Request("Gen_CF") & "<br><strong>Partita Iva:</strong> " & Request("Gen_PI") & "<br><br><hgroup><h3>Dati del bambino</h3></hgroup>" & UCase(Request("Stu_Nome")) & " " & UCase(Request("Stu_Cognome")) & "<br><strong>Nato a:</strong> " & UCase(Request("Stu_Nascita")) & "<br><strong>Data di Nascita:</strong> " & Request("Stu_Giorno") & "/" &  Request("Stu_Mese") & "/" & Request("Stu_Anno") & "<br>"
	testohtml = testohtml & "<br><hgroup><h3>Scelta del corso</h3></hgroup>"
	'testohtml = testohtml & "<strong>Periodo:</strong> " & rs1("Sigla") & "<br>"
	'testohtml = testohtml & "<strong>Fascia d'et&aacute;:</strong> " & Request("Corso_Fascia") & "<br>"
	testohtml = testohtml & "<strong>Sede:</strong> " & rs2("Sede") & "<br><strong>Frequenza (Settimane):</strong> " & Request("Corso_Frequenza") & "<br>"
	testohtml = testohtml & "<strong>Pagamento:</strong> " & Request("Pagamento") & "<br>"
	testohtml = testohtml & "<strong>Commenti:</strong> " & Request("Commenti") & "<br>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>direzione@motherwords.it</a>- P.I. 04593400965</div>"
	testohtml = testohtml & "</footer></div></body></html>"
	objMail.HTMLBody = testohtml
	'Stabiliamo il livello di importanza (1 o 2)
	objMail.Fields("urn:schemas:httpmail:importance").Value = 2
	objMail.Fields.Update()
	'Invia la mail
	objMail.Send 
	
	'Pulizia Oggetti
	Set objMail = Nothing
	Set objConfig = Nothing
	
''---------------- INVIO EMAIL A Genitore ------------------------------

	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Motherwords - Iscrizione Summer Camp Helen Doron</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script><link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' />"
	testohtml = testohtml & "<link href='form.css' rel='stylesheet' type='text/css' title='default' /><!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script>"
	testohtml = testohtml & "<link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]--><style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head><body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header>"
	testohtml = testohtml & "<article><hgroup><h2><span id=':1tl' dir='ltr'>Gentile genitore,<br>grazie per aver iscritto il Vostro bambino al Summer Camp Helen Doron English in collaborazione con Arsenal Soccer Schools.</span></h2></hgroup>"
	testohtml = testohtml & "<hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "<br>"
	testohtml = testohtml & UCase(ModificaApici(Trim(Request("Gen_Indirizzo")))) & "<br>" & Request("Gen_CAP") & " " & UCase(ModificaApici(Trim(Request("Gen_Citta")))) & " (" & UCase(ModificaApici(Trim(Request("Gen_Prov")))) &")<br>"
	testohtml = testohtml & "Telefono: " & Request("Gen_Phone") & "<br>"
	testohtml = testohtml & "Cellulare: " & Request("Gen_Mobile") & "<br>"
	testohtml = testohtml & "Email: " & Request("Gen_Email") & "<br>"
	testohtml = testohtml & "Codice Fiscale: " & Request("Gen_CF") & "<br>"
	testohtml = testohtml & "Partita Iva: " & Request("Gen_PI") & "<br><hgroup><h3>Dati del bambino</h3></hgroup>"
	testohtml = testohtml & "Nome e Cognome: " & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "<br>"
	testohtml = testohtml & "Data di nascita: " & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "<br><br><hgroup><h3>Scelta del corso</h3></hgroup>"
	testohtml = testohtml & "Periodo: " & rs1("Sigla") & "<br>"
	'testohtml = testohtml & "Fascia d'età: " & Request("Corso_Fascia") & "<br>"
	testohtml = testohtml & "Sede: " & rs2("Sede") & "<br>"
	testohtml = testohtml & "Pagamento: " & Request("Pagamento") & "<br><br>"
	testohtml = testohtml & "<strong>Commenti:</strong> " & Request("Commenti") & "<br>"
	testohtml = testohtml & "<h2>L'iscrizione al Summer Camp si intende perfezionata a fronte del versamento dell'intera quota di Euro 290, pertanto, una volta effettuato il pagamento, sarà necessario inviare la ricevuta attestante tale versamento all'indirizzo <a href='mailto:segreteria@motherwords.it'>segreteria@motherwords.it</a>.</h2>"
	testohtml = testohtml & "<h2>Ecco le coordinate bancarie riservate ai pagamenti:</h2>"
	testohtml = testohtml & "<h2>Motherwords di Gamberini Lorenza</h2>"
	testohtml = testohtml & "<h2>CREDEM Dip. 372 Milano Ag. 13</h2>"
	testohtml = testohtml & "<h2>IBAN IT02E0303201613010000001577</h2>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>"
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
	objMail.To = LCase(ModificaApici(Trim(Request("Gen_Email"))))
	'objMail.CC = LCase(trim(request("CC")))
	'objMail.BCC = "erik.tagliabue@gmail.com"
	objMail.ReplyTo = "segreteria@motherwords.it"
	objMail.Organization = "Motherwords"
	objMail.Subject= "Motherwords - Iscrizione a Summer Camp Helen Doron"
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

		codTransh = "codTrans=529878-AS-" & Right("000000" & rs("MaxID"), 6)
		divisah = "divisa=EUR"
		importoh = "importo=29000"
		chiaveh="U529531QFpTL355885nzNk91492U66Kn5kQDWbX4"
		
		codTrans = "529878-AS-" & Right("000000" & rs("MaxID"), 6)
		divisa = "EUR"
		importo = "29000"
		alias = "payment_529878"
		mail = Request("Gen_Email")
		url_back = "http://www.motherwords.biz/forms/arsenal/ec_cancel.asp"
		languageId = "ITA"
		'urlpost = "http://www.motherwords.biz/forms/arsenal/ec_ok.asp"
		url = "http://www.motherwords.biz/forms/arsenal/ec_ok.asp"

		Set rs1 = dbConn.Execute("UPDATE HD_Iscrizioni_SummerCamp SET codTrans = '" & codTrans & "' WHERE ID_Iscrizione = " & rs("MaxID"))

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

%>
</body>
</html>