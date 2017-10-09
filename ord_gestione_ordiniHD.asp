<%@ LANGUAGE="VBSCRIPT" %>
<!--#include virtual file="include/funzioni.asp"-->
<!--#include virtual file="config.asp"-->
<!--#include virtual file="language.asp"-->
<%
If session("usr") = "" Then
    response.redirect "default.asp"
End If

'If session("ruolo") <> "A" Then
  '  response.redirect "hd_todo.asp"
'End If

 nrord = request("nrordine")
 pdfordine = "ordineHD_"&nrord
 'nrord1 = request("NumOrdine")

 'response.write nrord
 'response.write "--" & pdfordine
 'response.write NumOrdine
 'response.write nrord1
 'response.end

 'response.write pdfordine

if request("nrordine") = 99  then

sss =  "SELECT Numord FROM ORD_Arrivi WHERE IDArr = (SELECT MAX(IDarr)  FROM ORD_Arrivi)"
Set rs = dbConn.Execute(sss)

nrord = rs("Numord")
pdfordine = rs("Numord")
pdfordine = "ordineHD_"&pdfordine


'response.write sss
'response.write pdfordine

end if


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
        <link href="vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        
      <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
      <script type="text/javascript"> 
        <!--
        function controllo()
        {
		if (document.P2.barcode.value == "")
			{
			alert("Attenzione! Inserire il Codice articolo. Dato Obbligatorio");
			document.P2.barcode.style.backgroundColor = 'Yellow';
			document.P2.barcode.focus();
			return false;
			}
		}
		//-->
		</script>
    </head>
    <body>
        <!--#include virtual file="include/menu.asp"-->    
        <div class="container-fluid">
            <div class="row-fluid">
            <% If session("ruolo") = "A" Then %>
	            <!--#include virtual file="ord_controlpanelmovimenti.asp"-->
            <%Else%>
                <!--#include virtual file="sim_lastprops.asp"-->       
            <% End If %>
                <div class="span6" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">

                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                            	<legend>Gestione Ordini <%=response.write (nrord)%> da Helen Doron</legend>
                            </div>
                            <div class="block-content collapse in">
                              <% if  nrord = "" Then
                                     'response.write "passqui"
                               %>
                                <table class="table table-condensed">
									<tbody>  
                                    Per visualizzare la scheda dell'ordine inserire il codice dell'ordine.
                                        <form name="P3" method="post" Action="ord_gestione_articoliIN.asp" class="form-horizontal">
                                      <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											Numero Ordine: </label> 
                                          <div class="controls">
                                          	<input name="nrordine" class="input-small focused" id="focusedInput" type="text" style="width:100x;">
                                           </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Cerca</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                    </form>
                            </tbody>
								</table> 
                                <table class="table table-condensed">
									<tbody>  
                                    Caricare il file pdf dell'ordine rinominando il file in Ordine HD_nrOrdine (es OrdineHD_160612)
                                        <form method="post" enctype="multipart/form-data" action="ord_saveupload.asp" class="form-horizontal">
                                              <div align="center">
                                                <center>
                                                <table border="0" style="border-collapse: collapse" bordercolor="#111111" width="74%" id="AutoNumber1">
                                                    <input type="file" name="File1" size="20"></b></font></td>
                                                </table>
                                                  <fieldset>
                                          <div class="control-group">
                                          <label class="control-label" for="focusedInput">
											upload Ordine: </label> 
                                                   <div class="controls">
                                                    <input type="submit" value="Submit" name="B1" class="input-small focused" id="focusedInput" style="width:100x;"></b></font></td>
                                                  </div>
                                                </div>
                                                <div class="form-actions">
                                          <button type="submit" class="btn btn-primary tooltip-top" data-original-title="Cerca">Carica</button>&nbsp;
                                          <button type="reset" class="btn">Annulla</button>&nbsp;
                                        </div>
                                      </fieldset>
                                            </form>
                            </tbody>
								</table>
                                 <%end if%>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                  
                     <div class="row-fluid">
                        <!-- block -->
                        <!-- /block -->
                    </div>
                </div><!-- nella parte laterale si potrebbe mettere Elenco dei movimenti dell'articolo-->
                <div id="pdf"><br>
                <object width="700" height="500" type="application/pdf" data="OrdiniHD/<%response.write pdfordine%>.pdf?#zoom=85&scrollbar=1&toolbar=1&navpanes=0"
                     id="pdf_content">
                    </div>
                </p>
                  </object>
                </div>
            </div>
            <hr>
		    <!--#include virtual file="include/piede.asp"-->
		    </div>
        <!--/.fluid-container-->
        <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

        <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>

        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
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
Set dbConn = Nothing
%>