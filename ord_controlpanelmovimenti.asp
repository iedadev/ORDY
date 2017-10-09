<div class="span3" id="sidebar">
	<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
		<li>
			<a href="ord_magazzino.asp">
			<span class="badge badge-info pull-right">
			</span>Gestione Movimenti</a>
		</li>
        <li>
			<%
			sss = "SELECT COUNT(*) as Totale FROM ORD_Articoli"
			Set rs = dbConn.Execute(sss)
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_ordiniHD.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Ordini da Helen Doron</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Ordini da Helen Doron</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_articoliLC_start.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Ordini da LC</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Ordini da LC</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli WHERE ATTART ='Y' AND Qtadisp < Qtamin")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_articoliAS.asp"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Assegnazioni Materiale</a>
            <% Else %>
            <a href="#"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Assegnazioni Materiale</a>
            <% End If %>
        </li>
        <li>
			<%
			Set rs = dbConn.Execute("SELECT COUNT(*) as Totale FROM ORD_Articoli")
			If rs("Totale") > 0 Then
			%>
            <a href="ord_gestione_pagamenti_ricerca.asp"><span class="badge badge-success pull-right"><%= rs("Totale") %></span>Stato Pagamenti</a>
            <% Else %>
            <a href="#"><span class="badge badge-important pull-right"><%= rs("Totale") %></span>Stato Pagamenti</a>
            <% End If %>
        </li>
        <li>
			<a href="sim_reportistica.asp">Reportistica</a>
        </li>
    </ul>
</div>