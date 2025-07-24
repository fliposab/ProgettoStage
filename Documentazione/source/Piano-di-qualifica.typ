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
#show figure: set block(breakable: true)

= Introduzione
== Scopo del documento
Il presente documento ha lo scopo di definire le metriche di qualità che verranno utilizzate per valutare il prodotto software, e le modalità di verifica e validazione del prodotto.\

== Glossario
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni. I termini presenti nel glossario sono colorati di blu e seguiti da un'asterisco: #gloss[esempio].\
Il glossario è accessibile tramite il link:\ 
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")\
oppure consultando il rispettivo documento all'interno della stessa cartella.

== Specifiche macchina
Alcuni test e metriche di qualità sono eseguiti su una macchina con specifiche hardware e software definite nella tabella. Molto importante è specificare le componenti della macchina su cui viene testato il gioco, dato che macchine diverse offrono prestazioni diverse.
#figure(caption: [Componenti macchina 1], table(
  columns: (0.8fr, 2fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 10) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Componente*], [*Dettagli*]),
  [#gloss[CPU]],[AMD® Ryzen 5 4500U],[#gloss[GPU]],[AMD® Radeon Graphics (RADV RENOIR) - Integrata alla CPU],[#gloss[RAM]],[8GB DDR4],[Sistema Operativo],[Ubuntu 22.04]
))\
In sintesi, la macchina su cui viene testato il gioco offre prestazioni sulla fascia media-bassa, quindi si ritiene che se il gioco offre delle buone prestazioni sulla macchina di testing, offrirà in media buone prestazioni su tutte le macchine con un sistema operativo supportato.
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
=== Riferimenti tecnici
- GUT - Godot Unit Test:\
#link("https://github.com/bitwes/Gut")\
= Metriche di qualità
== Introduzione
Le metriche di qualità sono utilizzate per valutare la qualità del prodotto software, e per identificare eventuali problemi o aree di miglioramento.\

== Qualità di processo
La qualità di processo si riferisce alla qualità delle attività svolte durante lo sviluppo del prodotto software.\
Le metriche di qualità di processo sono utilizzate per valutare l'efficacia e l'efficienza delle attività svolte, e per identificare eventuali problemi o aree di miglioramento.\
=== Fornitura
Per il processo di fornitura, vengono indicate tutte le scelte operative fatte in fase di sviluppo. Viene usato l'acronimo MPC (Minimum Predictive Capability).\
In questo caso, il MPC è il valore minimo da raggiungere per essere considerato accettabile.
- *TAC (Time At Completion)*: tempo totale per la realizzazione del progetto in base a quanto deciso dal Piano di lavoro.
  - Il totale di ore previste ammonta a 304 ore.
- *MPC-CT - Completion Time*: tempo totale previsto per completare il progetto, idealmente non deve superare quello pianificato nel Piano di lavoro.
- *MPC-EC - Estimated at Completion*: numero di ore effettive stimate da svolgere per completare i compiti ancora da realizzare
- *EV - Earned Value*: valore ottenuto fino al momento calcolato.
  -  Il calcolo viene dato dal lavoro svolto in percentuale moltiplicato per EC.
- *PV - Planned Value*: attività lavorativa fino al momento calcolato
  - Il calcolo viene dato dal lavoro pianificato in percentuale moltiplicato per BAC.
- *AT - Actual Time*: tempo impiegato in ore fino al momento calcolato;
- *TV - Time Variance*: DIfferenza tra budget utilizzabile e quello usato effettivamente
  - Il calcolo viene dato da EV - AT.
- *SV - Schedule Variance*: varianza (a livello di anticipo/ritardo) rispetto a quanto previsto.
  - Il calcolo viene dato da EV - PV;
  - Se ha valore negativo, si è in ritardo rispetto alle previsioni.

#figure(caption: [Valori per misurare la qualità della fornitura], table(
  columns: (auto,auto,auto,auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 10) { horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-CT",
  "Completion Time",
  "\u{2264}105% EC",
  "\u{2264}100% EC",
  "MPC-EC",
  "Estimated at Completion",
  "\u{00B1}10% rispetto al tempo stimato nel piano di lavoro",
  "Tempo stimato nel piano di lavoro"

))\
=== Sviluppo
==== Codice
- *MPC-RSI - Requirements Stability Index*: indice di stabilità dei requisiti. Indica la percentuale di requisiti che sono stati modificati rispetto al totale dei requisiti. Un valore alto indica che i requisiti sono stabili e non soggetti a modifiche frequenti.\
- *MPC-TD - Technical Debt Ratio*: rapporto tra il tempo necessario per risolvere i problemi tecnici e il tempo necessario per sviluppare nuove funzionalità. Un valore basso indica che il codice è ben strutturato e non presenta problemi tecnici.\

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
Queste misurazioni verranno effettuate per i modelli del giocatore e dell'NPC, visto che sono i modelli più comuni e complessi.
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
  "MPC-UIS","UV Islands Space","\u{2265}40%","\u{2265}60%",
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
  "\u{2265}98%",
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
- *MPD-LS - Lag Spikes*: indica il numero di #gloss[lag spikes] che occorrono durante l'esecuzione del gioco. Non vengono contati durante un caricamento tra un livello e un altro.
#figure(caption: [Valori per misurare la qualità del prodotto in termini di efficienza], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPD-TF",
  "Target FPS",
  "\u{2265}30",
  "60",
  "MPD-LS",
  "Lag Spikes",
  "\u{2264}2 per minute",
  "0",
))

//=== Manutenibilità
// 
//=== Sicurezza
// 
=== Compatibilità
- *MPD-SOS - Supported Operative Systems*: numero di sistemi operativi supportati, si punta a supportare almeno Windows 11 e Linux.

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
))

= Metodologie di testing
Di seguito sono elencate le metodologie di testing che verranno utilizzate per verificare e validare il prodotto software. Le metodologie di testing sono suddivise in quattro categorie:
- *test di unità*: test che verificano il corretto funzionamento di singole unità del codice, questi test sono stati svolti con l'addon della community "GUT - Godot Unit Test";\
- *test di integrazione*: test che verificano il corretto funzionamento dell'interazione tra più unità del codice, sono svolti manualmente;\
- *test di sistema*: test che verificano il corretto funzionamento del sistema nel suo complesso, inclusi i requisiti funzionali e non funzionali, comprendono anche test sulle prestazioni, e sono svolti utilizzando gli strumenti forniti da Godot;\
- *test di accettazione*: test che verificano se il prodotto è pronto per essere rilasciato.

== Test di unità
#figure(caption: [Test di unità], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
  //Giocatore
  [TU-01],[Si verifica che il personaggio principale venga caricato],[],
  [],[Si verifica che il personaggio principale possa stare sopra una piattaforma],[],
  [TU-],[Si verifica che il personaggio principale possa muoversi con una determinata velocità],[],
  [TU-],[Si verifica che il personaggio principale possa saltare con una determinata velocità],[],
  //StateMachine
  [],[Si verifica che la macchina di stati cambi allo stato _Idle_ quando il personaggio non si muove sopra una piattaforma],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Idle_ quando il personaggio atterra],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Idle_ quando il personaggio smette di interagire con un'entità],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Air_ quando il personaggio principale salta],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Air_ quando il personaggio principale inizia a cadere],[],
  [],[Si verifica che la macchina di stati cambi allo stato _GroundMove_ quando il personaggio principale si muove],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Grab_ quando il personaggio principale prende un oggetto],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Release_ quando il personaggio principale lascia un oggetto],[],
  [],[Si verifica che la macchina di stati cambi allo stato _Interact_ quando il personaggio principale interagisce con un'entità],[],
  //Animazioni
  [],[Si verifica che il personaggio principale carichi l'animazione di _idle_ quando non si muove],[],
  [],[Si verifica che il personaggio principale carichi l'animazione di corsa quando viene premuto l'input],[],
  [],[Si verifica che il personaggio principale carichi l'animazione di caduta quando inizia a cadere],[],
  [],[Si verifica che il personaggio principale carichi l'animazione di salto quando salta],[],
  //NPC
  [],[Si verifichi che il personaggio non giocabile venga caricato correttamente],[],
  [],[Si verifica che l'NPC cambi animazione durante il dialogo],[],
  //LR
  [],[Si verifica che il grafico venga caricato nel livello],[],
  [],[Si verifica che il grafico venga caricato con la linea],[],
  [],[Si verifica che il grafico si aggiorni quando viene aggiunto o tolto un punto nel grafico],[],
  //Decision Tree
  [],[Si verifica che ogni cane vega caricato nel livello],[],
  [],[Si verifica che l'albero venga caricato nel livello],[],
  [],[Si verifica che l'NPC con il fischietto venga caricato nel livello],[],
  //Causality
  [],[],[],
  [],[Si verifica che gli NPC caricati con il livello già completato, si girino verso la gelateria],[],
  [],[],[],
))

== Test di integrazione
#figure(caption: [Test di integrazione], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
  //Generali
  //NPC
  [],[Si verifica che un NPC o un oggetto mostri il messaggio quando il giocatore si trova dentro l'area di interazione],[],
  [],[Si verifica che un NPC cambi animazione quando il giocatore entra dentro l'area di interazione],[],
  [],[Si verifica che un collezionabile venga preso dal giocatore quando si avvicina],[],
  [],[Si verifica che il dialogo di un NPC venga mostrato quando il giocatore preme il tasto dentro l'area di interazione],[],
  [],[Si verifica che il cartello mostri il contenuto quando un giocatore preme il tasto nell'area di interazione],[],
  //Pausa
  [],[Si verifica che il menu di pausa venga caricato],[],
  [],[Si verifica che il menu di pausa venga visualizzato quando viene premuto l'input],[],
  [],[Si verifica che il menu di pausa sia nascosto all'inizio],[],
  //Menu Principale
  //LR
  [],[Si verifica che il giocatore possa interagire con il cannone LR],[],
  [],[Si verifica che il cannone LR possa posizionare nuovi dati nel grafico a lui assegnato],[],
  [],[Si verifica che il grafico venga resettato al suo stato iniziale quando il giocatore preme il rispettivo tasto],[],//UT?
  [],[Si verifica che il giocatore possa smettere di interagire con il cannone LR],[],
  [],[Si verifica che il giocatore possa camminare sopra la linea del grafico],[],                                                      
  //DT
  [],[Si verifica che il giocatore possa prendere un oggetto in mano e trasportarlo],[],
  [],[Si verifica che il giocatore possa lasciare l'oggetto e farlo rimanere in quella posizione],[],
  //Causality
  [],[Si verifica che le unità esterne dei condizionatori si attivino in base all'array presente nel salvataggio],[],
  [],[Si verifica che la scena di intermezzo inizi quando tutte le unità dei condizionatori sono state attivate],[],
  [],[Si verifica che le porte degli appartamenti siano già aperte quando il livello "Causality" viene caricato con i condizionatori già accesi],[],
  [],[Si verifica che il dialogo ed il comportamento dell'NPC scienziato vengano cambiati quando il livello "Causality" viene caricato con i condizionatori già accesi],[],
  [],[Si verifica che il dialogo dell'NPC gelataio venga cambiato quando il livello "Causality" viene caricato con i condizionatori già accesi],[],
  [],[Si verifica che il grafico dei condizionatori in uso si aggiorni quando ne viene acceso uno],[],
  [],[Si verifica che alcuni NPC vengano caricati solo se il livello viene caricato con salvataggi già completati],[]))

== Test di sistema
#figure(caption: [Test di sistema], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
   "",
  "Si verifica che il gioco mantenga almeno 30fps durante l'esecuzione (caricamenti esclusi)",
  "\u{2713}",
  "","Si verifica che il tempo tra un frame e l'altro sia minore di 33.3 millisecondi durante l'esecuzione (caricamenti esclusi)",
  "",
  "","Si verifica che il tempo tra un frame di fisica e l'altro rimanga costante a 16.67 millisecondi durante l'esecuzione (caricamenti esclusi)","",
  "","Si verifica che l'uso della memoria video (VRAM) non superi 500MB durante tutta l'esecuzione","",
  "","Si verifica che l'uso della memoria statica non superi 200MB durante tutta l'esecuzione","",
  "","Si verifica che il tempo necessario alla CPU per caricare un frame sia minore di 2 millisecondi","",
  "","Si verifica che il tempo necessario alla GPU per caricare un frame sia inferiore a 33.3 millisecondi","",
  "","Si verifica che non siano presenti nodi non utilizzati nella scena","",))

== Test di accettazione
#figure(caption: [Test di accettazione], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
    [],[Si verifica che il gioco funzioni nel sistema operativo Linux],[],
  [],[Si verifica che il gioco funzioni nel sistema operativo Windows 11],[],))

= Cruscotto di valutazione delle metriche
== Forniture
=== MPC-CT
Inserire il grafico del tempo di lavoro durante le settimane.
#pagebreak()
== Codice
=== 
== Grafica 3D
=== MPC-MTC - Model Tris Count
#align(figure(caption: [Modello 3D del giocatore con statistiche sul numero di vertici, facce e triangoli], image("imgs/numero-triangoli.png", width: 90%)))
#align(figure(caption: [Modello 3D dell'NPC con statistiche sul numero di vertici, facce e triangoli], image("imgs/npc-triangles.png", width: 80%)))
Dall'immagine si può vedere che il numero totale di triangoli del modello ammonta a 2.074. Ogni volta che il modello presentava forme simili a un cilindro, si è cercato di mantenere otto facce laterali.
Il modello dell'NPC invece presenta un numero di triangoli leggermente superiore: 2.160, dovuto al fatto che che sono stati aggiunti accessori come il cappello ed il fischietto.\

=== MPC-MBC - Model Bones Count
#align(figure(caption: [Modello 3D del giocatore con statistiche sul numero di ossa], image("imgs/numero-ossa.png", width: 85%)))
Dall'immagine si può vedere che il numero totale di ossa (ossa IK incluse) ammonta a 36. Sono state richieste più ossa per dare un effetto "curva" agli arti del modello.
Inoltre sono state aggiunte tre ossa per animare l'antenna sulla testa.\
Sia giocatore che NPC hanno lo stesso numero di ossa, visto che sono stati creati con la stessa armatura e le stesse animazioni.
=== MPC-UIC - UV Islands Count
#figure(caption: [UV del modello del giocatore], image("imgs/uv-mapping.png", width: 80%))
#figure(caption: [UV del modello dell'NPC], image("imgs/uv-npc.png", width: 90%))
Dall'immagine è possibile vedere anche il numero di isole UV del giocatore (22) e dell'NPC (18 + 5 posizionate sopra altre isole UV). Inoltre, è possibile notare l'allungamento delle facce: in blu le facce con un basso allungamento, mentre in azzurro-verde quelle che via via sono allungate.

=== MPC-UIS - UV Islands Space
Sempre dall'immagine sopra si può vedere la disposizione delle isole UV in una possibile immagine quadrata. Lo spazio occupato dalle isole UV del giocatore è pari al 68%, mentre quello occupato dalle isole UV dell'NPC è pari al --%.\
Non offrendo la disponibilità di misurare lo spazio UV occupato nativamente in Blender, è stato utilizzato uno script di Python esterno.
//= Automiglioramento
