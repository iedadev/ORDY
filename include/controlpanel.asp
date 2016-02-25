<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="#">
			<span class="badge badge-info pull-right">
			</span>Gestione SIM</a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM Sim_Macrocategorie"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_macrocategorie.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Macrocategorie</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Macrocategorie</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Categorie")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_categorie.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Categorie</a>
            <% Else %>
            <a href="#><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Categorie</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Sottocategorie")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_sottocategorie.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Sottocategorie </a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Sottocategorie </a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM Sim_Kit")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_kit.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Kit</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Kit</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Stato")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_statokit.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Status Kit</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Status Kit</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM Sim_Posizione")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_posizione.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Position</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Position</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_USER")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_user.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> User</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> User</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_KIT_SEGNALAZIONI WHERE VERIFICATO = 1")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_magicbox_segnalazione_admin.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Segnalazioni</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Segnalazioni</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_KIT WHERE verificato = 1")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_kit_validazione.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> Validation New Kit</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> Validation New Kit</a>
            <% End If %>
        </li>
        <li>
			<a href="sim_reportistica.asp">Reportistica</a>
        </li>
    </ul>
</div>