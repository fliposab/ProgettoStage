#import "./format.typ" : *

#show: doc => documento(doc)

= Contatti
*Studente*:\
Filippo Sabbadin\
#link("mailto:filippo.sabbadin.4@studenti.unipd.it")\
\
*Tutor aziendale:*\
Gregorio Piccoli\
#link("mailto:Gregorio.Piccoli@zucchetti.it")\
\
*Azienda:*\
Zucchetti Spa\
Via Giovanni Cittadella, 7\
Padova (PD)\
Sito: #link("www.zucchetti.it")
= Scopo dello stage

L'azienda Zucchetti Spa è nota come la prima software house italiana, ed offre una vasta gamma di soluzioni software
e servizi per le aziende, mantenendosi sempre aggiornati su tematiche come il diritto civile, contabilità, fiscalità,
diritto del lavoro e previdenza.\
\
Lo stage prevede un progetto scelto dallo studente e approvato dall'azienda sul Game Design.\
Questo consiste nello sviluppo di un gioco tramite il _game engine_ open source "Godot Engine", con gli argomenti del gioco a tema di Intelligenza
Artificiale e Machine Learning.\
Il gioco prevede un movimento tridimensionale in un ambiente 3D, con l'utente che dovrà superare vari livelli, che
presentano meccaniche, sempre ispirate ad elementi di AI e ML, come regressione logistica, Support Vector Machine oppure
Random Forest.\
Come linguaggio di programmazione, verrà utilizzato GDScript, un linguaggio di programmazione simile a Python, senza garbage collector e
creato apposta per il motore di gioco Godot.\
Godot inoltre supporta anche i linguaggi C#sym.hash, C++ e OpenGL

= Interazione tra studente e tutor aziendale

Almeno una volta a settimana ci saranno incontri (in remoto o diretti) con il tutor aziendale Gregorio Piccoli per verificare lo stato di avanzamento, chiarire eventualmente gli obiettivi, affinare la ricerca e aggiornare il piano stesso di lavoro.

= Prodotti attesi

Durante l'attività di tirocinio, lo studente dovrà produrre i seguenti prodotti:

== Documentazione
- Analisi dei Requisiti:
  - Documento contenente tutti i requisiti e casi d'uso dell'applicazione.
- Piano di Qualifica:
  - Documento contenente tutte le metriche usate per misurare la qualità del prodotto.
- Norme di Progetto
  - Documento contenente tutti gli strumenti utilizzati e il _way of working_.
- Piano di Progetto:
  - Documento che pianifica le attività e valuta lo stato di avanzamento del progetto.
- Specifica Tecnica:
  - Documento che descrive l'architettura dell'applicazione.
- Manuale Utente:
  - Documento che guida l'utente al corretto uso dell'applicazione.

== Software

- Proof of Concept (prodotto parziale):
  - Demo dell'applicazione che serve per dimostrare le funzioni principali dell'applicazione.
- Minimum Viable Product (prodotto finale):
  - L'applicazione terminata, svolta durante l'attività di tirocinio.

= Contenuti formativi previsti

Durante questo progetto di stage lo studente avrà occasione di approfondire le sue conoscenze nell’ambito del Game Design, creando "livelli" dove i vari oggetti creati interagiscono con l'utente o giocatore.\
Inoltre, lo studente avrà modo di approfondire le sue conoscenze in merito agli argomenti di Intelligenza Artificiale e Machine Learning, implementando meccaniche di gioco che richiedono l'uso di algoritmi come Linear Regression, Random Forest e Causality.


= Pianificazione del lavoro
Il gioco conterrà 3 livelli. Si prevede che lo sviluppo di ognuno di questi livelli impegnerà un massimo di 2 settimane.\
Vista la familiarità dello studente verso gli argomenti dello stage, non sono previste molte ore di formazione, ma sono comunque richieste ore di pianificazione e progettazione.

== Periodi
Il periodo di stage è suddiviso in 8 periodi, la cui lunghezza di ognuno 
corrisponde a una settimana. Qui sotto sono 
elencate le attività pianificate per ogni settimana:
#linebreak()
#linebreak()

//1 - Linear descent
//2 - Causality
//3 - Random Forest
//4 - Support Vector Machine
- *Settimana 1 - 24 ore*:
  - Incontro con il personale dell'azienda per discutere i requisiti dell'applicazione da sviluppare;
  - Verifica credenziali e strumenti di lavoro assegnati;
  - Pianificazione e progettazione dell'applicazione;
  - Inizio sviluppo.
  //Obiettivi
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

== Ripartizione ore
Nella seguente tabella vengono riportate le ore totali del progetto, suddivise in pianificazione, documentazione, sviluppo e testing:
#show figure: set block(breakable: false)
#figure(
  caption: [Pianificazione del lavoro],
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

= Obiettivi
//Obiettivi di qualità
Si farà riferimento ai requisiti secondo le seguenti notazioni:
- *O*: requisito obbligatorio, vincolante per il superamento del progetto;
- *D*: requisito desiderabile, non vincolanti o strettamente necessari, ma dal riconoscibile valore aggiunto.
Le sigle sono seguite da un numero che formano il codice del requisito.

Si prevede lo svolgimento dei seguenti obiettivi:

#show figure: set block(breakable: true)
#figure(caption: [Obiettivi del progetto], table(
  columns: (0.5fr, 2fr),
  inset: 8pt,
  align: center + horizon,
  fill: (x, y) => if (y == 0 or y == 4) { luma(230) },
  table.cell(colspan: 2, [*Obbligatori*]),
  [O-1],
  [Progettazione e realizzazione delle principali meccaniche di gioco (movimento 3D, interazione con altri oggetti...)],
  [O-2],
  [Implementazione degli argomenti di AI e ML al gioco (Linear Regression, Gradient Descent, Random Forest...)],
  [O-3],
  [Implementazione di salvataggi e caricamenti dei dati attraverso files di tipo _.json_ oppure _.ini_],
  table.cell(colspan: 2, [*Desiderabili*]),
  [D-1],
  [Supporto della lingua inglese oltre all'italiano, con opzione di cambiare lingua di gioco],
  [D-2],
  [Implementazione di _shaders_, utilizzando script di tipo _opengl_],
  [D-3],[Uso dei linguaggi C#sym.hash o C++ per migliorare le prestazioni],
  [D-4],[Implementazione di un modello di LLM per conversazioni tra personaggi all'interno del gioco]
))

#align(bottom+right,
  grid(
    rows: (0.1fr, 0.12fr, 0.1fr, 0.1fr, 0.2fr),
    columns: (1fr),
    [#align(left, [Data])],
    box()[
      #align(
        left,
        text("Firma tutor aziendale"),
      )
      #v(4em)
      #line(length: 20em)
    ],box()[
      #align(
        left,
        text("Firma tutor interno"),
      )
      #v(4em)
      #line(length: 20em)],
      box()[
      #align(
        left,
        text("Firma stagista"),
      )
      #v(4em)
      #line(length: 20em)]
  ))