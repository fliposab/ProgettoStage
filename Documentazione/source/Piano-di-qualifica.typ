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
Il presente documento ha lo scopo di definire le metriche di qualità che verranno utilizzate per valutare la qualità del prodotto software, e le modalità di verifica e validazione del prodotto.\

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
- *MPC-TC (Time at Completion)*: tempo totale per la realizzazione del progetto in base a quanto deciso dal Piano di lavoro;
  - Il totale di ore previste ammonta a 304 ore;
- *MPC-EC - Estimated at Completion*: numero di ore effettive da svolgere per completare i compiti ancora da realizzare;
- *MPC-AT - Actual Time*: tempo impiegato in ore fino al momento calcolato;
- *MPC-PT - Planned Time*: ore settimanali pianificate da svolgere per completare il progetto;
- *MPC-TV - Time Variance*: differenza in percentuale tra il tempo utilizzabile e quello usato effettivamente;
  - Il calcolo viene dato da PT - AT.

#figure(caption: [Valori per misurare la qualità della fornitura], table(
  columns: (auto,auto,auto,auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 10) { horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-EC","Estimated at Completion","\u{2265}95% TC","TC",
  "MPC-AT","Actual Time","\u{2265}0","TC",
  "MPC-PT","Planned Time","24","40",
  "MPC-TV","Time Variance","\u{00B1}5%","0%",
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
Le seguenti metriche vengono applicate principalmente al modello 3D principale del giocatore, visto che gli altri modelli utilizzati sono semplicemente cubi o sfere:
- *MPC-MTC - Model Tris Count*: un modello 3D è costituito da un certo numero di triangoli e vertici. Ovviamente, maggiore è il numero di triangoli, più risorse sono richieste per il #gloss[rendering] di esso, rendendo inoltre più complicato successive modifiche. Un numero giusto (né troppo alto né troppo basso) è consigliato per garantire una buona qualità del modello ed evitare possibili complicazioni.\
- *MPC-MBC - Model Bones Count*: il movimento del modello tramite ossa è un processo che consuma risorse della CPU. Visto che la CPU rappresenta un potenziale #gloss[bottleneck] visto che è molto più lenta rispetto alla GPU, è necessario minimizzare il numero di ossa nell'armatura del modello. Il numero minimo dovrebbe essere: 12 per gli arti, mani e piedi + 4 per la spina dorsale + 16 per le ossa #gloss[IK].
- *MPC-UIC - UV Islands Count*: avere un numero minore di #gloss[UV Islands] permette una gestione della #gloss[texture] più semplice e prestazioni leggermente migliori, visto che i vertici ai bordi dell'isola UV vengono renderizzati due o più volte.\
- *MPC-UIS - UV Islands Space (in percentuale)*: percentuale della texture occupata e utilizzata dalle UV Islands. Uno spazio maggiore utilizza più pixel dell'immagine e garantisce una maggiore qualità.
Queste misurazioni verranno effettuate per il modello del giocatore visto che è il modello che viene caricato più spesso.
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
  "2",
  "0",
))
=== Verifica
/*- *MPC-CCO - Code coverage*: quantità di codice eseguito durante i test.\ Viene utilizzato per valutare la qualità dei test e garantire che il codice sia stato adeguatamente testato. Un alto livello indica che il codice è stato eseguito in molti contesti e scenari diversi con diverse parti di codice. In altre parole, indica quanto codice è stato sottoposto ai test.
*/
- *MPC-TSP - Test superati in percentuale*: indica la proporzione di test automatizzati o manuali che sono stati eseguiti con successo rispetto al totale dei test previsti. Viene espressa come una percentuale e serve a misurare quanto dell'applicazione in fase di sviluppo è stato verificato con successo tramite i test. Una percentuale alta di test superati indica che il sistema è stabile e che la maggior parte delle funzionalità funzionano come previsto.\
\
#figure(caption: [Valori per misurare la qualità del processo di verifica], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
//  "MPC-CCO",
//  "Code coverage",
//  "\u{2265}98%",
//  "100%",
  "MPC-TSP",
  "Test superati in percentuale",
  "100%",
  "100%",
))

=== Efficienza
- *MPC-TF - Target FPS*: indica gli #gloss[fps] obiettivo da mantenere durante l'esecuzione del gioco. 
- *MPC-LS - Lag Spikes*: indica il numero di #gloss[lag spikes] che occorrono durante l'esecuzione del gioco. Non vengono contati durante un caricamento tra un livello e un altro.
#figure(caption: [Valori per misurare la qualità del prodotto in termini di efficienza], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-TF",
  "Target FPS",
  "\u{2265}30",
  "60",
  "MPC-LS",
  "Lag Spikes",
  "\u{2264}2 per minute",
  "0",
))

=== Compatibilità
- *MPC-SOS - Supported Operative Systems*: numero di sistemi operativi supportati, si punta a supportare almeno Windows 11 e Linux.

#figure(caption: [Valori per misurare la qualità del prodotto in termini di compatibilità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-SOS",
  "Supported Operative Systems",
  "\u{2265}2",
  "\u{2265}3",
))

== Qualità del prodotto
Le seguenti metriche vengono usate per misurare la qualità del ciclo di vita del prodotto.\
=== Funzionalità
- *MPC-RO - Copertura requisiti obbligatori*: indica la percentuale di requisiti obbligatori coperti dal prodotto. Un valore del 100% indica che tutti i requisiti obbligatori sono stati implementati.

- *MPC-RD - Copertura requisiti desiderabili*: indica la percentuale di requisiti desiderabili coperti dal prodotto. Un valore del 100% indica che tutti i requisiti desiderabili sono stati implementati.

#figure(caption: [Valori per misurare la qualità del prodotto in termini di funzionalità], table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { left } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Metrica*], [*Nome*], [*Valore accettabile*], [*Valore ottimo*]),
  "MPC-RO",
  "Copertura requisiti obbligatori",
  "100%",
  "100%",
  "MPC-RD",
  "Copertura requisiti desiderabili",
  "\u{2265}50%",
  "100%",
))

//=== Manutenibilità
// 
//=== Sicurezza
// 


= Metodologie di testing
Di seguito sono elencate le metodologie di testing che verranno utilizzate per verificare e validare il prodotto software. Le metodologie di testing sono suddivise in quattro categorie:
- *test di unità*: test che verificano il corretto funzionamento di singole unità del codice, questi test sono stati svolti con l'add-on della community "GUT - Godot Unit Test";\
- *test di integrazione*: test che verificano il corretto funzionamento dell'interazione tra più unità del codice, anche questi svolti con l'add-on GUT;\
- *test di sistema*: test che verificano il corretto funzionamento del sistema nel suo complesso, inclusi i requisiti funzionali e non funzionali, comprendono anche test sulle prestazioni, e sono svolti utilizzando gli strumenti forniti da Godot;\
- *test di accettazione*: test che verificano se il prodotto è pronto per essere rilasciato.

== Test di unità
#figure(caption: [Test di unità], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
  //giocatore
  [TU-01],[Si verifica che il giocatore stia su una piattaforma con velocità pari a zero],[\u{2713}],
  [TU-02],[Si verifica che se il giocatore è fermo su una piattaforma, il suo stato nella macchina di stati è "Idle"],[\u{2713}],
  [TU-03],[Si verifica che quando il giocatore è fermo su una piattaforma, utilizza l'animazione "idle"],[\u{2713}],
  [TU-04],[Si verifica che la rotazione iniziale sull'asse y della telecamera è la stessa del giocatore],[\u{2713}],
  [TU-05],[Si verifica che la telecamera ruoti intorno al giocatore quando viene premuto il rispettivo tasto],[\u{2713}],
  [TU-06],[Si verifica che il giocatore si muovi ad una determinata velocità quando viene premuto il rispettivo tasto],[\u{2713}],
  [TU-07],[Si verifica che se il giocatore si muove su una piattaforma, il suo stato nella macchina di stati è "GroundMove"],[\u{2713}],
  [TU-08],[Si verifica che quando il giocatore si muove su una piattaforma, utilizza l'animazione della corsa],[\u{2713}],
  [TU-09],[Si verifica che quando il giocatore si muove, la telecamera ruota automaticamente],[\u{2713}],
  [TU-10],[Si verifica che quando il giocatore salti quando viene premuto il rispettivo tasto],[\u{2713}],
  [TU-11],[Si verifica che quando il giocatore salta, lo stato nella macchina di stati cambia a "Air"],[\u{2713}],
  [TU-12],[Si verifica che quando il giocatore salta utilizza l'animazione del salto],[\u{2713}],
  [TU-13],[Si verifica che quando il giocatore cade da una piattaforma, con velocità verticale negativa, lo stato nella macchina di stati sia "Air"],[\u{2713}],
  [TU-14],[Si verifica che quando il giocatore cade da una piattaforma, con velocità verticale negativa, utilizzi l'animazione della caduta],[\u{2713}],
  //Pausa
  [TU-15],[Si verifica che il menu di pausa venga visualizzato quando viene premuto il rispettivo tasto],[\u{2713}],
  [TU-16],[Si verifica che quando viene aperto il menu di pausa, l'applicazione viene messa in pausa],[\u{2713}],
  [TU-17],[Si verifica che quando viene premuto il tasto "riprendi", il menu di pausa viene nascosto e viene ripresa l'esecuzione],[\u{2713}],
  [TU-18],[Si verifica che quando viene premuto lo stesso tasto quando il menu di pausa è aperto, questo viene nascosto e viene ripresa l'esecuzione],[\u{2713}],
  [TU-19],[Si verifica che quando viene premuto il tasto delle opzioni, venga aperto il menu di opzioni],[\u{2713}],
  [TU-20],[Si verifica che quando viene premuto il tasto "Ritorna alla hub", il giocatore viene riportato al livello Hub],[\u{2713}],
  [TU-21],[Si verifica che quando viene premuto il tasto del menu principale, il giocatore viene riportato al menu principale],[\u{2713}],
  [TU-22],[Si verifica che il gioco venga chiuso quando viene premuto il bottone "Esci dal gioco"],[\u{2713}],
  //Opzioni
  [TU-23],[Si verifica che viene cambiata la modalità della finestra quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-24],[Si verifica che viene cambiata la risoluzione della finestra quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-25],[Si verifica che viene cambiata la scala di risoluzione quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-26],[Si verifica che viene cambiato il valore del volume quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-27],[Si verifica che viene cambiato il valore massimo degli FPS quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-28],[Si verifica che viene cambiato il metodo di Anti Aliasing quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-29],[Si verifica che viene cambiata la qualità/risoluzione delle ombre quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-30],[Si verifica che viene cambiata la lingua del gioco quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  [TU-31],[Si verifica che vengano salvati i nuovi valori delle opzioni quando viene premuto il rispettivo bottone nel menu opzioni],[\u{2713}],
  //Menu principale
  [TU-32],[Si verifica che venga caricato il gioco con i salvataggi esistenti quando viene premuto il bottone "Carica partita"],[\u{2713}],
  [TU-33],[Si verifica che venga caricata una nuova partita, cancellando i dati di salvataggio esistenti, quando viene premuto il bottone "Nuova partita"],[\u{2713}],
  //NPC
  [TU-34],[Si verifica che il messaggio del personaggio non giocabile venga nascosto quando il giocatore non è vicino],[\u{2713}],
  [TU-35],[Si verifica che il personaggio non giocabile, sia con dialogo che senza dialogo, usi l'animazione "idle" quando il giocatore non è vicino],[\u{2713}],
  //LR
  [TU-36],[Si verifica che il grafico orizzontale venga caricato con la giusta rotazione],[\u{2713}],
  [TU-37],[Si verifica che la linea del grafico orizzontale cambi correttamente con l'aggiunta di un punto],[\u{2713}],
  [TU-38],[Si verifica che il grafico verticale venga caricato con la giusta rotazione],[\u{2713}],
  [TU-39],[Si verifica che la linea del grafico verticale cambi correttamente con l'aggiunta di un punto],[\u{2713}],
  [TU-40],[Si verifica che il grafico possa eliminare i punti aggiunti, resettando la linea],[\u{2713}],  
  //Decision Tree
  [TU-41],[Si verifica che un cane possa ritornare alla sua posizione iniziale],[\u{2713}],
  //Causality
  [TU-42],[Si verifica che l'NPC che esce dall'appartamento corra verso l'obiettivo],[\u{2713}],
  [TU-43],[Si verifica che l'applicazione rilevi un cambio di dispositivo di Input],[\u{2713}],
  [TU-44],[Si verifica che l'applicazione mostri i rispettivi input del dispositivo che si sta usando nella UI],[\u{2713}],
))

== Test di integrazione
#figure(caption: [Test di integrazione], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
  //NPC
  [TI-01],[Si verifica che il personaggio non giocabile mostri il messaggio quando il giocatore si avvicina],[\u{2713}],
  [TI-02],[Si verifica che il personaggio non giocabile senza dialogo usi l'animazione per parlare quando il giocatore is avvicina],[\u{2713}],
  [TI-03],[Si verifica che il personaggio non giocabile con il dialogo usi l'animazione per salutare quando il giocatore is avvicina],[\u{2713}],
  [TI-04],[Si verifica che quando il giocatore preme il rispettivo input vicino ad un'entità con cui può interagire, lo stato nella macchina di stati passi a "Interact"],[\u{2713}],
  [TI-05],[Si verifica che quando il giocatore preme il rispettivo input vicino a un cartello, ne visualizzi i contenuti],[\u{2713}],
  [TI-06],[Si verifica che quando il giocatore preme lo stesso input durante un'interazione, smette di interagire con l'entità],[\u{2713}],
  [TI-07],[Si verifica che quando il giocatore preme il rispettivo input vicino a un personaggio con un dialogo, il giocatore si ferma e visualizza il dialogo del personaggio],[\u{2713}],
  [TI-08],[Si verifica che quando il giocatore preme il rispettivo input durante un dialogo, va avanti se esiste un messaggio successivo],[\u{2713}],
  [TI-09],[Si verifica che quando il giocatore preme il rispettivo input durante un dialogo, finisce se non esiste un messaggio successivo],[\u{2713}],
  [TI-10],[Si verifica che quando il giocatore preme il rispettivo input durante la scelta di un'opzione del dialogo, questa viene scelta ed il dialogo procede con il prossimo messaggio],[\u{2713}],
  [TI-11],[Si verifica che quando il giocatore smette di interagire con un'entità, lo stato nella macchina di stati del giocatore torna a "Idle"],[\u{2713}],
  //LR  
  [TI-12],[Si verifica che il prompt dell'input da premere appaia quando il giocatore si posiziona sopra la piattaforma del cannone LR],[\u{2713}],
  [TI-13],[Si verifica che il giocatore interagisca con il cannone LR quando preme il rispettivo tasto sopra la piattaforma],[\u{2713}],
  [TI-14],[Si verifica che il giocatore possa posizionare un punto sul grafico LR],[\u{2713}], 
  [TI-15],[Si verifica che il giocatore possa interrompere l'interazione con il cannone LR],[\u{2713}],                                              
  //DT
  [TI-16],[Si verifica che quando il giocatore si avvicina ad un oggetto che può raccogliere, viene mostrato sullo schermo il tasto da premere],[\u{2713}],
  [TI-17],[Si verifica che quando il giocatore raccoglie un oggetto, lo stato nella macchina di stati passi a "Grab"],[\u{2713}],
  [TI-18],[Si verifica che l'oggetto raccolto sia lo stesso che il giocatore sta portando],[\u{2713}],
  [TI-19],[Si verifica che il giocatore possa muoversi con l'oggetto],[\u{2713}],
  [TI-20],[Si verifica che il giocatore possa saltare con l'oggetto],[\u{2713}],
  [TI-21],[Si verifica che il giocatore può lasciare l'oggetto],[\u{2713}],
  [TI-22],[Si verifica che quando il giocatore lascia un oggetto, lo stato nella macchina di stati passi a "Release"],[\u{2713}],
  [TI-23],[Si verifica che l'oggetto rimanga nella posizione dove è stato lasciato],[\u{2713}],
  [TI-24],[Si verifica che le informazioni dei rami vengano visualizzate quando il giocatore si posiziona sopra un nodo dell'albero di decisione],[\u{2713}],
  [TI-25],[Si verifica che il nodo riconosca se il cane posizionato sopra è corretto],[\u{2713}],
  [TI-26],[Si verifica che il nodo riconosca se il cane posizionato sopra è sbagliato],[\u{2713}],
  [TI-27],[Si verifica che il cartello con le razze di cani indovinate si aggiorni quando il giocatore dà una risposta corretta],[\u{2713}],
  //Causality
  [TI-28],[Si verifica che un'unità esterna di un condizionatore venga accesa quando il giocatore preme il rispettivo input quando è vicino],[\u{2713}],
  [TI-29],[Si verifica che il grafico dei condizionatori usati venga aggiornato all'inizio del livello],[\u{2713}],
  [TI-30],[Si verifica che il grafico dei condizionatori usati venga aggiornato quando viene acceso un condizionatore],[\u{2713}],
  [TI-31],[Si verifica che la scena di intermezzo inizi quando il giocatore accende tutti i condizionatori nel livello "Causalità"],[\u{2713}],
  [TI-32],[Si verifica che i personaggi non giocabili che seguono un obiettivo, smettano di seguirlo quando entrano in una specifica area],[\u{2713}],
  [TI-33],[Si verifica che il personaggio "scienziato" cambi dialogo quando vengono accese tutti i condizionatori nel livello "Causalità"],[\u{2713}],
  [TI-34],[Si verifica che il personaggio "gelataio" cambi dialogo quando vengono accesi tutti i condizionatori nel livello "Causalità"],[\u{2713}],
  //Forgot
  [TI-35],[Si verifica che quando il giocatore si avvicina ad un "Training data" di colore rosso, questo viene preso ed aumenta il rispettivo contatore],[\u{2713}],
  [TI-36],[Si verifica che quando il giocatore si avvicina ad un "Training data" di colore verde, questo viene preso ed aumenta il rispettivo contatore],[\u{2713}],
  [TI-37],[Si verifica che quando il giocatore si avvicina ad un "Training data" di colore blu, questo viene preso ed aumenta il rispettivo contatore],[\u{2713}],
  [TI-38],[Si verifica che quando il giocatore cade dal livello, torna in una zona dove si trovava precedentemente],[\u{2713}],
  //Salvataggi
  /*
  [TI-],[Si verifica che il valore di training data rossi collezionati dal giocatore venga salvato ogni volta che il valore si aggiorna],[],
  [TI-],[Si verifica che il valore di training data verdi collezionati dal giocatore venga salvato ogni volta che il valore si aggiorna],[],
  [TI-],[Si verifica che il valore di training data blu collezionati dal giocatore venga salvato ogni volta che il valore si aggiorna],[],*/
  ))

== Test di sistema
#figure(caption: [Test di sistema], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
  "TS-01","Si verifica che il gioco ricevi input dalla tastiera","\u{2713}",
  "TS-02","Si verifica che il gioco riceva input da un joystick generico","",
  "TS-03","Si verifica che il gioco mantenga almeno 30fps durante l'esecuzione (caricamenti esclusi)",
  "\u{2713}",
  "TS-04","Si verifica che il tempo tra un frame e l'altro sia minore di 33.3 millisecondi durante l'esecuzione (caricamenti esclusi)",
  "\u{2713}",
  "TS-05","Si verifica che il tempo tra un frame di fisica e l'altro rimanga costante a 16.67 millisecondi durante l'esecuzione (caricamenti esclusi)","\u{2713}",
  "TS-06","Si verifica che l'uso della memoria video (VRAM) non superi 500MB durante tutta l'esecuzione","\u{2713}",
  "TS-07","Si verifica che l'uso della memoria statica non superi 200MB durante tutta l'esecuzione","\u{2713}",
  "TS-08","Si verifica che il tempo necessario alla CPU per caricare un frame sia minore di 2 millisecondi","\u{2713}",
  "TS-09","Si verifica che il tempo necessario alla GPU per caricare un frame sia inferiore a 33.3 millisecondi","\u{2713}",
  "TS-10","Si verifica che non siano presenti nodi non utilizzati nella scena","\u{2713}",))

== Test di accettazione
#figure(caption: [Test di accettazione], table(
  columns: (0.4fr, 1fr, 0.3fr),
  inset: 8pt,
  align: (x, y) => if (x == 0 and y > 0 and y < 7) { center + horizon } else { center + horizon },
  fill: (x, y) => if (y == 0) { luma(230) },
  table.header([*Identificativo*], [*Descrizione*], [*Superato*]),
    [TA-01],[Si verifica che il gioco funzioni nel sistema operativo Linux],[\u{2713}],
    [TA-02],[Si verifica che il gioco funzioni nel sistema operativo Windows 11],[\u{2713}],
    [TA-03],[Si verifica che il gioco rilevi input da tastiera],[\u{2713}],[TA-04],[Si verifica che il giocatore possa muoversi in uno spazio tridimensionale],[\u{2713}],
))
    
= Tracciamento delle attività
== Fornitura
=== MPC-AT / MPC-EC
#figure(caption: [Grafico rappresentante l'andamento di AT e EC], image("imgs/chart-at_ec.png", width: auto))
Dal grafico si può notare che l'andamento delle ore impiegate è costante ed è intorno a 40 ore per periodo. L'unica eccezione sono stati i periodi 2 e 4 dove sono state perse rispettivamente 4 ore a causa di impegni universitari.\
EC è stato ottenuto calcolando la differenza tra il TC e AT.
=== MPC-PT
#figure(caption: [Grafico rappresentante l'andamento di PT], image("imgs/chart-pt.png", width: auto))
Il grafico raffigura l'andamento pianificato delle ore, messo a confronto con le ore effettivamente impiegate.
Qui è più facile notare la differenza tra le due metriche.
=== MPC-TV
#figure(caption: [Grafico rappresentante l'andamento di TV], image("imgs/chart-tv.png", width: auto))
Il grafico rappresenta l'andamenti di TV in percentuale.\
Si può notare che il valore sale nel secondo e quarto periodo a causa di impegni universitari.
== Sviluppo
=== MPC-RSI
#figure(caption: [Grafico rappresentante l'andamento di RSI], image("imgs/chart-rsi.png", width: auto))
Il grafico mostra l'andamento dell'indice di stabilità dei requisiti.Ovviamente, il valore è molto basso durante l'inizio dello stage. Il valore tende a stabilizzarsi dopo il quarto periodo, in quanto è stato sviluppato un PoC, ed era necessario avere dei requisiti stabili da soddisfare.
=== MPC-TD
#figure(caption: [Grafico rappresentante l'andamento di TD], image("imgs/chart-td.png", width: auto))
Il grafico mostra l'andamento del "Technical Debt". Il valore si presenta basso durante l'inizio e fine progetto, in quanto a inizio progetto, non vi erano ancora funzionalità da modificare, mentre verso la fine, le modifiche erano già state effettuate precedentemente.
Si può vedere un picco a metà, dato che subito dopo aver sviluppato il PoC, è stato necessario modificare molte funzionalità per migliorare l'architettura o renderle compatibili con le nuove funzionalità che venivano aggiunte.
== Grafica 3D
=== MPC-MTC
#align(figure(caption: [Modello 3D del giocatore con statistiche sul numero di vertici, facce e triangoli], image("imgs/numero-triangoli.png", width: 90%)))
Dall'immagine si può vedere che il numero totale di triangoli del modello ammonta a 2.074. Ogni volta che il modello presentava forme simili a un cilindro, si è cercato di mantenere otto facce laterali.

=== MPC-MBC
#align(figure(caption: [Modello 3D del giocatore con statistiche sul numero di ossa], image("imgs/numero-ossa.png", width: 85%)))
Dall'immagine si può vedere che il numero totale di ossa (ossa IK incluse) ammonta a 36. Sono state richieste più ossa per dare un effetto "curva" agli arti del modello.
Inoltre sono state aggiunte tre ossa per animare l'antenna sulla testa.\
Sia giocatore che NPC hanno lo stesso numero di ossa, visto che sono stati creati con la stessa armatura e le stesse animazioni.
=== MPC-UIC
#figure(caption: [UV del modello del giocatore], image("imgs/uv-mapping.png", width: 80%))
Dall'immagine è possibile vedere anche il numero di isole UV del giocatore (22). Inoltre, è possibile notare l'allungamento delle facce: in blu le facce con un basso allungamento, mentre in azzurro-verde quelle che via via sono allungate.

=== MPC-UIS
Sempre dall'immagine sopra si può vedere la disposizione delle isole UV in una possibile immagine quadrata. Lo spazio occupato dalle isole UV del giocatore è pari al 68%.\
Non offrendo la disponibilità di misurare lo spazio UV occupato nativamente in Blender, è stato utilizzato uno script di Python esterno.
== Documentazione
=== MPC-IG
Di seguito vengono elencati i documenti con i loro rispettivi indici di Gulpease:
- *Analisi dei requisiti*:
- *Norme di progetto*:
- *Manuale utente*:
- *Piano di qualifica*:
- *Piano di progetto*:
- *Specifica tecnica*:
=== MPC-CO
#figure(caption: [Grafico rappresentante l'andamento di CO], image("imgs/chart-co.png", width: auto))
Il grafico mostra gli errori ortografici non corretti nel periodo in cui sono stati stesi. Molti errori ortografici sono stati fatti durante la fase iniziale e finale, dove l'attività di stesura dei documenti era prevalente.
== Test e verifica
=== MPC-TSP
#figure(caption: [Grafico rappresentante l'andamento di TSP], image("imgs/chart-tsp.png", width: auto))
Dal grafico si può vedere il numero di test eseguiti e superati per ogni periodo. La maggior parte di test è stata eseguita verso il periodo 6 e 7 e infatti si può vedere un salita rapida in quella zona.
== Efficienza
=== MPC-TF
#figure(caption: [Grafico rappresentante l'andamento dei fotogrammi al secondo], image("imgs/chart-fps.png", width: auto))
La misurazione dei fotogrammi al secondo è stat eseguita all'interno di Godot. Il grafico mostra il valore per ogni secondo di gioco.
Si possono notare 2 cose:
- il valore non supera 60, in quanto non può superare il valore della frequenza di aggiornamento dello schermo;
- sono presenti alcune depressioni, durante questo periodo il gioco stava caricando un altro livello ed è l'unico momento accettabile che si possono avere delle perdite.
=== MPC-LS
#figure(caption: [Grafico rappresentante l'andamento del tempo necessario per processare un frame], image("imgs/chart-lag_spikes.png", width: auto))
Il grafico dell'immagine è stato preso all'interno dell'editor Godot.
Nel grafico vengono mostrati i tempi per processare un fotogramma dalla CPU (a sinistra) e dalla GPU (a destra).\
Si può vedere che le informazioni date sono simili al grafico mostrato sopra, l'andamento è diverso visto che i dati sono stati presi in due sessioni separate.\
Si possono notare dei picchi dovuti al caricamento dei livelli, tuttavia come detto precedentemente, questo è l'unico periodo dove questi picchi sono concessi.
== Compatibilità
=== MPC-SOS
Il numero finale di sistemi operativi supportati dal gioco è 2:
- Windows 11;
- Linux.
== Qualità del prodotto

=== MPC-RO / MPC-RD
#figure(caption: [Grafico rappresentante l'andamento di RO e RD], image("imgs/chart-ro_rd.png", width: auto))
Il grafico mostra i requisiti soddisfatti totali per ogni periodo, divisi tra obbligatori e desiderabili.\
Si nota che l'andamento è piuttosto costante, con i requisiti obbligatori soddisfatti prima in quanto avevano priorità più alta.
