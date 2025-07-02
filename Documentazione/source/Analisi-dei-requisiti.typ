#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Analisi dei requisiti",
doc)
#set page(numbering: "I")
#counter(page).update(3)
#show heading: i-figured.reset-counters.with(level: 0)
#show figure: i-figured.show-figure.with(level: 0)
#i-figured.outline(title: "Lista di immagini")
#i-figured.outline(target-kind: table, title: [Lista di tabelle])
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)

= Introduzione
== Scopo del prodotto
Il progetto consiste nello sviluppo di un videogioco con il motore di gioco #gloss[Godot] di tipo #gloss[platformer], in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale.\
Il gioco si basa su temi di #gloss[Intelligenza Artificiale] e #gloss[Machine Learning], sviluppando meccaniche ed elementi del livello basati su questi argomenti.\
Il gioco comprende 3 livelli, ognuno con un tema diverso, un menu principale che viene visualizzato non appena il gioco viene avviato, e un menu di pausa che può essere visualizzato in qualsiasi momento durante il gioco.

== Obiettivi
- *Introduzione a concetti di Intelligenza Artificiale e Machine Learning*: il gioco introduce i giocatori a concetti di IA e ML attraverso meccaniche di gioco interattive e coinvolgenti.
- *Sviluppo di abilità di problem solving*: i giocatori devono affrontare sfide e ostacoli che richiedono l'applicazione di strategie basate su IA e ML per essere superati.
- *Creazione di un'esperienza di gioco coinvolgente*: il gioco mira a fornire un'esperienza di gioco coinvolgente e stimolante, con livelli progettati per essere divertenti e impegnativi.

== Glossario
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni. I termini presenti nel glossario sono colorati di blu e seguiti da un'asterisco: #gloss[esempio].\
Il glossario è accessibile tramite il link:\ 
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")\
oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Norme di progetto:
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Norme-di-progetto.pdf")

=== Riferimenti informativi
- Slide T05 del corso di Ingegneria del Software:\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T05.pdf")\
\
- Diagrammi UML - Use case:\
#link("https://www.uml-diagrams.org/use-case-diagrams.html")\
\
- Documentazione "Godot Engine":\ 
#link("https://docs.godotengine.org/en/stable/")\
\

= Use cases
== Introduzione
Nelle seguenti sezioni sono riportati i casi d'uso del #gloss[videogioco], che descrivono le funzionalità principali e le interazioni tra il giocatore e il gioco.\
== Attori
Nel gioco è presente un solo attore, il *giocatore*, cioè l'utente che interagisce con il videogioco, controllando il personaggio e prendendo decisioni durante il gioco.
#figure(image("imgs/giocatore.png", width: auto), caption: "Attore principale")

// Azioni nel livello
== UC1 - Movimento
#figure(image("imgs/uc-movimento.png", width: auto), caption: "Movimento")
*Attori principali*:\ 
- Giocatore
*Descrizione*:\ 
- Il giocatore può muovere il personaggio in avanti, indietro, a sinistra e a destra utilizzando i tasti direzionali o i comandi di movimento del controller.
*Precondizioni*:\ 
- Il giocatore deve essere in un livello del gioco.
*Postcondizioni*:\
- Il personaggio si muove nella direzione desiderata e interagisce con l'ambiente circostante.
*Scenario principale*:\
- Il giocatore preme il tasto o muove la levetta nel #gloss[controller].
- Il personaggio si muove nella direzione desiderata.
*Inclusioni*:\
- Rotazione telecamera automatica.
*Generalizzazioni*:\
- Movimento con oggetto.


=== UC1.1 - Movimento con oggetto
*Attori principali*:\ 
- Giocatore
*Descrizione*:\ 
- Il giocatore può muovere il personaggio in avanti, indietro, a sinistra e a destra utilizzando i tasti direzionali o i comandi di movimento del controller.
*Precondizioni*:\ 
- Il giocatore deve essere in un livello del gioco.
- Il giocatore ha un oggetto con sé.
*Postcondizioni*:\
- Il personaggio si muove nella direzione desiderata
- Il personaggio sposta con sé lì'oggetto.
*Scenario principale*:\
- Il giocatore preme il tasto o muove la levetta nel #gloss[controller].
- Il personaggio si muove nella direzione desiderata insieme all'oggetto.

== UC2 - Salto
#figure(image("imgs/uc-salto.png", width: auto), caption: "Salto")
*Attori principali*:
- Giocatore
*Descrizione*:\ 
- Il giocatore può far saltare il personaggio utilizzando un tasto specifico o un comando del controller.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco e il personaggio deve essere in grado di saltare.
*Postcondizioni*:
- Il personaggio salta e può interagire con l'ambiente durante il salto.
*Scenario principale*:
- Il giocatore preme il tasto o il comando per saltare.
- Il personaggio salta.

== UC3 - Rotazione telecamera
#figure(image("imgs/uc-rotazione_telecamera.png", width: auto), caption: "Rotazione telecamera")
*Attori principali*: 
- Giocatore\
*Descrizione*:
- Il giocatore può ruotare la telecamera attorno al personaggio utilizzando i comandi del mouse o del controller.\
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.\
*Postcondizioni*:
- La telecamera si muove attorno al personaggio, cambiando l'angolo di visualizzazione.
*Scenario principale*:
- La telecamera si muove attorno al personaggio.

=== UC3.1 - Rotazione telecamera manuale
*Attori principali*: 
- Giocatore\
*Descrizione*:
- Il giocatore può ruotare la telecamera attorno al personaggio utilizzando i comandi del mouse o del controller.\
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.\
*Postcondizioni*:
- La telecamera si muove attorno al personaggio, cambiando l'angolo di visualizzazione.
*Scenario principale*:
- Il giocatore preme le frecce direzionali o lo #gloss[stick analogico] destro del controller.
- La telecamera si muove attorno al personaggio.

=== UC3.2 - Rotazione telecamera automatica
*Attori principali*: 
- Giocatore\
*Descrizione*:
- Il giocatore può ruotare la telecamera attorno al personaggio utilizzando i comandi del mouse o del controller.\
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.\
*Postcondizioni*:
- La telecamera si muove attorno al personaggio, cambiando l'angolo di visualizzazione.
*Scenario principale*:
- La telecamera si muove automaticamente dietro il personaggio.\

== UC4 - Caduta
*Attori principali*:
- Giocatore
*Descrizione*:\ 
- Il giocatore cade dal livello ed entra nell'area di caduta.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.
- Il giocatore deve entrare in un'area di caduta.
*Postcondizioni*:
- Il giocatore torna dove era prima di cadere
*Scenario principale*:
- Il giocatore cade dal livello.
- Il giocatore entra in un'area di caduta
- Il giocatore torna dove si trovava prima di cadere.
*Inclusioni*:
- Riposizionamento.

== UC5 - Riposizionamento
*Attori principali*:
- Giocatore
*Descrizione*:\ 
- Il giocatore viene posizionato in una certa zona del livello.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.
*Postcondizioni*:
- Il giocatore viene riposizionato.
*Scenario principale*:
- Il giocatore svolge una certa azione.
- La stessa azione riposiziona il giocatore in una zona diversa.

== UC6 - Raccolta collezionabile
#figure(image("imgs/uc-raccolta_collezionabile.png", width: auto), caption: "Raccolta collezionabile")
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore può raccogliere oggetti #gloss[collezionabili] presenti nel livello.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco e deve esserci un oggetto collezionabile nelle vicinanze.
*Postcondizioni*:
- Il numero di collezionabili sale di un certo valore.
*Scenario principale*:
- Il giocatore si avvicina all'oggetto collezionabile.
- Il collezionabile viene automaticamente raccolto.
/*
== UC7 - Interazione con un oggetto
#figure(image("imgs/uc-interazione.png", width: auto), caption: "Interazione con un oggetto")
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore può interagire con un oggeto premendo il tasto apposito.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco e deve esserci un oggetto con cui può interagire davanti.
*Postcondizioni*:
- Il giocatore interagisce con l'oggetto.
*Scenario principale*:
- Il giocatore si avvicina all'oggetto con cui può interagire.
- Il giocatore interagisce con l'oggetto.
*/

== UC7 - Interazione con entità
#figure(image("imgs/uc-interazione_npc.png", width: auto), caption: "Interazione con un NPC")
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore si avvicina a un'#gloss[entità] e vede un messaggio.
*Precondizioni*:
- Il giocatore deve essere vicino ad un'entità.
*Postcondizioni*:
- L'entità mostra un messaggio.
*Scenario principale*:
- Il giocatore si avvicina ad un'entità.
- L'entità mostra un messaggio.
*Generalizzazioni*:
- Interazione con un'entità manuale.


=== UC7.1 - Interazione con entità automatica
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore si avvicina a un'entità e vede il messaggio di testo.
*Precondizioni*:
- Il giocatore deve essere vicino ad un'entità.
*Postcondizioni*:
- Il giocatore visualizza il messaggio.
*Scenario principale*:
- Il giocatore si avvicina ad un'entità.
- Il giocatore visualizza il messaggio.
*Inclusioni*:
- Visualizzazione dialogo manuale.
- Visualizzazione classificazioni oggetti scoperte.

=== UC7.2 - Interazione con entità manuale
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore si avvicina a un'entità e vede l'input che deve premere per interagire.
*Precondizioni*:
- Il giocatore deve essere vicino ad un'entità.
*Postcondizioni*:
- Il gicatore preme l'input per interagire.
*Scenario principale*:
- Il giocatore si avvicina ad un'entità.
- L'entità mostra l'input da premere per interagire.
- Il giocatore preme l'input.
*Estensioni*:
- Visualizzazione dialogo manuale.
- Prendere un oggetto.
- Visualizzazione classificazioni oggetti scoperte.
- Transizione scena

== UC8 - Visualizzazione dialogo
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore visualizza il dialogo mostrato dall'entità.
*Precondizioni*:
- Il giocatore ha premuto l'input per interagire con l'entità.
*Postcondizioni*:
- L'entità mostra il dialogo.
- Il giocatore non può muoversi.
*Scenario principale*:
- Il giocatore visualizza il il dialogo
- Il giocatore non può muoversi durante l'interazione.

=== UC8.1 - Avanti nel dialogo
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore vuole continuare il dialogo.
*Precondizioni*:
- Il giocatore ha premuto l'input per andare avanti nel dialogo.
*Postcondizioni*:
- Viene mostrato il messaggio successivo del dialogo.
*Scenario principale*:
- Il giocatore preme l'input per andare avanti nel dialogo.
- Il giocatore visualizza il messaggio successivo.
*Estensioni*:
- Fine dialogo

=== UC8.2 - Fine interazione
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore vuole terminare l'interazione.
*Precondizioni*:
- Il giocatore sta interagendo con un'entità.
*Postcondizioni*:
- Il giocatore preme l'input
- Il giocatore finisce il dialogo.
- Il giocatore può muoversi di nuovo.
*Scenario principale*:
- Il giocatore smette di visualizzare il dialogo.
- Il giocatore è libero di muoversi.

=== UC8.3 - Scelta opzione dialogo
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore deve scegliere un'opzione per andare avanti nel dialogo.
*Precondizioni*:
- Il giocatore deve essere in un dialogo.
- Il giocatore visualizza le opzioni tra cui scegliere.
*Postcondizioni*:
- Il giocatore ha scelto l'opzione.
- Il dialogo finisce.
*Scenario principale*:
- Il giocatore preme l'input per scegliere l'opzione.
- Viene eseguita l'opzione scelta.

== UC9 - Prendere un oggetto
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore può prendere un oggetto e poi muoversi con esso.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco
- Deve esserci un oggetto che il giocatore può raccogliere davanti a esso.
*Postcondizioni*:
- Il giocatore interagisce con l'oggetto.
*Scenario principale*:
- Il giocatore si avvicina all'oggetto con cui può interagire.
- Il giocatore interagisce con l'oggetto.

== UC10 - Lasciare un oggetto
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore può lasciare un oggetto.
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.
- Il giocatore sta portando un oggetto.
*Postcondizioni*:
- Il giocatore lascia l'oggetto.
- L'oggetto rimane nella posizione lasciato.
*Scenario principale*:
- Il giocatore preme lo stesso tasto con cui ha raccolto l'oggetto
- Il giocatore lascia l'oggetto.

== UC11 - Visualizzazione classificazioni oggetti scoperti
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore vuole visualizzare tutte le classificazioni degli oggetti che è riuscito ad indovinare nel livello.
*Precondizioni*:
- Il giocatore è dentro il livello del Decision Tree
- Il livello deve contenere il Decision Tree sulle razze dei cani.
*Postcondizioni*:
- Il giocatore visualizza le razze di cani scoperte.
*Scenario principale*:
- Il giocatore si avvicina all'entità (il cartello in questo caso).
- Il giocatore preme l'input per interagire
- Il giocatore visualizza le classificazioni degli oggetti scoperti.
*Estensioni*:
- Fine interazione

/*
=== UC10.1 - Nuova razza cane scoperta
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore vuole visualizzare le razze di cani che è riuscito ad indovinare nel livello.
*Precondizioni*:
- Il giocatore è dentro il livello del Decision Tree
- Il livello deve contenere il Decision Tree sulle razze dei cani.
*Postcondizioni*:
- Il giocatore visualizza le razze di cani scoperte.
*Scenario principale*:
- Il giocatore si avvicina all'entità (il cartello in questo caso).
- Il giocatore preme l'input per interagire
- Il giocatore visualizza le razze di cani scoperte.
*Estensioni*:
- Fine interazione


== UC11 - Visualizzazione livello successivo
*Attori principali*: 
- Giocatore.
*Descrizione*:
- Il giocatore vuole visualizzare le razze di cani che è riuscito ad indovinare nel livello.
*Precondizioni*:
- Il giocatore è dentro il livello del Decision Tree
- Il livello deve contenere il Decision Tree sulle razze dei cani.
*Postcondizioni*:
- Il giocatore visualizza le razze di cani scoperte.
*Scenario principale*:
- Il giocatore si avvicina all'entità (il cartello in questo caso).
- Il giocatore preme l'input per interagire
- Il giocatore visualizza le razze di cani scoperte.
*Estensioni*:
- Fine interazione
*/

== UC12 - Transizione scena
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore cambia livello.
*Precondizioni*:
- Il giocatore deve trovarsi in un'area per cambiare livello.
*Postcondizioni*:
- Il giocatore è nul nuovo livello.
*Scenario principale*:
- Il giocatore entra in una zona di transizione.
- Il giocatore preme il tasto "interagisci".
- Il livello viene cambiato.
*Inclusioni*:
- Salvataggio.

== UC13 - Interazione con macchina LR
#figure(image("imgs/uc-macchina_lr.png", width: auto), caption: "Interazione la macchina LR")
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore vuole interagire con la macchina per posizionari dei punti sul grafico #gloss[LR].
*Precondizioni*:
- Il giocatore deve trovarsi in un'area per interagire con la macchina.
*Postcondizioni*:
- Il giocatore può usare la macchina.
*Scenario principale*:
- Il giocatore entra in una zona per interagire con la macchina.
- Il giocatore preme il tasto "interagisci".
- Il giocatore usa la macchina.
*Estensioni*:
- Inserimento punto nel grafico LR
- Reset dei punti aggiunti al grafico LR
- Disinterazione con macchina LR

== UC14 - Inserimento punto nel grafico LR
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore vuole posizionare un punto sul grafico LR.
*Precondizioni*:
- Il giocatore deve essere in utilizzo di una macchina LR.
*Postcondizioni*:
- Il punto viene posizionaro sul grafico.
*Scenario principale*:
- Il giocatore mire dove vuole posizionare il punto.
- Il giocatore preme il tasto "Interagisci".
- Il punto viene posizionato e la retta del grafico viene aggiornata.

== UC15 - Reset punti aggiunti nel grafico LR
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore vuole togliere i punti da lui aggiunti nel grafico.
*Precondizioni*:
- Il giocatore deve essere in utilizzo di una macchina LR.
*Postcondizioni*:
- I punti aggiunti dal giocatore vengono tolti
*Scenario principale*:
- Il giocatore preme il tasto "Reset".
- I punti aggiunti dal giocatore vengono tolti e la retta del grafico viene aggiornata.

== UC16 - Disinterazione con macchina LR
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore vuole smettere di usare la macchina LR.
*Precondizioni*:
- Il giocatore deve essere in utilizzo di una macchina LR.
*Postcondizioni*:
- Il giocatore non sta usando più la macchina.
*Scenario principale*:
- Il giocatore preme il tasto per tornare indietro.
- Il giocatore smette di usare la macchina e può tornare a muoversi.
/*
== UC16 - Visualizzazione domanda nel Decision Tree

== UC17 - Visualizzazione direzioni nel Decision Tree

=== UC17.1 - Visualizzazione opzione direzione destra
=== UC17.2 - Visualizzazione opzione direzione sinistra
=== UC17.3 - Visualizzazione opzione direzione centrale
*/
== UC17 - Inserimento dell’oggetto nello spazio dedicato
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore posiziona l'oggetto che sta portando in uno spazio apposito.
*Precondizioni*:
- Il giocatore deve portare un oggetto.
*Postcondizioni*:
- Se l'oggetto è giusto, il nuovo oggetto viene mostrato nella visualizzazione delle classificazioni degli oggetti scoperti.
*Scenario principale*:
- Il giocatore lascia l'oggetto in una zona speciale.

== UC18 - Salvataggio
*Attori principali*: 
- Giocatore
*Descrizione*: 
- Il gioco salva in automatico in momenti specifici.
*Precondizioni*: 
- Il giocatore deve essere in un livello del gioco.
*Postcondizioni*: 
- La partita viene salvata e il giocatore può riprendere da quel punto in un secondo momento.
*Scenario principale*:
- Il giocatore passa in una zona di transizione.
- Il gioco salva i dati.

== UC19 - Pausa
*Attori principali*: 
- Giocatore
*Descrizione*: 
- Il giocatore può mettere in pausa il gioco in qualsiasi momento per accedere al menu di pausa.
*Precondizioni*: 
- Il giocatore deve essere in un livello del gioco.
*Postcondizioni*: 
- Il gioco si interrompe e viene visualizzato il menu di pausa.
*Scenario principale*:
- Il giocatore preme il tasto di pausa o il comando del controller.
- Il gioco si interrompe e viene visualizzato il menu di pausa.

== UC20 -  Riprendi
*Attori principali*: 
- Giocatore
*Descrizione*: 
- Il giocatore può riprendere il gioco dal menu di pausa.
*Precondizioni*: 
- Il gioco deve essere in pausa e il menu di pausa deve essere visualizzato.
*Postcondizioni*: 
- Il gioco riprende dalla posizione in cui era stato interrotto.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Riprendi gioco" dal menu di pausa.
- Il gioco riprende dalla posizione in cui era stato interrotto.

== UC21 - Opzioni
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può accedere alle opzioni del gioco dal menu di pausa per modificare le impostazioni come volume, risoluzione, modalità finestra/schermo intero e lingua.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu di pausa deve essere visualizzato.
*Postcondizioni*:
- Il giocatore può modificare le impostazioni del gioco.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Opzioni" dal menu di pausa.
- Il gioco visualizza le opzioni disponibili per la modifica delle impostazioni.

== UC22 - Torna alla hub
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può ritornare al livello "hub" da qualsiasi altro livello.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu di pausa deve essere visualizzato.
- Il giocatore non deve essere già nel livello hub.
*Postcondizioni*:
- Il giocatore torna al livello hub.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Torna alla hub" dal menu di pausa.
- Lo schermo diventa nero per una breve durata di tempo.
- Il giocatore torna al livello hub.

== UC23 - Torna al menu principale
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può tornare al menu principale dal menu di pausa.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu di pausa deve essere visualizzato.
*Postcondizioni*:
- Il gioco torna al menu principale e il giocatore può scegliere di avviare una nuova partita o caricare una partita salvata.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Torna al menu principale" dal menu di pausa.
- Il gioco torna al menu principale.

== UC24 - Chiudi il gioco
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può chiudere il gioco premendo il tasto.
*Precondizioni*:
- Il gioco deve essere in pausa o nel menu principale.
*Postcondizioni*:
- Il gioco viene chiuso.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Esci dal gioco" dal menu di pausa o dal menu principale.
- Il gioco viene chiuso.

== UC25 - Carica partita
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può caricare una partita salvata dal menu principale.
*Precondizioni*:
- Il gioco deve essere avviato e il menu principale deve essere visualizzato.
- Il gioco presenta dei dati di salvataggio esistenti.
*Postcondizioni*:
- Il gioco carica lo stato della partita salvata e il giocatore viene portato al livello in cui si trovava.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Carica partita" dal menu principale.
- Il gioco carica lo stato della partita salvata e il giocatore viene portato al livello in cui si trovava.

== UC26 - Nuova partita
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può avviare il gioco dal menu principale.
*Precondizioni*:
- Il gioco deve essere avviato e il menu principale deve essere visualizzato.
- Il gioco non ha dati di salvataggio esistenti
*Postcondizioni*:
- Il gioco inizia e il giocatore viene portato al livello base.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Nuova partita" dal menu principale.
- Il gioco inizia e il giocatore viene portato al livello base.

== UC27 - Modifica modalità finestra
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la modalità di visualizzazione del gioco (finestra o schermo intero) dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La modalità di visualizzazione del gioco viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Modifica modalità finestra/schermo intero" dal menu delle opzioni. 
- Il gioco cambia la modalità di visualizzazione in base alla selezione del giocatore.

== UC28 - Modifica risoluzione finestra
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la risoluzione del gioco dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La risoluzione del gioco viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Modifica risoluzione" dal menu delle opzioni.
- Il gioco visualizza un elenco di risoluzioni disponibili e il giocatore può selezionare quella desiderata.

== UC29 - Modifica scala di risoluzione
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la scala di risoluzione dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La scala di risoluzione viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Scala di risoluzione" dal menu delle opzioni.
- Il giocatore scorre la barra sul valore desiderato.
- Il gioco cambia la scala di risoluzione in base alla selezione del giocatore.

== UC30 - Modifica anti-aliasing
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la qualità delle ombre dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La qualità delle ombre viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Qualità ombre" dal menu delle opzioni.
- Il giocatore visualizza un elenco di opzioni disponibili e il giocatore può selezionare quella desiderata.
- Il gioco cambia la qualità delle ombre in base alla selezione del giocatore.

== UC31 - Modifica qualità ombre
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la qualità delle ombre dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La qualità delle ombre viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Qualità ombre" dal menu delle opzioni.
- Il giocatore visualizza un elenco di opzioni disponibili e il giocatore può selezionare quella desiderata.
- Il gioco cambia la qualità delle ombre in base alla selezione del giocatore.

== UC32 - Cambia lingua
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare la lingua del gioco dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- La lingua del gioco viene modificata in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Modifica lingua" dal menu delle opzioni.
- Il giocatore visualizza un elenco di lingue disponibili e il giocatore può selezionare quella desiderata.
- Il gioco cambia la lingua in base alla selezione del giocatore.

== UC33 - Modifica volume
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può modificare il volume del gioco dal menu delle opzioni.
*Precondizioni*:
- Il gioco deve essere in pausa e il menu delle opzioni deve essere visualizzato.
*Postcondizioni*:
- Il volume del gioco viene modificato in base alle preferenze del giocatore.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Modifica volume" dal menu delle opzioni.
- Il giocatore visualizza un cursore per regolare il volume.

== UC34 - Salva ed esci dalle opzioni
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può salvare le opzioni scelte.
*Precondizioni*:
- Il giocatore deve essere nel menu di opzioni.
*Postcondizioni*
- Il gioco salva ed applica le opzioni.
*Scenario principale*:
- Il gioco salva le opzioni.
- Il gioco applica le opzioni.
- Il menu di opzioni viene chiuso.


= Requisiti
In questa sezione vengono elencati i requisiti del capitolato, individuati durante la fase di analisi. Ogni #gloss[requisito] viene
identificato da un codice, scelto in base ai seguenti parametri:
#align(center, [*R - [numero] - [tipo] - [priorità]*])
con:
- *Numero*: numero progressivo che identifica il requisito, parte da 01.
- *Tipo*: può essere
  - *F*: requisito funzionale, indica una funzionalità del sistema;
  - *Q*: requisito di qualità, definisce le caratteristiche della qualità del prodotto, come un sistema deve essere o come
    il sistema deve esibirsi, per soddisfare le esigenze dell'utente;
  - *V*: requisito di vincolo, ovvero limiti e restrizioni imposte dal capitolato;
- *Priorità*: può essere
  - *O*: Obbligatorio, viene richiesto dal #gloss[proponente] ed è necessario per considerare il prodotto completo;
  - *D*: Desiderabile, non è strettamente necessario ma è un valore aggiunto;
Infine, nella sezione fonte, viene scritto se il requisito è stato deciso dallo studente o tramite una discussione con il tutor aziendale.
== Requisiti funzionali
#show figure: set block(breakable: true)
#figure(
  caption: [Requisiti di funzionalità],
  table(
    columns: (0.65fr, 2fr, 0.8fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*ID Requisito*], [*Descrizione*], [*Fonte*]),
    [R-01-F-O],
    [Il giocatore deve essere in grado di muoversi in uno spazio tridimensionale],
    [UC1\ Discussione con il tutor aziendale],
    [R-02-F-O],
    [Il giocatore deve essere in grado di muoversi in uno spazio tridimensionale portando un oggetto],
    [UC1.1\ Discussione con il tutor aziendale],
    [R-03-F-O],
    [Il giocatore deve essere in grado saltare],
    [UC2\ Decisione interna],
    [R-04-F-O],
    [La telecamera deve muoversi automaticamente dietro il giocatore quando questo si muove],
    [UC3, UC3.1\ Decisione interna],
    [R-05-F-O],
    [Il giocatore deve essere in grado di ruotare la telecamera],
    [UC3, UC3.2\ Decisione interna],
    [R-06-F-O],[Il giocatore deve tornare in una posizione precedente quando cade dal livello],
    [UC4, UC5\ Decisione interna],
    [R-07-F-O],
    [Il giocatore deve essere in grado di raccogliere collezionabili sparsi per il livello],
    [UC6\ Discussione con il tutor aziendale],
    ////
    [R-08-F-O],
    [Il giocatore deve essere in grado di interagire con entità presenti nel livello],
    [UC7, UC7.1, UC7.2\ Discussione con il tutor aziendale],
    [R-09-F-O],
    [Il giocatore deve poter visualizzare il dialogo quando interagisce con delle entità specifiche],
    [UC8\ Decisione interna],
    [R-10-F-O],
    [Il giocatore deve poter andare avanti nel dialogo],
    [UC8.1\ Decisione interna],
    [R-11-F-O],
    [Il giocatore deve poter finire l'interazione con l'entità],
    [UC8.2\ Decisione interna],
    [R-12-F-O],
    [Il giocatore deve poter scegliere un'opzione quando ne vengono mostrate di più],
    [UC8.3\ Decisione interna],
    [R-13-F-O],
    [Il giocatore deve poter essere in grado di raccogliere oggetti],
    [UC9\ Discussione con il tutor aziendale],
    [R-F-14-O],
    [Il giocatore deve poter essere in grado di lasciare l'oggetto che sta portando],
    [UC10\ Discussione con il tutor aziendale],
    [R-15-F-O],[Il giocatore deve poter visualizzare gli oggetti che ha classificato correttamente],
    [UC11\ Discussione con il tutor aziendale],
    [R-16-F-O],
    [Il giocatore deve poter essere in grado di cambiare livello],
    [UC12\ Decisione interna],
    ////
    [R-17-F-O],
    [Il giocatore deve poter interagire con la macchina LR],
    [UC13\ Discussione con il tutor aziendale],
    [R-18-F-O],
    [Il giocatore deve poter inserire punti nel grafico LR],
    [UC14\ Discussione con il tutor aziendale],
    [R-19-F-O],
    [Il giocatore deve poter resettare i punti aggiunti nel grafico LR],
    [UC15\ Discussione con il tutor aziendale],
    [R-20-F-O],
    [Il giocatore deve poter interrompere l’interazione con la macchina LR],
    [UC16\ Discussione con il tutor aziendale],
    [R-21-F-O],
    [Lo spazio deve riconoscere se l'oggetto posto sopra sia giusto o sbagliato],
    [UC17\ Discussione con il tutor aziendale],
    [R-22-F-O],
    [Il gioco deve salvare automaticamente i progressi in momenti specifici],
    [UC18\ Decisione interna],
    [R-23-F-O],
    [Il giocatore deve poter mettere in pausa il gioco],
    [UC19\ Decisione interna],
    [R-24-F-O],
    [Il giocatore deve poter riprendere il gioco dal menu di pausa],
    [UC20\ Decisione interna],
    [R-25-F-O],
    [Il giocatore deve poter accedere alle opzioni del gioco],
    [UC21\ Decisione interna],
    [R-26-F-O],
    [Il giocatore deve poter tornare al livello hub dal menu di pausa],
    [UC22\ Decisione interna],
    [R-27-F-D],
    [Il giocatore deve poter tornare al menu principale dal menu di pausa],
    [UC23\ Decisione interna],
    [R-28-F-O],
    [Il giocatore deve poter chiudere il gioco dal menu di pausa o principale],
    [UC24\ Decisione interna],
    [R-29-F-O],
    [Il giocatore deve poter caricare una partita salvata dal menu principale],
    [UC25\ Decisione interna],
    [R-30-F-O],
    [Il giocatore deve poter avviare una nuova partita dal menu principale],
    [UC26\ Decisione interna],
    [R-31-F-O],
    [Il giocatore deve poter modificare la modalità della finestra dal menu delle opzioni],
    [UC27\ Decisione interna],
    [R-32-F-O],
    [Il giocatore deve poter modificare la risoluzione della finestra],
    [UC28\ Decisione interna],
    [R-33-F-D],
    [Il giocatore deve poter modificare la scala di risoluzione del gioco],
    [UC29\ Decisione interna],
    [R-34-F-D],
    [Il giocatore deve essere in grado di poter modificare il tipo di anti-aliasing usato nel gioco, oppure non usarlo],
    [UC30\ Decisione interna],
    [R-35-F-D],[Il giocatore deve essere in grado di modificare la qualità delle ombre nel gioco],
    [UC31\ Decisione interna],
    [R-36-F-D],[Il giocatore deve poter cambiare lingua di gioco],
    [UC32\ Decisione interna],
    [R-37-F-D],[Il giocatore deve poter cambiare il volume generale del gioco],
    [UC33\ Decisione interna],
    [R-38-F-O],[Il gioco deve applicare e salvare le opzioni selezionate],[
    UC34\ Decisione interna],
  )
)

== Requisiti di qualità
#figure(
  caption: [Requisiti di qualità],
  table(
    columns: (0.7fr, 2fr, 0.8fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*ID Requisito*], [*Descrizione*], [*Fonte*]),
    "R-01-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti la progettazione architetturale",
    "Decisione interna",

    "R-02-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti le tecnologie utilizzate",
    "Decisione interna",

    "R-03-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti la progettazione della base di dati",
    "Decisione interna",

    "R-04-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti l'implementazione del sistema di raccomandazione utilizzato con LLM",
    "Decisione interna",

    "R-05-Q-O",
    "Tutte le attività del progetto devono essere svolte rispettando le Norme di Progetto",
    "Decisione interna",

    "R-06-Q-O", "Tutto il codice e la documentazione vanno salvati all'interno di un repository pubblico", 
    "Decisione interna",
  ),
)

== Requisiti di vincolo
#show figure: set block(breakable: true)
#figure(
  caption: [Requisiti di vincolo],
  table(
    columns: (0.7fr, 2fr, 0.8fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*ID Requisito*], [*Descrizione*], [*Fonte*]),
    "R-01-V-O", 
    "Il gioco deve supportare i sistemi operativi Windows e Ubuntu",
    "Decisione interna",
    "R-02-V-O",
    "La piattaforma deve essere responsive e funzionare correttamente su dispositivi desktop con risoluzione minima di 640x360px",
    "Decisione interna",
  ),
)
== Tracciamento dei requisiti
#figure(
  caption: [Tracciamento requisiti],
  table(
    columns: (1.2fr, 1.2fr, 0.5fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*Requisito*], [*Fonti*], [*Soddisfatto*]),
    // Requisiti funzionali
    "R-01-F-O", "UC1","\u{2713}",
    "R-02-F-O", "UC1.1","\u{2713}",
    "R-03-F-O", "UC2","\u{2713}",
    "R-04-F-O", "UC3, UC3.1","\u{2713}",
    "R-05-F-D", "UC3, UC3.2","\u{2713}",
    "R-06-F-O", "UC4, UC5","\u{2713}",
    "R-07-F-O", "UC6","\u{2713}",
    "R-08-F-O", "UC7, UC7.1, UC7.2","\u{2713}",
    "R-09-F-O", "UC8","",
    "R-10-F-O", "UC8.1","\u{2713}",
    "R-11-F-D", "UC8.2","",
    "R-12-F-O", "UC8.3","\u{2713}",
    "R-13-F-O", "UC9","\u{2713}",
    "R-14-F-O", "UC10","\u{2713}",
    "R-15-F-O", "UC11","\u{2713}",
    "R-16-F-O", "UC12","\u{2713}",
    "R-17-F-O", "UC13","\u{2713}",
    "R-18-F-O", "UC14","\u{2713}",
    "R-19-F-O", "UC15","\u{2713}",
    "R-20-F-O", "UC16","\u{2713}",
    "R-21-F-O", "UC17","\u{2713}",
    "R-22-F-D", "UC18","\u{2713}",
    "R-23-F-D", "UC19","\u{2713}",
    "R-24-F-D", "UC20","\u{2713}",
    "R-25-F-D", "UC21","\u{2713}",
    "R-26-F-O", "UC22","\u{2713}",
    "R-27-F-D", "UC23","\u{2713}",
    "R-28-F-O", "UC24","\u{2713}",
    "R-29-F-O", "UC25","\u{2713}",
    "R-30-F-O", "UC26","\u{2713}",
    "R-31-F-O", "UC27","\u{2713}",
    "R-32-F-O", "UC28","\u{2713}",
    "R-33-F-O", "UC29","\u{2713}",
    "R-34-F-D", "UC30","\u{2713}",
    "R-35-F-D", "UC31","\u{2713}",
    "R-36-F-D", "UC32","",
    "R-37-F-D", "UC33","",
    "R-38-F-O", "UC34","\u{2713}",
    // Requisiti di qualità
    "R-01-Q-O", "Decisione interna","",
    "R-02-Q-O", "Decisione interna","",
    "R-03-Q-O", "Decisione interna","",
    "R-04-Q-O", "Decisione interna","",
    "R-05-Q-O", "Decisione interna","\u{2713}",
    "R-06-Q-O", "Decisione interna","\u{2713}",
    // Requisiti di vincolo
    "R-01-V-O", "Decisione interna","",
    "R-02-V-O", "Decisione interna","",
  ),
)
== Riepilogo 