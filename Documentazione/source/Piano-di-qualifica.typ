#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Piano di qualifica",
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
== Scopo del documento
Il presente documento ha lo scopo di definire le metriche di qualità che verranno utilizzate per valutare il prodotto software, e le modalità di verifica e validazione del prodotto.\

== Glossario
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni. I termini presenti nel glossario sono colorati di blu e seguiti da un'asterisco: #gloss[esempio].\
Il glossario è accessibile tramite il link #link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf") oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Norme di progetto:\
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Norme-di-progetto.pdf")\
\
=== Riferimenti informativi
// DA AGGIUSTARE
- Slide T08 - Qualità di processo:\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T08.pdf")\
\
- Slide T09 - Verifica e validazione:\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T09.pdf")\
\
- Glossario:\
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")
\
= Metriche di qualità
== Introduzione
Le metriche di qualità sono utilizzate per valutare la qualità del prodotto software, e per identificare eventuali problemi o aree di miglioramento.\

== Qualità di processo
La qualità di processo si riferisce alla qualità delle attività svolte durante lo sviluppo del prodotto software.\
Le metriche di qualità di processo sono utilizzate per valutare l'efficacia e l'efficienza delle attività svolte, e per identificare eventuali problemi o aree di miglioramento.\
=== Fornitura
Per il processo di fornitura, vengono indicate tutte le scelte operative fatte in fase di sviluppo. Viene usato l'acronimo MPC (Minimum Predictive Capability).\
In questo caso, il MPC è il valore minimo da raggiungere per essere considerato accettabile.
- *MPC-CT - Completion Time*: tempo totale previsto per completare il progetto, idealmente non deve superare quello pianificato nel Piano di lavoro.
=== Sviluppo
==== Codice
- *MPC-RSI - Requirements Stability Index*: indice di stabilità dei requisiti. Indica la percentuale di requisiti che sono stati modificati rispetto al totale dei requisiti. Un valore alto indica
che i requisiti sono stabili e non soggetti a modifiche frequenti.\
- *MPC-TD - Technical Debt Ratio*: rapporto tra il tempo necessario per risolvere i problemi
tecnici e il tempo necessario per sviluppare nuove funzionalità. Un valore basso indica che il
codice è ben strutturato e non presenta problemi tecnici.\
==== Grafica 3D
Le seguenti metriche vengono applicate principalmente al #gloss[modello 3D] principale del giocatore, visto che gli altri modelli utilizzati sono semplicemente cubi o sfere:
- *MPC-MVC - Model Vertex Count*: un modello 3D è costituito da un certo numero di triangoli e vertici. Ovviamente, maggiore è il numero di vertici, più risorse sono richieste per il #gloss[rendering] di esso, rendendo inoltre più complicato successive modifiche. Un numero giusto (né troppo alto né troppo basso) è consigliato per garantire una buona qualità del modello ed evitare possibili complicazioni.\
- *MPC-MBC - Model Bones Count*:
- *MPC-UIC - UV Islands Count*: avere un numero minore di #gloss[UV Islands] permette una gestione della #gloss[texture] più semplice.\
- *MPC-UIS - UV Islands Space (in percentuale)*: percentuale della texture occupata e utilizzata dalle UV Islands. Uno spazio maggiore utilizza più pixel dell'immagine e garantisce una maggiore qualità.
//Animazioni
=== Documentazione
- *MPC-IG - Indice di Gulpease*:
- *MPC-CO - Correttezza ortografica*:
=== Verifica
- *MPC-CCO - Code Coverage*:
- *MPC-TSP - Test superati (in percentuale)*:
=== Gestione della qualità
- *MPC-SQM - Satisfaction of Quality Metrics*:

== Qualità del prodotto
=== Funzionalità
- *MPD-RO - Copertura requisiti obbligatori*:
- *MPD-OP - Copertura requisiti opzionali*:
=== Affidabilità
- *MPD-CC - Code Coverage*:
//=== Usabilità
=== Efficienza
- *MPD-TF - Target FPS*: indica gli #gloss[fps] obiettivo da mantenere durante l'esecuzione del gioco. 
- *MPD-LS - Lag Spikes*: indica il numero di #gloss[lag spikes] che occorrono durante l'esecuzione del gioco. Non vengono contati durante un #gloss[caricamento] tra un livello e un altro e vengono contati solo durante i livelli.
==== Specifiche macchina
Molto importante è specificare le componenti della macchina su cui viene testato il gioco, dato che macchine diverse offrono prestazioni diverse:
#figure(caption: [Componenti macchina 1], table(
  columns: (0.8fr, 2fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 10) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Componente*], [*Dettagli*]),
  [#gloss[CPU]],[AMD® Ryzen 5 4500U],[#gloss[GPU]],[Integrata alla CPU],[#gloss[RAM]],[8GB DDR4],[#gloss[SSD]],[],[Sistema Operativo],[Pop_OS]
))\
In sintesi, la macchina su cui viene testato il gioco offre prestazioni sulla fascia media-bassa, quindi si ritiene che se il gioco offre delle buone prestazioni sulla macchina di testing, offrirà in media buone prestazioni su tutte le macchine con un sistema operativo supportato.

//=== Manutenibilità
//=== Sicurezza
//=== Compatibilità

= Metodologie di testing
== Tipologie di test
=== Test di unità
I test di unità sono utilizzati per verificare il corretto funzionamento delle singole unità del prodotto software, come ad esempio le funzioni o i metodi.\
I test di unità sono eseguiti durante lo sviluppo del prodotto, e sono utilizzati per identificare eventuali problemi o errori nelle singole unità del prodotto.\
//.......

= Cruscotto di valutazione delle metriche

//= Automiglioramento
