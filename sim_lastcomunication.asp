<div class="span4" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse"><br>
		<li>
			<a href="#">
			<span class="badge badge-info pull-right">
			<%
			'Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'")
			'Set rsa = dbConn.Execute("SELECT ID_Anno FROM SIM_Anni WHERE Corrente = 'SI'")
			'Set rsb = dbConn.Execute("DELETE FROM Temp_Attivi WHERE 1 = 1")
			'Set rsb = dbConn.Execute("INSERT INTO Temp_Attivi SELECT DISTINCT ID_Studente FROM HD_Corsi WHERE ID_Anno = " & rsa("ID_Anno"))
			'Set rsb = dbConn.Execute("SELECT COUNT(*) as Totale1 FROM Temp_Attivi")
			'response.write rsb("Totale1") & " / " & rs("Totale")
			%>
			</span><b>Last Comunication</b></a>
		</li>
        <img src="images/lastcomunication.png" align="center" width="150" height="150" title="Last Comunication Coming Soon"> 
    </ul>
</div>