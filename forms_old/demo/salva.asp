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

Dim zzz, sss, testohtml, alias, importo, divisa, codTrans, mail, url_back, languageId, urlpost, mac, url

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

sss = "INSERT INTO HD_Iscrizioni_Demo (Genitore_Nome, Genitore_Cognome, Genitore_Indirizzo, Genitore_CAP, Genitore_Citta, Genitore_Prov, Genitore_Phone, Genitore_Mobile, Genitore_Email, Genitore_CF, Genitore_PIVA, Studente_Nome, Studente_Cognome, Studente_Data_Nascita, Corso, Frequenza, [check-condizioni], [check-articoli-aggiuntivi], Datains, Lunedi, Martedi, Mercoledi, Giovedi, Venerdi, Sabato, Lu_Ore, Ma_Ore, Me_Ore, Gi_Ore, Ve_Ore, Sa_Ore, Commenti, Verificato, gia_frequentato, Pagamento, codTrans, codTrans_esito, ID_Programma, ID_Sede) VALUES "
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
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Corso")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Frequenza")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-condizioni")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("check-articoli-aggiuntivi")))) & "',"
sss = sss & " '" & Now() & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Lunedi")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Martedi")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Mercoledi")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Giovedi")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Venerdi")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Sabato")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Lu_Ore")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Ma_Ore")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Me_Ore")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Gi_Ore")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Ve_Ore")))) & "',"
sss = sss & " '" & UCase(ModificaApici(Trim(Request("Sa_Ore")))) & "',"
sss = sss & " '" & ModificaApici(Trim(Request("Commenti")))
sss = sss & "', 'NO', '" & Request("gia_frequentato") & "', '" & Request("Pagamento")
sss = sss & "', Null, Null, Null, Null)"

'response.write sss

Set rs = dbConn.Execute(sss)

Set rs = dbConn.Execute("Select MAX(ID_Iscrizione) AS MaxID From HD_Iscrizioni_Demo")

''---------------- INVIO EMAIL A SEGRETERIA ------------------------------

	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Motherwords - Modulo Richiesta Demo Lesson</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script><link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' /><link href='form.css' rel='stylesheet' type='text/css' title='default' /><!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script>"
	testohtml = testohtml & "<link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]--><style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head><body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header><article><hgroup><h2><span id=':1tl' dir='ltr'>Buongiorno,<br>&eacute; arrivata una nuova richiesta di Demo Lesson</span></h2></hgroup><hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "<br>"
	testohtml = testohtml & "Telefono: " & Request("Gen_Phone") & "<br>"
	testohtml = testohtml & "Cellulare: " & Request("Gen_Mobile") & "<br>"
	testohtml = testohtml & "Email: " & Request("Gen_Email") & "<br>"
	testohtml = testohtml & "<hgroup><h3>Dati del Genitore richiedente</h3></hgroup><br>"
	testohtml = testohtml & "Nome e Cognome: " & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "<br>"
	testohtml = testohtml & "Data di nascita: " & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "<br><br>"
	testohtml = testohtml & "Orario Preferito: " & Request("Lu_Ore") & "<br>"
	testohtml = testohtml & "<br><br>Note: " & Request("commenti") & "<br>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>"
	testohtml = testohtml & "direzione@motherwords.it</a>- P.I. 04593400965</div></footer></div></body></html>"

	'Crea l'oggetto configurazione (per eventuale invio tramite un SMTP selezionato
	Set objConfig = Server.CreateObject("CDO.Configuration")
	'Out going SMTP server 
	' GMAIL
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.googlemail.com" 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465 ' oppure 587
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "iscrizioni@motherwords.it"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "iscrizioni14"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objConfig.Fields.Update
	' ARUBA
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.aruba.it" 
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	'objConfig.Fields.Update 
 
	'Crea l'oggetto Mail
	Set objMail = Server.CreateObject("CDO.Message")
	'Assegnazione dati agli oggetti
	Set objMail.Configuration = objConfig
	objMail.From = "iscrizioni@motherwords.it"
	objMail.To = "segreteria@motherwords.it; direzione@motherwords.it"
	'objMail.To = "erik.tagliabue@gmail.com"
	'objMail.CC = LCase(trim(request("CC")))
	'bjMail.BCC = "erik.tagliabue@gmail.com"
	objMail.ReplyTo = "segreteria@motherwords.it"
	objMail.Organization = "Motherwords"
	objMail.Subject= "Richiesta Demo Lesson"
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

''---------------- INVIO EMAIL A Genitore ------------------------------

	testohtml = "<!DOCTYPE html><html lang='it'><head><meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Motherwords - Richiesta Demo Lesson Corsi Helen Doron</title><link rel='stylesheet' href='main.css'><script language='JavaScript' src='jquery-1.7.2.min.js'></script><script language='JavaScript' src='jquery.blockUI.js'></script><script language='JavaScript' src='jquery.uniform.min.js'></script><link href='reset.css' rel='stylesheet' type='text/css' title='default' /><link rel='stylesheet' href='uniform.default.css' media='screen' />"
	testohtml = testohtml & "<link href='form.css' rel='stylesheet' type='text/css' title='default' /><!--[if lt IE 9]><script>document.createElement('header');document.createElement('nav');document.createElement('section');document.createElement('article');document.createElement('aside');document.createElement('footer');document.createElement('hgroup');</script>"
	testohtml = testohtml & "<link href='formIE.css' rel='stylesheet' type='text/css' title='default' /><![endif]--><style type='text/css'>input.error, select.error{background-color: #F9E4E4 !important;border: 1px solid #D44D4D !important;}span.error{background-position: 0 -217px !important;}span.error.checked{background-position: -34px -217px !important;}.selector span.error{background-position: right -328px !important;}div.selector.error{background-position: 0 -370px !important;}</style></head><body><div class='container clearfix'><header><h1 class='logo'> <a href='#'></a></h1></header>"
	testohtml = testohtml & "<article><hgroup><h2><span id=':1tl' dir='ltr'>Gentile genitore,<br>grazie per avere richiesto una Demo Lesson per i Corsi Helen Doron English.<br><br>Verrà ricontattato al più presto dalla nostra Segreteria.</span></h2></hgroup><hgroup><h3>Dati del Genitore richiedente</h3></hgroup>" & UCase(ModificaApici(Trim(Request("Gen_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Gen_Cognome")))) & "<br>"
	testohtml = testohtml & "Telefono: " & Request("Gen_Phone") & "<br>"
	testohtml = testohtml & "Cellulare: " & Request("Gen_Mobile") & "<br>"
	testohtml = testohtml & "Email: " & Request("Gen_Email") & "<br>"
	testohtml = testohtml & "<hgroup><h3>Dati del bambino</h3></hgroup>"
	testohtml = testohtml & "Nome e Cognome: " & UCase(ModificaApici(Trim(Request("Stu_Nome")))) & " " & UCase(ModificaApici(Trim(Request("Stu_Cognome")))) & "<br>"
	testohtml = testohtml & "Data di nascita: " & UCase(ModificaApici(Trim(Request("Stu_Giorno")))) & "/" & ModificaApici(Trim(Request("Stu_Mese"))) & "/" & ModificaApici(Trim(Request("Stu_Anno"))) & "<br>"
	testohtml = testohtml & "Orario preferito: " & Request("Lu_Ore") & "<br>"
	testohtml = testohtml & "<br><br>Note: " & Request("commenti") & "<br><br>"
	testohtml = testohtml & "<br><br></article><footer><div class='credits'>Motherwords di Gamberini Lorenza - Via Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href='mailto:direzione@motherwords.it'>"
	testohtml = testohtml & "direzione@motherwords.it</a>- P.I. 04593400965</div></footer></div></body></html>"

	'Crea l'oggetto configurazione (per eventuale invio tramite un SMTP selezionato
	Set objConfig = Server.CreateObject("CDO.Configuration")
	'Out going SMTP server 
	' GMAIL
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.googlemail.com" 
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465 ' oppure 587
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "iscrizioni@motherwords.it"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "iscrizioni14"
	objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objConfig.Fields.Update 
	' ARUBA
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.aruba.it" 
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
	'objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	'objConfig.Fields.Update 
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
	objMail.Subject= "Conferma Richiesta Demo Lesson"
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

response.redirect "conferma.html"


Set dbconn = nothing
Set rs = nothing

%>
</body>
</html>