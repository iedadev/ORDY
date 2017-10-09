<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<!--#include virtual file ="include/security.asp"-->

<%
Dim s, i, s1,dataordine

s =  "SELECT * FROM ORD_Assegnazioni WHERE 1=1"
s = s & " ORDER BY DATAPAGAMENTO ASC"

'response.write ins
'Set rs3 = dbConn.Execute(ins)
Set rs2 = dbConn.Execute(s)

i = 1

'lastbar = "SELECT LAST(A.BARCODE) as BAR FROM ORD_Articoli as A INNER JOIN ORD_Assegnazioni as B ON A.CODART=B.CODART"
'Set rsbar = dbConn.Execute(lastbar)

'estraggo barcode e qta ricevuta dall LC
'qtadis ="SELECT BARCODE, QTADISP FROM ORD_Articoli WHERE  BARCODE ='" & rsbar("BAR") & "'" 
qtadis ="SELECT BARCODE, QTADISP FROM ORD_Articoli WHERE CODART =" & request("CODART")
Set rsqta = dbConn.Execute(qtadis)

'response.write lastbar
response.write qtadis
'response.write qtadis


Dim qtadisponibile, qtaricevuta, barcode,nrordine, diff
barcode = rsqta("BARCODE")
qtadisponibile = rsqta("QTADISP")

'estraggo numero di ordine
nrordine ="SELECT LAST(NUMORD) as NORD FROM ORD_Assegnazioni WHERE  BARCODE = '" & barcode & "'" 
Set rsnord = dbConn.Execute(nrordine)

response.write nrordine
nrordine = rsnord("NORD")

'estraggo qtarichiesta
qtarichiesta ="SELECT QTARICH FROM ORD_Assegnazioni WHERE NUMORD = " & nrordine & " AND BARCODE = '" & barcode & "'" 
Set rsqtarichiesta = dbConn.Execute(qtarichiesta)

response.write qtarichiesta
qtarichiesta = rsqtarichiesta("QTARICH")


diff = qtadisponibile - qtarichiesta

Response.Write(barcode) 
Response.Write "++"
Response.Write(qtadisponibile)
Response.Write "++"
Response.Write(nrordine)
Response.Write "++"
Response.Write(qtarichiesta)
Response.Write "++"
Response.Write(diff)

updqtalc ="UPDATE ORD_ASSEGNAZIONI SET QTARICE = " & qtadisponibile & ", QTADIFF = " & diff & ", STATOORDINE =1 WHERE NUMORD = " & nrordine & " AND BARCODE = '" & barcode & "'" 
Set updqta = dbConn.Execute(updqtalc)

response.write updqtalc

'UPDATE table_name
'SET column1=value1,column2=value2,...
'WHERE some_column=some_value;

'response.end

										
'ins =  "INSERT INTO ORD_Assegnazioni (Numord,Barcode,LC,Qtarich,DataPagamento,Dataordine) SELECT Numord,Barcode,LC,Qtarich,datapagamento,dataordine FROM ORD_Richieste WHERE 1=1 "
'ins = ins & "AND DATAPAGAMENTO IS NOT NULL AND STATOORDINE = 0"




'var1 =  "SELECT * FROM ORD_Articoli WHERE 1=1"
's = s & " ORDER BY DataOrdine"


'response.write s

'response.end

%>
<!DOCTYPE html>
<html lang="it">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--#include virtual file="include/title.asp"-->
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
	    <!--#include virtual file="include/menu.asp"-->
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12" id="content">
                     <div class="row-fluid">
                         
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Elenco Assegnazioni Materiale &nbsp;&nbsp;
                        	        <a href="javascript:history.back()"><img src="images/back.png" width="32" height="32" title="Indietro"></a>
                                    <a href="ord_articoli_assegnazioni.asp"><img src="images/wishlist_complete.png" width="32" height="32" title="Assegna"></a>
                                </legend>
                            </div>
                            <div class="block-content collapse in">
                                 <!--#include virtual file="ord_controlpanelmagazzino.asp"-->
                                <div class="span8">
  									
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
                                            <tr>
												<th>Numero Ordine</th>
                                                <th>Barcode</th>
                                                <th>LC</th>
												<th>Qta Rich</th>
												<th>Qta Ricev</th>
												<th>Qta Diff</th>
                                                <th>Data Pagamento</th>
                                                <th>Data Ordine</th>
                                                <th>Stato Ordine</th>
                                                <th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<%
											While Not rs2.EOF
											i = i + 1
											%>
											<% If i/2 - Int(i/2) = 0 Then %>
												<tr class="odd gradeA">
											<% Else %>
												<tr class="even gradeA">
											<% End If %>
                                            <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Numord")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("Barcode")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
											    If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("LC")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>										
												<td>
                                                <%
												If Not rs2.eof Then
													'Response.write sss
                                                    Response.write rs2("QtaRich")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
												<td>
												<%
												If Not rs2.eof Then
													Response.write rs2("QtaRice")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("QtaDiff")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataPagamento")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("DataOrdine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                                    <td>
												<%
												If Not rs2.eof Then
													Response.write rs2("Statoordine")
												Else
													Response.write "&nbsp;"
												End If
												%>
												</td>
                                               <td>
                                                   <img src="images/editcard.png" width="32" height="32" title="Modifica Data Pagamento"><br>
                                                </td>
                                                </tr>
											<%
											rs2.MoveNext 
											Wend
                                            %>										
                                        </tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                </div>
            </div>
            <hr>
		    <!--#include virtual file="include/piede.asp"-->
        </div>
       <!--/.fluid-container-->

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script>
        $(function() {
            
        });
        </script>
        <script>
        $(function() {
            $('.tooltip').tooltip();	
			$('.tooltip-left').tooltip({ placement: 'left' });	
			$('.tooltip-right').tooltip({ placement: 'right' });	
			$('.tooltip-top').tooltip({ placement: 'top' });	
			$('.tooltip-bottom').tooltip({ placement: 'bottom' });

			$('.popover-left').popover({placement: 'left', trigger: 'hover'});
			$('.popover-right').popover({placement: 'right', trigger: 'hover'});
			$('.popover-top').popover({placement: 'top', trigger: 'hover'});
			$('.popover-bottom').popover({placement: 'bottom', trigger: 'hover'});

			$('.notification').click(function() {
				var $id = $(this).attr('id');
				switch($id) {
					case 'notification-sticky':
						$.jGrowl("Stick this!", { sticky: true });
					break;

					case 'notification-header':
						$.jGrowl("A message with a header", { header: 'Important' });
					break;

					default:
						$.jGrowl("Hello world!");
					break;
				}
			});
        });
        </script>
    </body>
</html>
<%
Set rs = Nothing
Set rs1 = Nothing
Set rs2 = Nothing
Set dbconn = Nothing
%>