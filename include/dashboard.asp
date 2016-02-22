<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="#">
			<span class="badge badge-info pull-right">
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'")
			Set rsa = dbConn.Execute("SELECT ID_Anno FROM SIM_Anni WHERE Corrente = 'SI'")
			Set rsb = dbConn.Execute("DELETE FROM Temp_Attivi WHERE 1 = 1")
			Set rsb = dbConn.Execute("INSERT INTO Temp_Attivi SELECT DISTINCT ID_Studente FROM HD_Corsi WHERE ID_Anno = " & rsa("ID_Anno"))
			Set rsb = dbConn.Execute("SELECT COUNT(*) as Totale1 FROM Temp_Attivi")
			response.write rsb("Totale1") & " / " & rs("Totale")
			%>
			</span> Studenti Attivi</a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Recalls WHERE Ultima_Chiamata IS NOT NULL"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="sim_inventario_magicbox.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Recall da fare</a>
            <% Else %>
            <a href="sim_inventario_magicbox.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Recall da fare</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT right(Ultima_Chiamata, 2) & '/' & Mid(Ultima_Chiamata, 5, 2) & '/' & Left(Ultima_Chiamata, 4) & ' 00:00:00' as Totale FROM HD_Recalls WHERE Ultima_Chiamata IS NOT NULL"
			Set rs = dbConn.Execute(sss)
			i = 0
			while not rs.eof
			If Datediff("d", DateValue(rs("totale")), Now()) > 15 Then
				i = i + 1
			End If
			rs.movenext
			wend
			%>
			<% If i > 0 Then %>
            <a href="hd_reports_recall15.asp"><span class="badge badge-important pull-right"><%= i %></span> Recall oltre 15 Giorni</a>
            <% Else %>
            <a href="hd_reports_recall15.asp"><span class="badge badge-success pull-right"><%= i %></span> Recall oltre 15 Giorni</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Iscrizioni WHERE verificato = 'NO'")
			If rs("Totale") > 0 Then
			%>
            <a href="verifica_iscrizioni_risultati.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Iscrizioni da verificare</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Iscrizioni da verificare</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM CB_Iscrizioni WHERE verificato = 'NO'")
			If rs("Totale") > 0 Then
			%>
            <a href="cb_verifica_iscrizioni_risultati.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Iscrizioni CB da verificare</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Iscrizioni CB da verificare</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Iscrizioni_SummerCamp WHERE verificato = 'NO'")
			If rs("Totale") > 0 Then
			%>
            <a href="hd_verifica_iscrizioni_summercamp_risultati.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Iscrizioni SC da verificare</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Iscrizioni SC da verificare</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_StoricoInventario WHERE Verifica_Lezione = 'Verificare' AND Data_Lezione = Date() -1")
			If rs("Totale") > 0 Then
			%>
            <a href="reports_lezioni.asp?TipoQuery=1"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Status Lezioni Ieri</a>
            <% Else %>
            <a href="reports_lezioni.asp?TipoQuery=1"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Status Lezioni Ieri</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_StoricoInventario WHERE Verifica_Lezione = 'Verificare'")
			If rs("Totale") > 0 Then
			%>
            <a href="reports_lezioni.asp?TipoQuery=2"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Lezioni da verificare</a>
            <% Else %>
            <a href="reports_lezioni.asp?TipoQuery=2"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Lezioni da verificare</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Demos WHERE Stato ='Da Fissare'")
			If rs("Totale") > 0 Then
			%>
            <a href="hd_reports_storico_demo.asp?stato=Da Fissare"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Demo da Fissare</a>
            <% Else %>
            <a href="hd_reports_storico_demo.asp?stato=Da Fissare"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Demo da Fissare</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Demos WHERE Esito='Pending'")
			If rs("Totale") > 0 Then
			%>
            <a href="hd_reports_storico_demo.asp?esito=Pending"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Demo Esito Pending</a>
            <% Else %>
            <a href="hd_reports_storico_demo.asp?esito=Pending"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Demo Esito Pending</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM HD_Demos WHERE Esito = 'Negativo'")
			If rs("Totale") > 0 Then
			%>
            <a href="hd_reports_storico_demo.asp?esito=Negativo"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Demo Esito Negativo</a>
            <% Else %>
            <a href="hd_reports_storico_demo.asp?esito=Negativo"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Demo Esito Negativo</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND ((Genitore_Telefono IS NULL AND Genitore_Cellulare IS NULL) OR (LEN(TRIM(Genitore_Telefono)) = 0 AND LEN(TRIM(Genitore_Cellulare)) = 0))"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=1"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Tel.)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=1"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Tel.)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND (Studente_Cognome IS NULL OR LEN(TRIM(Studente_Cognome)) = 0)"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=2"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Cognome)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=2"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Cognome)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND (Studente_Nome IS NULL OR LEN(TRIM(Studente_Nome)) = 0)"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=3"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Nome)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=3"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Nome)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND (Studente_Data_Nascita IS NULL OR LEN(TRIM(Studente_Data_Nascita)) = 0)"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=4"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Nascita)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=4"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Nascita)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND (Genitore_Ragionesociale IS NULL OR LEN(TRIM(Genitore_Ragionesociale)) = 0)"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=5"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Genitore)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=5"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Genitore)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND (Genitore_Email IS NULL OR LEN(TRIM(Genitore_Email)) = 0)"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=6"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (Email)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=6"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (Email)</a>
            <% End If %>
        </li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM HD_Studenti WHERE Attivo = 'SI'"
			sss = sss & " AND ((Genitore_CF IS NULL OR LEN(TRIM(Genitore_CF)) = 0) AND (Genitore_PIVA IS NULL OR LEN(TRIM(Genitore_PIVA)) = 0))"
			
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="reports_schede_incomplete.asp?TipoQuery=7"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Incomplete (CF/P.IVA)</a>
            <% Else %>
            <a href="reports_schede_incomplete.asp?TipoQuery=7"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Incomplete (CF/P.IVA)</a>
            <% End If %>
        </li>
    </ul>
</div>