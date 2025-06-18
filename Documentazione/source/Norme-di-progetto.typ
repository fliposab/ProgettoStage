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
Il progetto consiste nello sviluppo di un videogioco con il motore di gioco #gloss[Godot] di tipo #gloss[platformer], in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale.\
Il gioco si basa su temi di #gloss[Intelligenza Artificiale] e #gloss[Machine Learning], sviluppando meccaniche ed elementi del livello basati su questi argomenti.\
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
Il processo di fornitura è strutturato in conformità agli esiti previsti dalla clausola 5.2 dello #gloss[standard] ISO/IEC 12207:1997. Tale processo include la definizione di requisiti concordati,
l’analisi dei rischi associati, e la pianificazione di tempi e costi.

=== Scopo e descrizione
Il processo di fornitura ha lo scopo di garantire che il prodotto software sia consegnato al cliente in modo completo e funzionante.\

=== Attività
Il processo di fornitura comprende le seguenti attività:
- Analisi dei requisiti:\
  raccolta e analisi dei requisiti del cliente, definizione delle specifiche del prodotto.
- Confronto:\
  confronto tra i requisiti del #gloss[relatore aziendale] e le specifiche del prodotto, identificazione delle eventuali discrepanze.
- Pianificazione:\
  pianificazione delle attività di sviluppo, stima dei tempi e dei costi, definizione del piano di progetto.
- Progettazione:\
  definizione dell'architettura del sistema, progettazione dei componenti software.
- Sviluppo:\
  implementazione del codice sorgente, creazione dei test unitari.
- Verifica e validazione:\
  esecuzione dei test di integrazione, verifica della conformità alle specifiche.
- Consegna:\
  consegna del prodotto al cliente, formazione degli utenti, raccolta dei feedback.

=== Rapporto con il tutor aziendale
Il rapporto con il tutor aziendale è fondamentale per garantire che il prodotto software soddisfi le aspettative stabilite.
Il tutor aziendale viene contattato in due modalità:
- Incontri periodici:\
  incontri settimanali per discutere lo stato di avanzamento del progetto, raccogliere feedback e risolvere eventuali problemi.
- Comunicazioni via email:\
  comunicazioni via email per condividere documenti, report di avanzamento e richieste di chiarimenti.

=== Documentazione
Il processo di fornitura deve essere documentato in modo dettagliato, in modo da garantire la tracciabilità delle attività svolte e delle decisioni prese.\

=== Analisi dei requisiti
Nel documento _Analisi dei requisiti_ sono stati definiti tutti gli #gloss[use case] e i requisiti funzionali del progetto. Questi sono stati raccolti in collaborazione con il tutor aziendale e sono stati utilizzati come base per la progettazione e lo sviluppo del software.

=== Piano di progetto
Il _Piano di progetto_ è un documento che definisce le attività da svolgere e i tempi previsti per lo sviluppo del software.\
Viene descritto in dettaglio ogni periodo di sviluppo, con una retropsettiva delle attività svolte e una pianificazione delle attività future.\

=== Piano di qualifica
Nel documento _Piano di qualifica_ sono definite le metriche che vengono usate per garantire la qualità del prodotto software. Vengono inoltre scritte le modalità di test e verifica del software, in modo da garantire che il prodotto soddisfi i requisiti stabiliti.

=== Specifica tecnica
La _Specifica tecnica_ è un documento che descrive in dettaglio l'architettura del sistema, i componenti software e le loro interazioni.\
=== Manuale utente
Il _Manuale utente_ è un documento che fornisce istruzioni dettagliate su come utilizzare il software e garantirne il corretto funzionamento.\

== Strumenti utilizzati
Gli strumenti utilizzati per lo sviluppo del software sono i seguenti:
- *Godot*: motore di gioco utilizzato per lo sviluppo del videogioco.
- *Blender*: software di modellazione 3D utilizzato per la creazione dei modelli, delle animazioni e delle texture del videogioco.
- *GIMP*: software di modifica delle immagini utilizzato per la modifica occasionale di texture e delle immagini del videogioco.
- *Git*: sistema di controllo versione utilizzato per gestire il codice sorgente e le modifiche apportate.
- *Typst*: linguaggio di markup utilizzato per la composizione tipografica della documentazione.
- *GitHub*: piattaforma di hosting per il codice sorgente e la gestione del progetto, utilizzata per la collaborazione tra i membri del team di sviluppo.
- *Visual Studio Code*: editor di testo utilizzato per la scrittura del codice sorgente e della documentazione.
- *GitHub Actions*: strumento di integrazione continua utilizzato per automatizzare i processi di build, test e distribuzione del software, garantendo che il codice sia sempre in uno stato funzionante e pronto per la consegna.
= Sviluppo

= Processi di supporto
== Documentazione
=== Scopo e descrizione
Il processo di documentazione ha lo scopo di garantire che tutta la documentazione necessaria per il progetto sia creata e mantenuta aggiornata.\
=== Analisi dei requisiti
=== Progettazione
=== Codifica e testing

= Processi di supporto
== Documentazione
=== Scopo e descrizione
=== Composizione tipografica
=== Struttura dei documentazione
=== Documenti del progetto
=== Elenchi puntati
=== Immagini use case
=== Formato delle date
=== Strumenti
== Gestione della configurazione
