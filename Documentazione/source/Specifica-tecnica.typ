#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Specifica tecnica",
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
Lo scopo di questo documento è descrivere l'architettura e le scelte relative a essa che sono state fatte durante la fase di progettazione e codifica del progetto.\
Vengono riportati i grafici UML delle classi per rappresentare l'architettura finale dell'applicazione.

== Scopo del prodotto
l progetto consiste nello sviluppo di un videogioco con il motore di gioco #gloss[Godot] di tipo #gloss[platformer], in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale. Il gioco si basa su temi di #gloss[Intelligenza Artificiale] e #gloss[Machine Learning], sviluppando meccaniche ed elementi del livello basati su questi argomenti.\ 
Comprende 3 livelli, ognuno con un tema diverso, un menu principale che viene visualizzato non appena il gioco viene avviato, e un menu di pausa che può essere visualizzato in qualsiasi momento durante il gioco.\
Ogni livello presenta meccaniche diverse e uniche.\
\
- *Regressione lineare*\
Il livello presenta una serie di grafici con una linea e dei dati, accedendo ad un "cannone" il giocatore può posizionare dei nuovi dati nel grafico e la retta si modifica in base alla poszione del nuovo punto. Nel caso i punti siano stati piazzati male e non sia possibile modificare ulteriormente la linea, il giocatore può resettare il grafico premendo il tasto apposito.\
Se soddisfatto della rotazione e posizione della linea il giocatore può uscire dal cannone e camminare sopra la linea per proseguire nel livello.\
\
- *Albero di decisione*\
In questo livello sono presenti diversi cani, ognuno di una razza diversa, ed un albero di decisione tridimensionale.
Ad ogni nodo dell'albero viene mostrata una domanda e le direzione da seguire per ogni risposta.\
L'obiettivo del giocatore è rispondere correttamente a ognuna di queste domande e posizionare il cane nel nodo finale giusto. In caso corretto, il giocatore potrà visualizzare la razze indovinate in un tabellone, e questo darà un Training Data al giocatore per ogni razza indovinata.\
Infine è presente un NPC che permette al giocatore di riportare tutti i cani nella posizione iniziale nel caso siano troppo sparsi.\
\
- *Causalità*\
Appena caricato nel livello, il giocatore avrà la possibilità di parlare con un NPC gelataio che lo guiderà all'obiettivo di questo livello, cioè accendere tutte le unità di codizionatori esterne presenti, poiché crede che le vendite di gelati e l'uso dei condizionatori siano correlate.
Nel livello sono presenti anche dei grafici che cambiano durante il livello in base alle azioni del giocatore.\
Una volta accese tutte le unità, verrà avviata una #gloss[scena di intermezzo] e alla fine di essa il giocatore dovrà indicare la vera causa della vendita di gelati.

== Glossario
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni. I termini presenti nel glossario sono colorati di blu e seguiti da un'asterisco: #gloss[esempio].\
Il glossario è accessibile tramite il link:\ 
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")\
oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Piano di lavoro:
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Piano-di-lavoro.pdf")

- Norme di progetto:
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Norme-di-progetto.pdf")

=== Riferimenti informativi
- Slide T05 del corso di Ingegneria del Software:\
#link("https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/T05.pdf")\
\
- Diagrammi UML - Use case:\
da cambiare\
\
- Documentazione "Godot Engine":\ 
#link("https://docs.godotengine.org/en/stable/")\
\


=== Riferimenti tecnici
- Documentazione di Godot:
#link("https://docs.godotengine.org/it/4.x/about/introduction.html")\
\
- I concetti chiave di Godot:
#link("https://docs.godotengine.org/it/4.x/getting_started/introduction/key_concepts_overview.html")\
\
- La filosofia progettuale di Godot:
#link("https://docs.godotengine.org/it/4.x/getting_started/introduction/godot_design_philosophy.html")\
\
- Architettura di Godot:
#link("https://docs.godotengine.org/en/stable/contributing/development/core_and_modules/godot_architecture_diagram.html")
= Tecnologie
#figure(caption: [Tecnologie utilizzate], table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: center + horizon,
  fill: (x, y) => if (y == 0) { luma(210) },
  table.header([*Nome*], [*Descrizione*], [*Versione*]),
  table.cell([*Codice*], colspan: 3),
  [GDScript],[],[(Legata a Godot)],
  [Python],[],[],
  [Typst],[Linguaggio utilizzato per la stesura dei documenti],[],
  [\u{002A}.csv],["Comma seprated values", file utilizzato per memorizzare le frasi nelle lingue diverse supportate dal gioco],[-],
  [\u{002A}.ini],[Tipo d file "plain-text" utilizzato per salvare i dati del gioco],[-],
  table.cell([*Softwares*], colspan: 3),
  [Godot],[Il motore di gioco open source per lo sviluppo del videogioco.],[4.5-beta3-mono],
  [Blender],[Software di modellazone ed animazione 3D usato per creare i modelli 3D del gioco],[4.4.3],
  [GIMP],[Software di modifica di immagini, usato per modificare le textures del gioco],[3.0.4],
  table.cell([*Strumenti e serivzi*], colspan: 3),
  [Git],[],[2.50.1],
  [GitHub Actions],[],[-]
))

= Premessa
Prima di iniziare a descrivere l'architettura del progetto, 
è necessario introdurre alcuni concetti chiave di Godot e le 
limitazioni del linguaggio GDScript, che è il linguaggio di 
programmazione principale utilizzato in Godot.
== Concetti chiave di Godot
=== Nodi
Dalla documentazione di Godot:\
_I nodi sono i blocchi fondamentali del gioco. Sono come ingredienti in 
una ricetta. Ci sono dozzine di tipi che possono mostrare un’immagine, 
riprodurre un suono, rappresentare una camera, e molto altro.
Tutti i nodi hanno le seguenti caratteristiche:
- Un nome.
- Proprietà modificabili.
- Ricevono callback per aggiornarsi ad ogni frame.
- Si possono estendere con nuove proprietà e funzioni.
- Si possono aggiungere a un altro nodo come figlio.
_
Inoltre ad ogni nodo si può assegnare uno script, che estende il 
tipo di quel nodo e aggiunge nuove funzionalità.\
I principali tipi di nodi che vengono utilizzati in questo progetto sono:
- *Node*: nodo base da cui vengono estesi tutti gli altri nodi, in questo progetto viene usato per assegnare classi e inserirli come figli in altri nodi.
- *Node3D*: rappresenta un oggetto nello spazio tridimensionale.
  - *CharacterBody3D*: rappresenta un personaggio nel gioco, gestendo la sua posizione, animazione e interazioni.
  - *Camera3D*: rappresenta una telecamera nello spazio tridimensionale, che può essere utilizzata per visualizzare la scena.
  - *MeshInstance3D*: rappresenta un oggetto tridimensionale con una mesh, che può essere utilizzato per visualizzare modelli 3D.
  - *CollisionShape3D*: rappresenta una forma di collisione nello spazio tridimensionale, utilizzata per gestire le interazioni fisiche tra gli oggetti.
  - *Area3D*: rappresenta un'area nello spazio tridimensionale, utilizzata per gestire le interazioni tra gli oggetti all'interno di essa.
- *AnimationPlayer*: gestisce le animazioni degli oggetti nella scena, permettendo di riprodurre animazioni su mesh, telecamere e altri nodi.
- *Control*: rappresenta un nodo di interfaccia utente, utilizzato per gestire gli elementi dell'interfaccia grafica del gioco.
=== Scene
Dalla documentazione di Godot:\
_Quando organizzi nodi in un albero, come il nostro personaggio, possiamo chiamare questa formazione una scena. Una volta salvata, la scena si presenta come un nuovo nodo nell’editor, dove possiamo aggiungerlo come figlio di un nodo esistente. In questo caso, l’istanza della scena appare come nodo singolo con interni nascosti.
Le scene di consentono di strutturare il codice del gioco in qualunque modo tu voglia. Puoi comporre nodi per creare nodi personalizzati e complessi, come un personaggio di gioco che si muove e salta, una barra della vita, una cesta con cui puoi interagire, e molto altro._
#figure(caption: [Scena del giocatore], 
image("imgs/godot-scene_example.png"))
Oltre che a comportarsi come nodi, le scene hanno anche le seguenti caratteristiche:
- Hanno sempre un nodo radice, come il "Player" nel nostro esempio.
- Si possono salvare sul disco locale e caricarle in seguito.
- Si possono creare quante più istanze di una scena si desideri. Ad esempio, si possono avere cinque o dieci personaggi nel gioco, creati da una determinata scena.

=== Segnali
I segnali sono un modo per far comunicare i nodi in maniera asincrona in Godot. Ogni classe presenta dei segnali preimpostati ed emessi in determinati momenti, ad esempio quando un nodo viene caricato, questo emette il segnale _ready_, oppure quando un bottone viene premuto, viene emesso il segnale _pressed_.\
I segnali inoltre possono anche contenere dei parametri, che possono essere utilizzati per passare informazioni tra i nodi.\
Infine, si possono creare segnali personalizzati, che possono essere emessi in qualsiasi momento dal nodo che li ha definiti tramite il metodo _signal.emit(...)_.\
Ci sono due modi per collegare un segnale ad un altro nodo:
- tramite l'editor: selezionando il nodo che emette il segnale e trascinandolo sul nodo che deve ricevere il segnale, e selezionando il metodo che deve essere chiamato quando il segnale viene emesso;
- tramite codice: utilizzando il metodo _signal.connect(Callable)_ del nodo che emette il segnale, passando come parametro il nome del segnale e il nodo che deve ricevere il segnale, e il metodo che deve essere chiamato quando il segnale viene emesso.

== Limitazioni GDScript
GDScript è un linguaggio di programmazione che, sebbene sia molto simile a Python, ha alcune limitazioni rispetto ad esso.\
\
- *Variabili private*\
In GDScript non è possibile definire variabili private, ma è possibile utilizzare la convenzione di denominazione con il trattino basso iniziale per indicare che una variabile non dovrebbe essere accessibile al di fuori della classe.\
Nei diagrammi presentati in questo documento, le variabili segnate come private in realtà sono le variabili precedute da un trattino basso, ma trattate comunque come variabili private per garantire compatibilità con versioni future di GDScript nel caso vengano implementate variabili private.\
\
- *Funzioni virtuali*\
GDScript non presenta la possibilità di dichiarare esplicitamente una funzione come virtual, ad esempio tramite la parola chiave _virtual_ come in C\u{0023}.
Tuttavia queste funzioni possono comunque essere sovrascritte dalle funzioni presenti nelle classi derivate.\
\
- *Puntatori*\
GDScript non supporta i puntatori come in C\u{0023}, ma è possibile ottenere un comportamento simile in alcune modi.\
Ad esempio, è possibile utilizzare le variabili di tipo _NodePath_ per fare riferimento a un nodo specifico nella scena, o utilizzare la parola chiave _\u{0040}onready_ sempre per inidcare variabili già presenti nella scena come nodi figli durante la compilazione.\
\
- *Assenza di interfacce*\
Tra queste limitazioni vi è l'assenza di interfacce, che sono un costrutto di\
programmazione che permette di definire un contratto che le classi devono rispettare,\
specificando i metodi che devono essere implementati.\
Per ovviare a questa mancanza, GDScript permette di usare #gloss[duck-typing], che consente di verificare il tipo di un oggetto in fase di esecuzione, piuttosto che in fase di compilazione.\
Un altro modo per fornire i metodi che una classe deve implementare è utilizzare classi astratte ed ereditarietà.

= Architettura
== Introduzione
Di seguito viene presentata l'architettura del progetto tramite diagrammi UML delle classi, che mostrano le relazioni tra le classi utilizzate nel progetto.\
L'applicazione è strutturata come un monolite, decisione presa per i seguenti motivi:
- *semplicità*: l'applicazione è relativamente piccola e non richiede una struttura complessa per essere gestita;
- *facilità di manutenzione*: la struttura monolitica permette di gestire più facilmente le dipendenze tra le classi, poiché tutte le classi sono contenute in un unico file e non è necessario gestire le dipendenze tra moduli diversi;
- *migliori prestazioni*: in un videogioco le prestazioni sono fondamentali e una struttura monolitica può contribuire a ottimizzare le performance, riducendo i tempi di caricamento e migliorando la fluidità del gioco.
=== Funzioni comuni
Molte classi del progetto presentano delle funzioni comuni, che vengono fornite dalle classi base del motore di gioco:\

-ready(): void\
Questa funzione viene chiamata quando il nodo è pronto per essere utilizzato, ovvero quando tutti i nodi figli sono stati caricati e il nodo è pronto per essere utilizzato.\
In questa funzione è possibile inizializzare le variabili, collegare i segnali e impostare le proprietà del nodo.\
È importante notare che questa funzione viene chiamata solo una volta, quando il nodo viene caricato per la prima volta nella scena, e non ad ogni frame del gioco.

-process(delta: float): void\
Questa funzione viene chiamata ad ogni frame del gioco e permette di aggiornare lo stato della classe ad ogni frame. 
Il parametro _delta_ rappresenta il tempo trascorso dall'ultimo frame, ed è utile per gestire le animazioni e le interazioni in modo fluido e coerente.

-physics_process(delta: float): void\
Questa funzione viene chiamata ad ogni frame di fisica del gioco, che di default è fisso 60 volte al secondo, anche se il numero di frame al secondo del gioco sia inferiore.\
Questa funzione è utile per gestire le interazioni fisiche tra gli oggetti, come ad esempio la gestione delle collisioni e la gestione della gravità.\
Il parametro _delta_ rappresenta il tempo trascorso dall'ultimo frame di fisica. 

== Assets comuni
Di seguito viene mostrata l'architettura degli #gloss[assets] presenti in più parti del gioco che non sono unici ad un livello specifico.
=== Giocatore
#figure(caption: [Diagramma delle classi del giocatore],image("imgs/class-player.png"))
Il giocatore può essere considerata la classe principale di tutta l'applicazione, attraverso il quale l'utente può interagire con la maggior parte dell'applicazione.\ Nonostante ci sia solo un giocatore presente del gioco, questo non è un #gloss[singleton], poiché per implementare un singleton in Godot è richiesto che questo sia caricato come #gloss[autoload] in ogni scena, e non c'è motivo di caricare il giocatore nel menu principale all'avvio del gioco.

Molte variabili presenti nel giocatore sono references ai suoi nodi figli presenti nella scena, queste variabili sono precedute dalla parola chiave _\u{0040}onready_ nel codice.
Similmente, molte funzioni della classe servono solo per accedere alle variabili dei suoi nodi figli, in modo da evitare che classi esterne possano accedervi.

L'architettura del giocatore presenta diverse funzionalità:
- *telecamera*;
- *macchina di stati*;
- *raccolta di collezionabili*;
- *gestione dei salvataggi*;
- *raccolta di oggetti*;
- *emissione di particelle 3D*;
- *UI*.
==== Telecamera
#figure(caption: [Diagramma delle classi della telecamera del giocatore],image("imgs/class-camera.png"))
==== State Machine
#figure(caption: [Diagramma sulla struttura della macchina di stati],image("imgs/class-state_machine.png"))
==== Collezionabili
=== Interazione
#figure(caption: [Diagramma degli oggetti con cui il giocatore può interagire],image("imgs/class-interactable.png"))
==== Cartelli
==== NPC
==== Dialoghi
#figure(caption: [Diagramma sul funzionamento di un dialogo],image("imgs/class-dialogue.png"))
=== Salvataggi
#figure(caption: [Diagramma sul funzionamento dei salvataggi],image("imgs/class-saves.png"))
=== LevelLoader
/*
== Menu
=== Menu di pausa
=== Menu principale*/
== Struttura base livello
== Livello "Regressione lineare"
=== Cannone e grafico LR
== Livello "Albero di decisione"
=== Albero
== Livello "Causalità"
#figure(caption: [Diagramma del livello della causalità],image("imgs/class-causality_level.png"))
=== Scena di intermezzo

= Requisiti soddisfatti
== Tabella requisiti soddisfatti
== Grafico requisiti soddisfatti