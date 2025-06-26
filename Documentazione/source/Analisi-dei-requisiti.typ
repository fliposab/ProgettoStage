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
- Diagrammi UML - Use case:\
#link("https://www.uml-diagrams.org/use-case-diagrams.html")\
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

== UC1.1 - Movimento con oggetto
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
- La telecamera si muove attorno al personaggio.

== UC3.1 - Rotazione telecamera manuale
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

== UC3.2 - Rotazione telecamera automatica
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

== UC5.1 - Prendere un oggetto
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

== UC5.2 - Rilasciare un oggetto
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

== UC6 - Interazione con NPC
*Attori principali*: 
- Giocatore
*Descrizione*:
- Il giocatore si avvicina a un #gloss[NPC] e riceve un messaggio.
*Precondizioni*:
- Il giocatore deve essere vicino ad un NPC.
*Postcondizioni*:
- L'NPC mostra il messaggio.
*Scenario principale*:
- Il giocatore si avvicina ad un NPC.
- L'NPC mostra il messaggio automaticamente.

== UC7 - Transizione scena
== UC8 - Inserimento punto nel grafico LR
== UC9 
== Interazione con macchina LR
== UC11 - Disinterazione con macchina LR
== UC12 - Inserimento dell’oggetto nello spazio dedicato
== UC12.1 - spazio errato
== UC12.2 - spazio giusto
== UC13 - Salvataggio
*Attori principali*: 
- Giocatore
*Descrizione*: 
Il gioco salva in automatico in momenti specifici.
*Precondizioni*: 
Il giocatore deve essere in un livello del gioco.
*Postcondizioni*: 
La partita viene salvata e il giocatore può riprendere da quel punto in un secondo momento.
*Scenario principale*:
- Il giocatore passa in una zona di transizione.
- Il gioco salva i dati.

== UC14 - Pausa
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

== UC15 -  Riprendi
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

== UC16 - Opzioni
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

== UC17 - Torna alla hub
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

== UC18 - Torna al menu principale
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

== UC19 - Chiudi il gioco
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

== UC20 - Carica partita
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

== UC21 - Nuova partita
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

== UC22 - Modifica modalità finestra
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

== UC23 - Modifica risoluzione finestra
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

== UC24 - Modifica scala di risoluzione
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

== UC25 - Modifica anti-aliasing
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

== UC26 - Modifica qualità ombre
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

== UC27 - Cambia lingua
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

== UC28 - Modifica volume
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

== UC28 - Salva ed esci dalle opzioni
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
== Requisiti funzionali
== Requisiti di qualità
== Requisiti di vincolo
== Riepilogo 