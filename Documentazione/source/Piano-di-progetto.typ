#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Piano di progetto",
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
Il seguente documento ha come scopo quello di definire le attività svolte durante lo sviluppo del progetto. Nello specifico definisce:\
- pianificazione dello svolgimento delle attività;
- valutazione dello stato di avanzamento del progetto;
- stima del tempo necessario per completare le attività;
- gestione dei rischi;

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
- Piano di lavoro:\
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Piano-di-lavoro.pdf")\

= Analisi dei rischi
Questa sezione del documento ha lo scopo di identificare i rischi associati al progetto, il loro impatto e definire le strategie per la loro gestione.\
I rischi sono suddivisi nelle seguenti categorie:
- *rischi organizzativi*: rischi legati alla gestione del progetto, alla pianificazione delle attività, con un'errata stima dei tempi;
- *rischi tecnici*:
  rischi legati alla tecnologia utilizzata, alla complessità del progetto, alla mancanza di competenze tecniche;
- *rischi di analisi e progettazione*:
  rischi legati alla comprensione dei requisiti, alla progettazione dell'architettura e alla definizione delle specifiche tecniche;

  Secondo lo standard ISO/IEC 31000:2009, la gestione dei rischi si articola in cinque fasi chiave:
  1. *identificazione dei rischi*: identificare i rischi che potrebbero influenzare il progetto, le aree di impatto,e le cause dei rischi che potrebbero influenzare l'esito del progetto;
  2. *analisi dei rischi*: valutare la probabilità di accadimento e l'impatto dei rischi identificati;
  3. *valutazione dei rischi*: stabilire le priorità per la gestione dei rischi;
  4. *trattamento dei rischi*: definire le strategie per mitigare i rischi identificati;
  5. *monitoraggio e revisione dei rischi*: monitorare l'andamento dei rischi e rivedere le strategie di gestione dei rischi in base all'evoluzione del progetto.

== Rischi organizzativi
=== Errata pianificazione dei tempi
- *Descrizione*:\
  Un'errata pianificazione dei tempi può portare a ritardi nello sviluppo del progetto, con conseguente rischio di non rispettare le scadenze stabilite.
- *Probabilità*:\
  Alta
- *Pericolosità*:\
  Alta
- *Rilevamento*:\
  Monitoraggio delle attività pianificate e dei tempi di esecuzione ogni settimana.
- *Piano di contingenza*:\
  Controllare le attività svolte tramite uno strumento di gestione del progetto (ad esempio Diagrammi di Gannt e uso di checklist su #gloss[Notion]) e rivedere la pianificazione delle attività in caso di ritardi.\
//- *Aggiornamento*:\
=== Impegni personali o universitari
- *Descrizione*:\
  Impegni personali o universitari possono influenzare  il tempo a disposizione per lo sviluppo del progetto, causando ritardi o interruzioni nello sviluppo.
- *Probabilità*:\
  Media
- *Pericolosità*:\
  Media
- *Rilevamento*:\
  Monitoraggio delle attività pianificate e dei tempi di esecuzione ogni settimana.
- *Piano di contingenza*:\
  Pianificare le attività in modo da tenere conto degli impegni personali o universitari, e rivedere la pianificazione delle attività in caso di imprevisti.\

== Rischi tecnici
=== Mancanza di competenze tecniche
- *Descrizione*:\
  La mancanza di competenze tecniche può influenzare la qualità del prodotto software, causando ritardi nello sviluppo e problemi di integrazione.
- *Probabilità*:\
  Media
- *Pericolosità*:\
  Alta
- *Rilevamento*:\
  Monitoraggio delle attività svolte e dei tempi di esecuzione ogni settimana, valutazione delle competenze tecniche.
- *Piano di contingenza*:\
  Formazione sulle tecnologie utilizzate e revisione della progettazione in caso di problemi tecnici.\

=== Tecnologie non adeguate
- *Descrizione*:\
  L'uso di tecnologie non adeguate può influenzare la qualità del prodotto software, causando problemi di prestazioni basse o #gloss[bug] grafici.
- *Probabilità*:\
  Alta
- *Pericolosità*:\
  Alta
- *Rilevamento*:\
  Monitoraggio delle attività svolte e dei tempi di esecuzione ogni settimana.
- *Piano di contingenza*:\
  Valutazione delle tecnologie utilizzate e revisione della progettazione in caso di problemi tecnici.
  In caso di problemi con le tecnologie utilizzate, si valuterà la possibilità di modificare la progettazione del gioco per adattarsi alle tecnologie disponibili.
== Rischi di analisi e progettazione
=== Cambio dei requisiti
- *Descrizione*:\
  Un cambiamento dei requisiti può influenzare la progettazione del sistema, causando ritardi nello sviluppo.
- *Probabilità*:\
    Bassa
- *Pericolosità*:\
  Alta
- *Rilevamento*:\
  Comunicazione frequente con il relatore del progetto per garantire che i requisiti siano chiari e stabili.
- *Piano di contingenza*:\
  Rivedere la progettazione del sistema in caso di cambiamenti dei requisiti, e valutare l'impatto sui tempi di sviluppo.
  In caso di cambiamenti significativi dei requisiti, si valuterà la possibilità di modificare la pianificazione delle attività per tenere conto dei nuovi requisiti.

=== Errore nella progettazione dell'architettura
- *Descrizione*:\
  Un errore nella progettazione dell'architettura può creare imprevisti ed un aumento dei tempi richiesti per lo sviluppo del sistema, causando ritardi nello sviluppo.
- *Probabilità*:\
  Media
- *Pericolosità*:\
  Alta
- *Rilevamento*:\
  Monitoraggio delle attività svolte e dei tempi di esecuzione ogni settimana, valutazione della progettazione dell'architettura.
- *Piano di contingenza*:\
  Rivedere la progettazione dell'architettura in caso di problemi, e valutare l'impatto sui tempi di sviluppo.

= Pianificazione del lavoro
== Organizzazione dei periodi
Il periodo di progetto è suddiviso in otto settimane, durante le quali verranno svolte le attività di sviluppo del software. Ad ogni inzio settimana, vengono analizzate le attività pianificate e si verifica lo stato di avanzamento del progetto.\
Le ore settimanali sono suddivise nel seguente modo:
#figure(caption: "Ore settimanali", table(
    columns: (0.3fr,0.3fr,0.3fr),
    table.header([*Settimana*], [*Intervallo*],[*Ore*]),
    fill: (x, y) => if y == 0 { luma(180) } else if (y == 2 or y == 4 or y == 6 or y == 8) { luma(230) },
    [1],[18/06 - 20/06],[24],
    [2],[23/06 - 27/06],[40],
    [3],[30/06 - 04/07],[40],
    [4],[07/07 - 11/07],[40],
    [5],[14/07 - 18/07],[40],
    [6],[21/07 - 25/07],[40],
    [7],[28/07 - 01/08],[40],
    [8],[04/08 - 08/08],[40]
    ),
)
=== Attività settimanali
Di seguito sono descritte le attività pianificate per ogni settimana del progetto.

- *Settimana 1 - 24 ore*:
  - Incontro con il personale dell'azienda per discutere i requisiti dell'applicazione da sviluppare;
  - Verifica credenziali e strumenti di lavoro assegnati;
  - Pianificazione e progettazione dell'applicazione;
  - Inizio sviluppo.
- *Settimana 2 - 40 ore*:
  - Approfondimento su Linear Descent;
  - Sviluppo degli oggetti principali del primo livello, implementando Linear Descent.
- *Settimana 3 - 40 ore*:
  - Sviluppo del primo livello, sul tema Linear Descent, con gli oggetti creati nella settimana precedente;
- *Settimana 4 - 40 ore*:
  - Approfondimento sul tema Causality;
  - Sviluppo degli oggetti principali del secondo livello;
- *Settimana 5 - 40 ore*:
  - Sviluppo del secondo livello, sul tema Causality, implementando gli oggetti creati nella settimana precedente.
- *Settimana 6 - 40 ore*:
  - Approfondimento sull'argomento Random Forest;
  - Sviluppo degli oggetti principali del terzo livello.
- *Settimana 7 - 40 ore*:
  - Sviluppo del terzo livello, sul tema Random Forest, implementando gli oggetti creati nella settimana precedente.
- *Settimana 8 - 40 ore*: 
  - Collaudo Finale;
  - Compilazione del gioco in un eseguibile.

== Organizzazione delle attività
Nella seguente tabella vengono riportate le ore totali del progetto, suddivise in base alle attività svolte.

#show figure: set block(breakable: true)
#figure(
  caption: [Ore totali del progetto],
  table(
    columns: (0.5fr, 2fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*Durata (ore)*], [*Descrizione attività*]),
    [*24*],
    [Pianificazione struttura applicazione #linebreak() 
    Pianificazione stuttura livelli #linebreak()
    Pianificazione implementazione meccaniche di gioco],
    [*63*],[*Stesura della documentazione*],
    table.hline(stroke: (dash: "dashed")),
    [24],[Stesura documentazione relativa ad analisi e progettazione],
    table.hline(stroke: none),
    [16],[Stesura delle metriche di qualità],
    table.hline(stroke: none),
    [15],[Stesura delle norme e piano di progetto],
    table.hline(stroke: none),
    [8],[Stesura del Manuale Utente],
    [*177*],
    [*Sviluppo dei livelli*],
    table.hline(stroke: (dash: "dashed")),
    [59],
    [Sviluppo primo livello],
    table.hline(stroke: none),
    [59],
    [Sviluppo secondo livello],
    table.hline(stroke: none),
    [59],
    [Sviluppo terzo livello],
    [*40*],
    [Test e verifica dell'applicazione],
    table.cell([Totale ore: *304*], colspan: 2),
  ),
)
= Periodi di sviluppo
== Settimana 1 | 18/06 - 20/06
#pseudoheading[*Retropsettiva*]
Durante la prima settimana, lo studente ha familiarizzato con il nuovo ambiente ed il tutor aziendale insieme al personale.\
Sono stati individuati i requisiti e use cases principali, calcolo dei rischi e dei tempi, con prima stesura dei documenti e inizio dello sviluppo.
#pseudoheading[*Attività svolte*]
  - Incontro con il personale dell'azienda ed il tutor aziendale;
  - discussione sui requisiti;
  - verifica credenziali e strumenti di lavoro assegnati;
  - pianificazione e progettazione dell'applicazione;
  - prima stesura dei documenti;
  - sviluppo del livello per il testing, questo comprende:
    - giocatore: con la possibiltà di muoversi in 4 direzioni e saltare;
    - #gloss[collezionabili]: chiamati _training data_, vengono collezionati non appena il giocatore si avvicina;
    - menu di pausa: disponibile quando il giocatore preme il rispettivo tasto;
- opzioni: dove il giocatore può cambiare le impostazioni grafiche e la lingua;
- schermata principale: da dove il giocatore può iniziare il gioco.
#figure( caption: "Livello per testing (settimana 1)", image("imgs/settimana-1.png", width: 85%))
== Settimana 2 | 23/06 - 27/06
#pseudoheading[*Retropsettiva*]
Durante la seconda settimana, sono state sviluppate le principali meccaniche del gioco, tra cui implementazione della Linear Regression e raccolta di oggetti, individuati altri use cases e aggiornato il Piano di qualifica.
#pseudoheading[*Attività svolte*]
- Creazione del modello 3D del giocatore;
- implementazione delle meccaniche principali:
  - Ponte tramite Linear Regression;
  - Raccolta e rilascio di un oggetto;
  - Decision Tree con controllo se il piazzamento dell'oggetto è nella categoria giusta;
- individuati altri use case;
- aggiornato il piano di qualfica con nuove metriche e aggiunto il cruscotto;
- continua stesura degli altri documenti.
#figure( caption: "Ponte Linear Regression + modello 3D del giocatore (settimana 2)", image("imgs/settimana-2.png", width: auto))
#pagebreak()
== Settimana 3 | 30/06 - 04/07
#pseudoheading[*Retropsettiva*]
Durante la terza settimana è stato continuato lo sviluppo dei componenti principali dei livelli del gioco, tra cui il Decision Tree e Causality.\
Inoltre sono stati aggiustati numerosi bug presenti nell'applicazione.
#pseudoheading[*Attività svolte*]
- Creazione del modello 3D per i personaggi non giocabili;
- Aggiunte interazioni con personaggi non giocabili;
- aggiunte texture e materiale al modello 3D del giocatore;
- creazione dei principali modelli 3D presenti nei livelli;
- modifica sul funzionamento del Decision Tree, adesso non avvisa più subito il giocatore;
- modifica sui file di salvataggio, ridotto il numero.
- correzione di bug.
#figure( caption: "Decision Tree (settimana 3)", image("imgs/settimana-3.png", width: auto))
#pagebreak()
== Settimana 4 | 07/07 - 11/07
#pseudoheading[*Retropsettiva*]
Durante la quarta settimana, sono stati sviluppati i componenti principali del terzo livello del gioco, a tema Causalità. Sono stati inoltre corretti alcuni bug presenti nell'applicazione ed è stata aggiornata la documentazione sul progetto. Infine è stato sviluppato un Proof of Concept e presentato al relatore aziendale.
#pseudoheading[*Attività svolte*]
- sviluppo del terzo livello, a tema Causalità, con i seguenti componenti:
  - creazione dei modelli 3D per gli oggetti presenti nel livello;
  - implementazione degli oggetti interagibili del livello;
  - aggiunta dei personaggi non giocabili con i loro rispettivi dialoghi;
  - aggiunte classi per controllare e cambiare il comportamento dei personaggi non giocabili;
- risolti alcuni bugs presenti nell'applicazione;
#figure( caption: "Livello Causalità (settimana 4)", image("imgs/settimana-4.png", width: 100%))
#pagebreak()
== Settimana 5 | 14/07 - 18/07
#pseudoheading[*Retropsettiva*]
Durante la quinta settimana, sono stati effettuati miglioramenti e ottimizzazioni al codice esistente, con particolare attenzione alla pulizia e alla riorganizzazione del progetto.
Inoltre è stato completato lo sviluppo del terzo livello del gioco, a tema "Causality".
#pseudoheading[*Attività svolte*]
- Refactoring del codice esistente per migliorare la leggibilità e la manutenibilità.
- Aggiunti i materiali al livello "Causality".
- Completamento dello sviluppo del terzo livello, a tema "Causality", con i seguenti componenti, sviluppati nelle settimane scorse:
  - modelli 3D per gli oggetti presenti nel livello;
  - aggiunta degli oggetti interagibili del livello;
  - aggiunta dei personaggi non giocabili con i loro rispettivi dialoghi;
  - aggiunte classi per controllare e cambiare il comportamento dei personaggi non giocabili prima e dopo la scena di intermezzo.
#figure( caption: "Livello Causalità dopo la scena di intermezzo (settimana 5)", image("imgs/settimana-5.png", width: 100%))
#pagebreak()
== Settimana 6 | 21/07 - 25/07
#pseudoheading[*Retropsettiva*]
La maggior parte dell'applicazione durante questo periodo è stata completata. Si è posta più concentrazione verso gli elementi di  presentazione come i suoni e gli effetti grafici, per migliorare l'esperienza di gioco.\
Inoltre, è stata migliorata la presentazione dei vecchi livelli, aggiungendo materiali e suoni.\
Infine sono stati inoltre corretti alcuni bug presenti nell'applicazione ed è stata aggiornata la documentazione.
#pseudoheading[*Attività svolte*]
- Aggiunti effetti sonori nell'applicazione.
- Aggiunti effetti visivi per la corsa, salto ed altro.
- Aggiunti materiali e suoni ai vecchi livelli.
- Correzione di bug presenti nell'applicazione.
- Inizio sviluppo dei test.
#figure( caption: [Livello "Albero di decisione" (settimana 6)], image("imgs/settimana-6.png", width: 100%))
#pagebreak()
== Settimana 7 | 28/07 - 01/08
#pseudoheading[*Retropsettiva*]
Durante la settima settimana di tirocinio, è stata ultimata l'applicazione, con il completamento di tutti i requisiti obbligatori. Inoltre sono stati soddisfatti alcuni requisiti desiderabili, migliorando ulteriormente la qualità del prodotto finale. Sono stati eseguiti test approfonditi per verificare il corretto funzionamento dell'applicazione e sono state apportate le ultime ottimizzazioni al codice e all'interfaccia utente.
Infine è stata presentata l'applicazione al tutor aziendale.
#pseudoheading[*Attività svolte*]
- Sviluppo di test di unità, integrazione e sistema.
- Controllo delle prestazioni e risorse usate dal gioco.
- Aggiunto un livello "Tutorial" che viene caricato quando il giocatore preme "Nuova partita".
- Aggiunto supporto generale per i joypad.
- Migliorata la UI del gioco.
- Presentazione applicazione al tutor aziendale.
#figure( caption: [Livello "Tutorial" (settimana 7)], image("imgs/settimana-7.png", width: 100%))
#pagebreak()
== Settimana 8 | 04/08 - 08/08
#pseudoheading[*Retropsettiva*]
Durante l'ultimo periodo di tirocinio sono state svolte prevalentemente attività di verifica, controllando la stesura dei documenti ed eseguendo gli ultimi testi al gioco.
#pseudoheading[*Attività svolte*]
- Stesura finale dei documenti.
- Controllo dei documenti.
- Test finali sul gioco.