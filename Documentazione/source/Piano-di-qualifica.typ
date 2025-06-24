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
Il glossario è accessibile tramite il link [Glossario](glossario.typ) oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Piano di lavoro:\
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
=== Documentazione
=== Verifica
=== Gestione della qualità

== Qualità del prodotto
=== Funzionalità
=== Affidabilità
=== Usabilità
=== Efficienza
=== Manutenibilità
=== Sicurezza
=== Compatibilità

= Metodologie di testing
== Tipologie di test
=== Test di unità
I test di unità sono utilizzati per verificare il corretto funzionamento delle singole unità del prodotto software, come ad esempio le funzioni o i metodi.\
I test di unità sono eseguiti durante lo sviluppo del prodotto, e sono utilizzati per identificare eventuali problemi o errori nelle singole unità del prodotto.\
//.......

