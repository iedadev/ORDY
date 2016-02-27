﻿<%
'main.asp=""
titolo="Benvenuto in SIM (School Inventory Management)"
datoobbligatorio="Attenzione! Dato Obbligatorio"
'controlpanel.asp=""
titolocontrolpanel="Gestione SIM"
menu1="Macrocategorie"
menu2="Categorie"
menu3="Sottocategorie"
menu4="Kit"
menu5="Stato Kit"
menu6="Posizione Kit"
menu7="Teacher"
menu8="Segnalazioni"
menu9="Kit da Validare"
menu10="Reportistica"
tooltipimg1="Ricerca il materiale per la tua MagicBox"
tooltipimg2="Costruisci la tua MagicBox"
tooltipimg3="Segnalazioni e Anomalie"
tooltipimg4="Comunicazioni"
tooltipimg5="Registra il tuo nuovo Kit"
'sim_gestione_macrocategorie.asp=""
titolomacrocategorie="Gestione Macrocategorie"
ricercamacrocategorie="Macrocategoria"
testobottoneaggiungi="Aggiungi"
etichettabottoneaggiungi="Aggiungi Macrocategoria"
testobottoneannulla="Annulla"
etichettabottoneannulla="Annulla"
titolotabellamacrocategorie="Macrocategoria"
iconamodificamacrocategorie="Modifica Macrocategoria"
iconacancellamacrocategorie="Cancella Macrocategoria"
messaggioalertmacrocategorie="Non è possibile cancellare questa Macrocategoria perchè vi sono Kit che ne fanno parte"
'sim_gestione_categorie.asp=""
titolocategorie="Gestione Categorie"
ricercacategorie="Categoria"
titolotabellacategorie="Categoria"
iconamodificacategorie="Modifica Categoria"
iconacancellacategorie="Cancella Categoria"
etichettabottoneaggiungicat="Aggiungi Categoria"
messaggioalertcategorie="Non è possibile cancellare questa Categoria perchè vi sono Kit che ne fanno parte"
'sim_gestione_sottocategorie.asp=""
titolosottocategorie="Gestione Sottocategorie"
ricercasottocategorie="Sottocategoria"
titolotabellasottocategorie="Sottocategoria"
iconamodificasottocategorie="Modifica Sottocategoria"
iconacancellasottocategorie="Cancella Sottocategoria"
etichettabottoneaggiungiscat="Aggiungi Sottocategoria"
messaggioalertsottocategorie="Non è possibile cancellare questa Sottocategoria perchè vi sono Kit che ne fanno parte"
'sim_kit.asp=""
titolokit="Gestione Kit"
tooltipimg6="Elenco Kit disponibili"
'sim_gestione_statokit.asp=""
titolostatokit="Gestione Stati Kit"
ricercastatokit="Stato Kit"
etichettabottoneaggiungiskit="Aggiungi Stato kit"
iconamodificaskit="Modifica Stato kit"
iconacancellaskit="Cancella Stato Kit"
messaggioalertskit="Non è possibile cancellare questo Stato Kit perchè vi sono Kit che ne fanno parte"
titolotabellaskit="Stato kit"
'sim_gestione_posizione.asp=""
titoloposizioni="Gestione Posizioni Materiale"
ricercaposizioni="Posizione"
etichettabottoneaggiungipos="Aggiungi Posizione"
messaggioalertpos="Non è possibile cancellare questa Posizione perchè vi sono Kit che ne fanno parte"
titolotabellapos="Posizione"
iconamodificapos="Modifica Posizione"
iconacancellapos="Cancella Posizione"
'sim_gestione_user.asp=""
titolouser="Gestione Utenti"
ricercauser="Nome Utente"
ricercapwd="Password"
ricercaruolo="Ruolo"
etichettabottoneaggiungiuser="Aggiungi Utente"
titolotabellauser="Utente"
titolotabellapwd="Password"
titolotabellaruolo="Ruolo"
iconamodificauser="Modifica Utente"
iconacancellauser="Cancella Utente"
'sim_magicbox_segnalazione_admin.asp=""
titolosegnalazioniadmin="Segnalazioni Anomalie e Suggerimenti Kit"
titolotabellabarcode="Barcode"
titolotabellanome="Nome"
titolotabellanote="Note"
titolotabelladata="Data"
iconascheda="Visualizza scheda"
testobottoneindietro="Indietro"
etichettabottoneindietro="Torna alla pagina precedente"
testobottoneesporta="Esporta"
etichettabottoneesporta="Esporta la lista in formato Excel"
'sim_kit_validazione.asp=""
titolovalidazionekit="Elenco Kit da validare"
titolotabelladescrizione="Descrizione"
'sim_reportistica.asp=""
titoloreportistica="Reportistica"
titoloreport1="Report Storico Kit per Utente"
titoloreport2="Report Valore Magazzino"
titoloreport3="Report Kit in Stato IN"
titoloreport4="Report Stato Kit"
'sim_kit_elenco.asp=""
titoloelencokit="Elenco Kit"
'sim_gestione_kit.asp=""
titolocreazionekit="Creazione nuovo Kit"
ricercanomekit="Nome Kit"
ricercadesckit="Descrizione Kit"
ricercaqta="Quantita"
ricercadataacquisto="Data Acquisto"
ricercaprezzo="Prezzo"
ricercakeyword="Keyword"
ricercabarcode="Barcode"
etichettabottoneaggiungikit="Aggiungi Kit"
'sim_macrocategorie_modifica.asp=""
titolomodificamacrocategorie="Modifica Macrocategorie"
testobottonesalva="Salva"
etichettabottonesalva="Salva modifica"
'sim_categorie_modifica.asp=""
titolomodificacategorie="Modifica Categorie"
'sim_sottocategorie_modifica.asp=""
titolomodificasottocategorie="Modifica Sottocategorie"
'sim_statokit_modifica.asp=""
titolomodificaskit="Modifica Stato Kit"
'sim_posizione_modifica.asp=""
titolomodificapos="Modifica Posizione"
'sim_user_modifica.asp=""
titolomodificauser="Modifica Utente"
ricercastatoususer="Utente Attivo"
ricercayesno="Si o No"
'sim_magicbox_segnalazione_modifica.asp=""
titolomodificasegnalazionemb="Modifica Kit Segnalato"
ricercadatacreazione="Data Creazione"
testobottonevalidazione="Kit Valido"
etichettabottonevalidazione="Kit Valido"
'sim_magicbox_segnalazione_lateral.asp=""
titolomodificasegnalazionelateralmb="Elenco Movimenti Kit"
titolotabelladataout="Data Out"
messaggioalertsegnalazione="Nessuna segnalazione per questo Kit"
'sim_inventario_ricerca.asp=""
titoloricercamaterialemb="Ricerca Materiale MagicBox"
testobottonecerca="Cerca"
etichettabottonecerca="Cerca "
'sim_inventario_ricerca_risultati.asp=""
titolorisultatoricerca="Risultati della Ricerca"
iconaaggiungimb="Aggiungi a MagicBox"
iconastatobuono="Stato Buono"
iconastatoincompleto="Stato Incompleto"
iconastatoperso="Stato Perso"
iconastatonuovo="Stato Nuovo"
iconastatosostituito="Stato Sostituito"
iconastatoverificato="Stato Verificato"
'sim_kit_elimina_conferma.asp=""
titoloeliminakit="Eliminazione Scheda Kit"
ricercaeliminakit="Elimina Scheda Kit"
titoloalert="Attenzione"
messaggioalertelimina="Vuoi veramente eliminare questo Kit?"
testobottoneconferma="Conferma"
etichettabottoneconforma="Conferma"
titolotabellakeyword="Keywords"
'sim_kit_modifica.asp=""
titolomodificakit="Modifica Kit Barcode"
'sim_kit_segnalazione_modifica.asp=""
titolomodificakitsegnalato="Modifica Kit Segnalato"
'sim_kit_validare.asp=""
titoloschedakit="Scheda Kit"
'sim_lastprops.asp=""
titoloultimikit="Ultimi Kit inseriti"
'sim_lastprops_lateral.asp=""
titoloultimikitlateral="Gestione Magicbox"
tabellainout="In/Out"
messaggioalertmagicbox="Non hai ancora caricato nessun kit nella tua MagicBox"
ricercaeliminakitmb="Elimina Kit da MagicBox"
iconaeliminakitmb="Elimina il Kit selezionato dalla tua MagicBox"
titolombcompletata="Magic Box Completata"
iconambcompletata="Hai completato la tua Magic Box"
messaggioalertmb="Grazie per aver completato la tua MagicBox. RICORDATI di effettuare lo scarico del materiale didattico al termine della lezione"
messaggiologout="Esci da SIM"
messaggiocontinua="Continua"
%>

