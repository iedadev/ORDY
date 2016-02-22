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
		<title>Motherwords - Modulo Richiesta Demo Lesson Corsi Helen Doron</title>
		<link rel="stylesheet" href="main.css">
		<script language="JavaScript" src="jquery-1.7.2.min.js"></script>
		<script language="JavaScript" src="jquery.blockUI.js"></script>
		<script language="JavaScript" src="jquery.uniform.min.js"></script>
		<link href="favicon.ico" rel="icon"> 
		<link href="reset.css" rel="stylesheet" type="text/css" title="default">
		<link rel="stylesheet" href="uniform.default.css" media="screen">
		<link href="form.css" rel="stylesheet" type="text/css" title="default">
		
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
		
		<link href="formIE.css" rel="stylesheet" type="text/css" title="default">
		
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
			<header>
				<h1 class="logo"> <a href="#"></a></h1>
			</header>
			<article>
				<hgroup><h2>&nbsp;Modulo di Richiesta Demo Lesson Corsi Helen Doron</h2></hgroup>
				<hgroup><h3>Dati del Genitore richiedente</h3></hgroup>
				<form method="post" name="P2" action="salva.asp">
				<input required name='Gen_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Gen_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
				<input name='Gen_Phone' placeholder='Telefono' type = "text" size="35">&nbsp;
				<input name='Gen_Mobile' placeholder='Cellulare' type = "text" size="35"><br><br>
				<input required name='Gen_Email' placeholder='E-Mail' type="email" size="35"><br><br>
				<hgroup><h3>Dati del bambino</h3></hgroup>
				<input required name='Stu_Nome' placeholder='Nome' type = "text" size="35">&nbsp;
				<input required name='Stu_Cognome' placeholder='Cognome' type = "text" size="35"><br><br>
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
				<hgroup><h3 style="height: 14px">Orario preferito per la Demo Lesson</h3></hgroup>
				<input name='Lu_Ore' placeholder='' type = "text" size="35">&nbsp;
				<br><br>
				<hgroup><h3 style="height: 14px">Note</h3></hgroup>
				<textarea name="commenti" cols="80" rows="3"></textarea>
				<br><br>
				<div class="contBtn ok">
				<input type="submit" value="Invia" style="font-family: Arial; color: #054c71; font-size: 12pt; font-weight: bold; background-color: #bfc8cf">
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
