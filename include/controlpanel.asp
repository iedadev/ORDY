<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="#">
			<span class="badge badge-info pull-right">
			</span><%=response.write (titolocontrolpanel)%></a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM Sim_Macrocategorie"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_macrocategorie.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu1)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu1)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Categorie")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_categorie.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span><%=response.write (menu2)%></a>
            <% Else %>
            <a href="#><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu2)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Sottocategorie")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_sottocategorie.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu3)%> </a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu3)%> </a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM Sim_Kit WHERE ATTIVO=1")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_kit.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu4)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu4)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_Stato")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_statokit.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu5)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu5)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM Sim_Posizione")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_posizione.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu6)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu6)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_USER")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_gestione_user.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu7)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu7)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_KIT_SEGNALAZIONI WHERE VERIFICATO = 1")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_magicbox_segnalazione_admin.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu8)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu8)%></a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM SIM_KIT WHERE VERIFICATO = 1 AND ATTIVO = 1")
			If rs("Totale") > 0 Then
			%>
            <a href="sim_kit_validazione.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span> <%=response.write (menu9)%></a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span> <%=response.write (menu9)%></a>
            <% End If %>
        </li>
        <li>
			<a href="sim_reportistica.asp"><%=response.write (menu10)%></a>
        </li>
        <li>
			<a href="sim_impostazioni.asp"><%'=response.write (menu11)%></a>
        </li>
         <li>
			<a href="sim_help.asp"><%'=response.write (menu12)%></a>
        </li>
    </ul>
</div>