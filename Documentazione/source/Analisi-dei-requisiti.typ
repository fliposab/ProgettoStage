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
Il progetto consiste nello sviluppo di un videogioco con il motore di gioco "Godot" di tipo platform, in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale.\
Il gioco si basa su temi di Intelligenza Artificiale e Machine Learning, sviluppando meccaniche ed elementi del livello basati su questi argomenti.\
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
== Attori

// Azioni nel livello
== UC1 - Movimento
== UC2 - Salto
== UC3 - Interazione con un oggetto
== UC3.1 - Prendere un oggetto
== UC3.2 - Rilasciare un oggetto
== UC? - Caricamento livello
== UC? - Salva partita
== UC? - Pausa

// Azioni nel menu di pausa
== UC? - Riprendi gioco
== UC? - Opzioni
== UC? - Torna al menu principale
== UC? - Esci dal gioco

// Opzioni
== UC? - Modifica volume
== UC? - Modifica risoluzione
== UC? - Modifica modalità finestra/schermo intero
== UC? - Modifica lingua

// Azioni nel menu principale
== UC? - Avvia gioco
== UC? - Carica partita
== UC? - Esci dal gioco

= Requisiti
== Requisiti funzionali
== Requisiti di qualità
== Requisiti di vincolo
== Riepilogo 