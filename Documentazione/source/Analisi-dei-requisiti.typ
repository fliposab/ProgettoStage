#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Analisi dei requisiti",
doc)
// spaciugo per aggiungere l'indice delle immagini
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
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni.\
Il glossario è accessibile tramite il link [Glossario](glossario.typ) oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Norme di progetto:
link

=== Riferimenti informativi
- Slide T05 del corso di Ingegneria del Software:\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T05.pdf")\
\
- Analisi e descrizione delle funzionalità: Use case e relativi diagrammi(UML):\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T05.pdf")\
\
- Documentazione "Godot Engine":\ 
#link("https://docs.godotengine.org/en/stable/")\
\

- Glossario:\
link

= Use cases
== Introduzione
Nelle seguenti sezioni sono riportati i casi d'uso del #gloss[videogioco], che descrivono le funzionalità principali e le interazioni tra il giocatore e il gioco.\
== Attori
Nel gioco è presente un solo attore, il *giocatore*, cioè l'utente che interagisce con il videogioco, controllando il personaggio e prendendo decisioni durante il gioco.
#figure(image("imgs/giocatore.png", width: auto), caption: "Attore principale")
// Azioni nel livello
== UC1 - Movimento
#figure(image("imgs/uc-movimento.png", width: auto), caption: "UC1 - Movimento")
*Attori principali*:\ 
- Giocatore
*Descrizione*:\ 
- Il giocatore può muovere il personaggio in avanti, indietro, a sinistra e a destra utilizzando i tasti direzionali o i comandi di movimento del controller.
*Precondizioni*:\ 
- Il giocatore deve essere in un livello del gioco.
*Postcondizioni*:\
- Il personaggio si muove nella direzione desiderata e interagisce con l'ambiente circostante
*Scenario principale*:\
- Il giocatore preme il tasto o muove la levetta nel #gloss[controller]
- Il personaggio si muove nella direzione desiderata

== UC2 - Salto
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
*Attori principali*: 
- Giocatore\
*Descrizione*:
- Il giocatore può ruotare la telecamera attorno al personaggio utilizzando i comandi del mouse o del controller.\
*Precondizioni*:
- Il giocatore deve essere in un livello del gioco.\
*Postcondizioni*:
- La telecamera si muove attorno al personaggio, cambiando l'angolo di visualizzazione.
*Scenario principale*:
- Il giocatore muove il mouse o il controller per ruotare la telecamera.
- La telecamera si muove attorno al personaggio.

== UC4 - Raccolta collezionabile
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

== UC5 - Interazione con un oggetto
== UC5.1 - Prendere un oggetto
== UC5.2 - Rilasciare un oggetto
== UC? - Caricamento livello
== UC? - Salva partita
*Attori principali*: 
- Giocatore
*Descrizione*: 
Il giocatore può salvare la partita in qualsiasi momento durante il gioco.
*Precondizioni*: 
Il giocatore deve essere in un livello del gioco.
*Postcondizioni*: 
La partita viene salvata e il giocatore può riprendere da quel punto in un secondo momento.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Salva partita" dal menu di pausa.
- Il gioco salva lo stato attuale, inclusi i progressi e il numero dei collezionabili raccolti.
== UC? - Pausa
//#figure(image("imgs/uc-pausa.png", width: auto), caption: "UC? - Pausa")
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

// Azioni nel menu di pausa
== UC? - Riprendi gioco
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


== UC? - Opzioni
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
== UC? - Torna al menu principale
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

// Opzioni
== UC? - Modifica volume
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
- Il gioco visualizza un cursore per regolare il volume.

== UC? - Modifica risoluzione
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
== UC? - Modifica modalità finestra/schermo intero
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

== UC? - Modifica lingua
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
- Il gioco visualizza un elenco di lingue disponibili e il giocatore può selezionare quella desiderata.
- Il gioco cambia la lingua in base alla selezione del giocatore.
// Azioni nel menu principale
== UC? - Nuova partita
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

== UC? - Carica partita
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

== UC? - Esci dal gioco
*Attori principali*:
- Giocatore
*Descrizione*:
- Il giocatore può uscire dal gioco dal menu principale o dal menu d pausa.
*Precondizioni*:
- Il gioco deve essere avviato e il menu principale o il menu di pausa devono essere visualizzati.
*Postcondizioni*:
- Il gioco viene chiuso.
*Scenario principale*:
- Il giocatore seleziona l'opzione "Esci dal gioco" dal menu principale o dal menu di pausa.
- Il gioco viene chiuso.

= Requisiti
== Requisiti funzionali
== Requisiti di qualità
== Requisiti di vincolo
== Riepilogo 