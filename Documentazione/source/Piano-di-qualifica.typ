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
Il glossario è accessibile tramite il link:\ 
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")\
oppure consultando il rispettivo documento all'interno della stessa cartella.

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

#figure(caption: [Valori per misurare la qualità della fornitura], table(
  columns: (0.8fr, 2fr, 1.2fr, 1.2fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 10) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-CC",
  "Completion Cost",
  "\u{2264}105% EC",
  "\u{2264}100% EC",
))\
=== Sviluppo
==== Codice
- *MPC-RSI - Requirements Stability Index*: indice di stabilità dei requisiti. Indica la percentuale di requisiti che sono stati modificati rispetto al totale dei requisiti. Un valore alto indica che i requisiti sono stabili e non soggetti a modifiche frequenti.\
- *MPC-TD - Technical Debt Ratio*: rapporto tra il tempo necessario per risolvere i problemi tecnici e il tempo necessario per sviluppare nuove funzionalità. Un valore basso indica che il
codice è ben strutturato e non presenta problemi tecnici.\

#figure(caption: [Valori per misurare la qualità dello sviluppo], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-RSI",
  "Requirements Stability Index",
  "\u{2265}80%",
  "100%",
  "MPC-TD",
  "Technical Debt Ratio",
  "\u{2264}15%",
  "\u{2264}5%",
))

==== Grafica 3D
Le seguenti metriche vengono applicate principalmente al #gloss[modello 3D] principale del giocatore, visto che gli altri modelli utilizzati sono semplicemente cubi o sfere:
- *MPC-MTC - Model Tris Count*: un modello 3D è costituito da un certo numero di triangoli e vertici. Ovviamente, maggiore è il numero di triangoli, più risorse sono richieste per il #gloss[rendering] di esso, rendendo inoltre più complicato successive modifiche. Un numero giusto (né troppo alto né troppo basso) è consigliato per garantire una buona qualità del modello ed evitare possibili complicazioni.\
- *MPC-MBC - Model Bones Count*: il movimento del modello tramite ossa è un processo che consuma risorse della CPU. Visto che la CPU rappresenta un potenziale #gloss[bottleneck] visto che è molto più lenta rispetto alla GPU, è necessario minimizzare il numero di ossa nell'armatura del modello. Il numero minimo dovrebbe essere: 12 per gli arti, mani e piedi + 4 per la spina dorsale + 16 per le ossa #gloss[IK].
- *MPC-UIC - UV Islands Count*: avere un numero minore di #gloss[UV Islands] permette una gestione della #gloss[texture] più semplice e prestazioni leggermente migliori, visto che i vertici ai bordi dell'isola UV vengono renderizzati due o più volte.\
- *MPC-UIS - UV Islands Space (in percentuale)*: percentuale della texture occupata e utilizzata dalle UV Islands. Uno spazio maggiore utilizza più pixel dell'immagine e garantisce una maggiore qualità.
#figure(caption: [Valori per misurare la qualità dello sviluppo], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-MVC",
  "Model Tris Count",
  "\u{2264}5.000",
  "\u{2264}3.000",
  "MPC-MBC",
  "Model Bones Count",
  "\u{2264}40",
  "\u{2264}32",
  "MPC-UIC","UV Islands Count","\u{2264}30","\u{2264}15", //22
  "MPC-UIS","UV Islands Space","\u{2265}80%","\u{2265}90%",
))

=== Documentazione
- *MPC-IG - Indice di Gulpease*: indica la complessità nella lettura di una frase o documento. Considera come variabili il numero di parole, di frasi e
di lettere.\
Formula dell'indice di Gulpease:
$ 89+((300*"numero di frasi") - (10*"numero di lettere")) / "numero di parole" $ <Gulpease>\
- *MPC-CO - Correttezza ortografica*: indica il numero di errori ortografici presenti nella documentazione.
#figure(caption: [Valori per misurare la qualità della documentazione], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-IG",
  "Indice di Gulpease",
  "\u{2265}40",
  "\u{2265}60",
  "MPC-CO",
  "Correttezza ortografica",
  "3",
  "0",
))
=== Verifica
- *MPC-CCO - Code coverage*: quantità di codice eseguito durante i test.\ Viene utilizzato per valutare la qualità dei test e garantire che il codice sia stato adeguatamente testato. Un alto livello indica che il codice è stato eseguito in molti contesti e scenari diversi con diverse parti di codice. In altre parole, indica quanto codice è stato sottoposto ai test.

- *MPC-TSP - Test superati in percentuale*: indica la proporzione di test automatizzati o manuali che sono stati eseguiti con successo rispetto al totale dei test previsti. Viene espressa come una percentuale e serve a misurare quanto dell'applicazione in fase di sviluppo è stato verificato con successo tramite i test. Una percentuale alta di test superati indica che il sistema è stabile e che la maggior parte delle funzionalità funzionano come previsto.\ In altre parole, indica quanti test sono stati superati.
#figure(caption: [Valori per misurare la qualità del processo di verifica], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-CCO",
  "Code coverage",
  "\u{2265}90%",
  "100%",
  "MPC-TSP",
  "Test superati in percentuale",
  "100%",
  "100%",
))

=== Gestione della qualità
- *MPC-SQM - Satisfaction of Quality Metrics*: misura la quantità di metriche soddisfatte. Questo valore viene calcolato come la somma delle metriche di qualità soddisfatte diviso il numero totale di metriche di qualità.
#figure(caption: [Valori per misurare la gestione della qualità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-SQM",
  "Satisfaction of Quality Metrics",
  "\u{2265}85%",
  "100%",
))


== Qualità del prodotto
=== Funzionalità
- *MPD-RO - Copertura requisiti obbligatori*: indica la percentuale di requisiti obbligatori coperti dal prodotto. Un valore del 100% indica che tutti i requisiti obbligatori sono stati implementati.

- *MPD-OP - Copertura requisiti opzionali*: indica la percentuale di requisiti opzionali coperti dal prodotto. Un valore del 100% indica che tutti i requisiti opzionali sono stati implementati.

#figure(caption: [Valori per misurare la qualità del prodotto in termini di funzionalità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPD-RO",
  "Copertura requisiti obbligatori",
  "100%",
  "100%",
  "MPD-OP",
  "Copertura requisiti opzionali",
  "\u{2265}50%",
  "100%",
))
=== Affidabilità
- *MPD-CC - Code coverage*: indica la percentuale di codice coperto dai test. Un valore alto indica che il codice è stato testato in modo approfondito e che è meno probabile che contenga errori.

#figure(caption: [Valori per misurare la qualità del prodotto in termini di affidabilità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPD-CC",
  "Code coverage",
  "\u{2265}80%",
  "100%",
))

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
  [#gloss[CPU]],[AMD® Ryzen 5 4500U],[#gloss[GPU]],[Integrata alla CPU],[#gloss[RAM]],[8GB DDR4],[#gloss[SSD] / #gloss[HDD]],[],[Sistema Operativo],[Pop_OS]
))\
In sintesi, la macchina su cui viene testato il gioco offre prestazioni sulla fascia media-bassa, quindi si ritiene che se il gioco offre delle buone prestazioni sulla macchina di testing, offrirà in media buone prestazioni su tutte le macchine con un sistema operativo supportato.

//=== Manutenibilità
// 
//=== Sicurezza
// 
=== Compatibilità
- *MPD-SOS - Supported Operative Systems*: numero di sistemi operativi supportati, si punta a supportare almeno Windows 11 e Ubuntu.
- *MPD-SL - Supported Languages*: numero di lingue supportate, si mira ad avere almeno 2 lingue supportate: italiano e inglese.

#figure(caption: [Valori per misurare la qualità del prodotto in termini di compatibilità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPD-SOS",
  "Supported Operative Systems",
  "\u{2265}2",
  "\u{2265}3",
  "MPD-SL",
  "Supported Languages",
  "\u{2265}2",
  "\u{2265}2",
))

= Metodologie di testing
== Tipologie di test
=== Test di unità
I test di unità sono utilizzati per verificare il corretto funzionamento delle singole unità del prodotto software, come ad esempio le funzioni o i metodi.\
I test di unità sono eseguiti durante lo sviluppo del prodotto, e sono utilizzati per identificare eventuali problemi o errori nelle singole unità del prodotto.\
//.......

= Cruscotto di valutazione delle metriche
== Grafica 3D
=== MPC-MTC - Model Tris Count
#align(figure(caption: [Modello 3D con statistiche sul numero di vertici, facce e triangoli], image("imgs/numero-triangoli.png", width: 90%)))
Dall'immagine si può vedere che il numero totale di triangoli del modello ammonta a 2.074. Ogni volta che il modello presentava forme simili a un cilindro, si è cercato di mantenere otto facce laterali.
=== MPC-MBC - Model Bones Count
#align(figure(caption: [Modello 3D con statistiche sul numero di ossa], image("imgs/numero-ossa.png", width: 85%)))
Dall'immagine si può vedere che il numero totale di ossa (ossa IK incluse) ammonta a 36. Sono state richieste più ossa per dare un effetto "curva" agli arti del modello.
Inoltre sono state aggiunte tre ossa per animare l'antenna sulla testa.
=== MPC-UIC - UV Islands Count
=== MPC-UIC - UV Islands Count

//= Automiglioramento
