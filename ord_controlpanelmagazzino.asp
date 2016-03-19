<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="ord_magazzino.asp">
			<span class="badge badge-info pull-right">
			</span>Gestione Magazzino</a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM ORD_Articoli"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_articoli.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Articoli</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Articoli</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_inventario.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Inventario</a>
            <% Else %>
            <a href="#><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Inventario</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_movimenti.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Movimenti</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Movimenti</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_sottoscorta.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Sottoscorta</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Sottoscorta</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_valorizzazione.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Valorizzazione</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Valorizzazione</a>
            <% End If %>
        </li>
        <li>
			<a href="sim_reportistica.asp">Reportistica</a>
        </li>
    </ul>
</div>