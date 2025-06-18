#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Norme di progetto",
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
== Scopo del documento
Il presente documento ha lo scopo di definire le norme di progetto che verranno seguite durante lo sviluppo del videogioco.\
Le norme di progetto sono un insieme di regole e linee guida che devono essere seguite durante lo sviluppo del progetto, al fine di garantire la qualità del prodotto finale e la sua manutenibilità nel tempo.\
Esse comprendono le convenzioni di codifica, le linee guida per la documentazione, le procedure di test e le pratiche di gestione del progetto.
== Scopo del prodotto
Il progetto consiste nello sviluppo di un videogioco con il motore di gioco "Godot" di tipo platform, in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale.\
Il gioco si basa su temi di Intelligenza Artificiale e Machine Learning, sviluppando meccaniche ed elementi del livello basati su questi argomenti.\
Il gioco comprende 3 livelli, ognuno con un tema diverso, un menu principale che viene visualizzato non appena il gioco viene avviato, e un menu di pausa che può essere visualizzato in qualsiasi momento durante il gioco.
== Glossario
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni.\
Il glossario è accessibile tramite il link [Glossario](glossario.typ) oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
=== Riferimenti informativi
- Glossario:\
link

//TODO ISO standards

= Processi primari

== Processo di fornitura
=== Scopo e descrizione
// da controllare
Il processo di fornitura ha lo scopo di garantire che il prodotto software sia consegnato al cliente in modo completo e funzionante.\
Il processo comprende le seguenti attività:
- Pianificazione della consegna: definizione delle tempistiche e delle modalità di consegna del prodotto.
- Preparazione della consegna: verifica che il prodotto sia completo e funzionante, e che siano stati eseguiti tutti i test necessari.
- Consegna del prodotto: consegna del prodotto al cliente, accompagnata da tutta la documentazione necessaria.

=== Rapporto con il tutor aziendale
Il rapporto con il tutor aziendale è fondamentale per garantire che il prodotto software soddisfi le aspettative del cliente.\
Il tutor aziendale è il referente del cliente e ha il compito di verificare che il prodotto sia conforme alle specifiche richieste.\
Il tutor aziendale deve essere coinvolto in tutte le fasi del processo di fornitura, dalla pianificazione alla consegna del prodotto.\
Il tutor aziendale deve essere informato di eventuali problemi o ritardi nella consegna del prodotto, e deve essere consultato per eventuali modifiche alle specifiche richieste.
=== Documentazione
Il processo di fornitura deve essere documentato in modo dettagliato, in modo da garantire la tracciabilità delle attività svolte e delle decisioni prese.\
=== Analisi dei requisiti
=== Piano di progetto
=== Piano di qualifica
=== Specifica tecnica
=== Manuale utente
== Sviluppo

= Processi di supporto
== Documentazione
=== Scopo e descrizione
Il processo di documentazione ha lo scopo di garantire che tutta la documentazione necessaria per il progetto sia creata e mantenuta aggiornata.\
=== Analisi dei requisiti
=== Progettazione
=== Codifica e testing