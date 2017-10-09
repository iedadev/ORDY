<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="ord_anagrafiche.asp">
			<span class="badge badge-info pull-right">
			</span>Gestione Anagrafiche</a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM ORD_Clienti"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_clienti.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Learning Center</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Learning Center</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Fornitori")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_fornitori.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Fornitori</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Fornitori</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Magazzini")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_magazzini.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Magazzini</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Magazzini</a>
            <% End If %>
        </li>
        <li>
			<a href="ord_reportistica.asp">Reportistica</a>
        </li>
    </ul>
</div>