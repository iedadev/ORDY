<%@ LANGUAGE="VBSCRIPT" %>
<%

Dim zzz, sss, testohtml, alias, importo, divisa, codTrans, mail, url_back, languageId, urlpost, mac, url

Set dbConn = CreateObject("ADODB.Connection")
dbConn.Open Application("Connection1_ConnectionString")

sss = "INSERT INTO Transazioni (alias, importo, divisa, session_id, codTrans, dataTrans, oraTrans, esito, codaut, brand, nome, cognome, email, mac, nazionalita, pan, scadenza_pan, datains) VALUES "
sss = sss & "('" & Request("alias") & "',"
sss = sss & " '" & Request("importo") & "',"
sss = sss & " '" & Request("divisa") & "',"
sss = sss & " '" & Request("session_id") & "',"
sss = sss & " '" & Request("codTrans") & "',"
sss = sss & " '" & Request("dataTrans") & "',"
sss = sss & " '" & Request("oraTrans") & "',"
sss = sss & " '" & Request("esito") & "',"
sss = sss & " '" & Request("codaut") & "',"
sss = sss & " '" & Request("$brand") & "',"
sss = sss & " '" & Request("nome") & "',"
sss = sss & " '" & Request("cognome") & "',"
sss = sss & " '" & Request("email") & "',"
sss = sss & " '" & Request("mac") & "',"
sss = sss & " '" & Request("nazionalita") & "',"
sss = sss & " '" & Request("pan") & "',"
sss = sss & " '" & Request("scadenza_pan") & "',"
sss = sss & " '" & Now() & "')"
Set rs = dbConn.Execute(sss)

Set rs1 = dbConn.Execute("UPDATE HD_Iscrizioni SET codTrans_esito = '" & Request("esito") & "' WHERE codTrans = '" & Request("codTrans") & "'")
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

	</head>
	<body>			
		<div class="container clearfix">
			<header 
			          >
				<h1 class="logo"> <a href="http://milano-fiera.helendoron.it/"></a>
				</h1>
				
			</header>
			<article>
				<hgroup>
					<h2><span id=":1tl" dir="ltr">Gentile genitore, grazie per 
					aver iscritto il Vostro bambino ai corsi Helen Doron English.<br>
					<% If request("esito") = "OK" Then %>
					<br>La quota di iscrizione è stata correttamente pagata
					<% Else %>
					<br>La transazione di pagamento ha avuto esito negativo
					<% End If %>
					</span>
					</h2>
				</hgroup>
			</article>
			
			<footer>
				<div class="credits">Motherwords di Gamberini Lorenza - Via 
					Gaetano Previati, 74 20149 Milano - Tel. 02-87381568 - <a href="mailto:direzione@motherwords.it">
					direzione@motherwords.it
					</a>- P.I. 04593400965</div>
			</footer>
		</div>
	</body>
</html>