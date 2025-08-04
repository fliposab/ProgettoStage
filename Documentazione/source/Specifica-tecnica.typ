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
#show figure: set block(breakable: true)

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
- Diagrammi UML:\\
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
  [GDScript],[Linguaggio di programmazione di alto livello, con sintassi simile a Python, viene integrato con il motore di gioco Godot],[(Legata a Godot)],
  [GDShader],[Linguaggio simile a GLSL ES 3.0 usato per la creazione di materiali più complessi],[(Legata a Godot)],
  [Typst],[Linguaggio utilizzato per la stesura dei documenti],[0.13.1],
  table.cell([*Softwares*], colspan: 3),
  [Godot],[Il motore di gioco open source per lo sviluppo del videogioco.],[4.5-beta3-mono],
  [Blender],[Software di modellazione ed animazione 3D usato per creare i modelli 3D del gioco],[4.4.3],
  table.cell([*Strumenti e servizi*], colspan: 3),
  [Git],[],[2.50.1],
  [GitHub Actions],[Servizio di integrazione continua e distribuzione continua (CI/CD), utilizzato per compilare i documenti ad ogni push],[-],
  table.cell([*Tipi di files non generati dagli strumenti elencati sopra*], colspan: 3),
  [\u{002A}.csv],["Comma separated values", file utilizzato per memorizzare le frasi nelle lingue diverse supportate dal gioco],[-],
  [\u{002A}.ini],[Tipo di file "plain-text" utilizzato per salvare i dati del gioco],[-],
  [\u{002A}.glb],["GLTF Binary", file utilizzato per memorizzare i modelli 3D e le loro animazioni in formato binario, in modo da risparmiare spazio e migliorare le prestazioni],[2.0.1]
))

= Premessa
Prima di iniziare a descrivere l'architettura del progetto, 
è necessario introdurre alcuni concetti chiave di Godot./* e le 
limitazioni del linguaggio GDScript, che è il linguaggio di 
programmazione principale utilizzato in Godot.*/
== Nodi
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
== Scene
Dalla documentazione di Godot:\
_Quando organizzi nodi in un albero, come il nostro personaggio, possiamo chiamare questa formazione una scena. Una volta salvata, la scena si presenta come un nuovo nodo nell’editor, dove possiamo aggiungerlo come figlio di un nodo esistente. In questo caso, l’istanza della scena appare come nodo singolo con interni nascosti.
Le scene di consentono di strutturare il codice del gioco in qualunque modo tu voglia. Puoi comporre nodi per creare nodi personalizzati e complessi, come un personaggio di gioco che si muove e salta, una barra della vita, una cesta con cui puoi interagire, e molto altro._
#figure(caption: [Scena del giocatore], 
image("imgs/godot-scene_example.png"))
Oltre che a comportarsi come nodi, le scene hanno anche le seguenti caratteristiche:
- Hanno sempre un nodo _owner_ come il "Player" nel nostro esempio.
- Si possono salvare sul disco locale e caricarle in seguito.
- Si possono creare quante più istanze di una scena si desideri. Ad esempio, si possono avere cinque o dieci personaggi nel gioco, creati da una determinata scena.

== Segnali
I segnali sono un modo per far comunicare i nodi in maniera asincrona in Godot. Ogni classe presenta dei segnali preimpostati ed emessi in determinati momenti, ad esempio quando un nodo viene caricato, questo emette il segnale _ready_, oppure quando un bottone viene premuto, viene emesso il segnale _pressed_.\
I segnali inoltre possono anche contenere dei parametri, che possono essere utilizzati per passare informazioni tra i nodi.\
Infine, si possono creare segnali personalizzati, che possono essere emessi in qualsiasi momento dal nodo che li ha definiti tramite il metodo _signal.emit(...)_.\
Ci sono due modi per collegare un segnale ad un altro nodo:
- tramite l'editor: selezionando il nodo che emette il segnale e trascinandolo sul nodo che deve ricevere il segnale, e selezionando il metodo che deve essere chiamato quando il segnale viene emesso;
- tramite codice: utilizzando il metodo _signal.connect(Callable)_ del nodo che emette il segnale, passando come parametro il nome del segnale e il nodo che deve ricevere il segnale, e il metodo che deve essere chiamato quando il segnale viene emesso.
/*
== Limitazioni di GDScript
GDScript è un linguaggio di programmazione che, sebbene sia molto simile a Python, ha alcune limitazioni rispetto ad esso.\
\
- *Variabili private*\
In GDScript non è possibile definire variabili private, ma è possibile utilizzare la convenzione di denominazione con il trattino basso iniziale per indicare che una variabile non dovrebbe essere accessibile al di fuori della classe.\
Nei diagrammi presentati in questo documento, le variabili segnate come private in realtà sono le variabili precedute da un trattino basso, ma trattate comunque come variabili private per garantire compatibilità con versioni future di GDScript nel caso vengano implementate variabili private.\
\
- *Funzioni virtuali*\
GDScript non presenta la possibilità di dichiarare esplicitamente una funzione come virtual, ad esempio tramite la parola chiave _virtual_ come in C\u{0023}.
Tutte le funzioni possono essere sovrascritte nelle classi figlie, inoltre si può indicare una funzione come virtuale mettendo un trattino basso prima del nome.\
\
- *Assenza di interfacce*\
Tra queste limitazioni vi è l'assenza di interfacce, che sono un costrutto di\
programmazione che permette di definire un contratto che le classi devono rispettare,\
specificando i metodi che devono essere implementati.\
Per ovviare a questa mancanza, GDScript permette di usare #gloss[duck-typing], che consente di verificare il tipo di un oggetto in fase di esecuzione, piuttosto che in fase di compilazione.\
Un altro modo per fornire i metodi che una classe deve implementare è utilizzare classi astratte ed ereditarietà.
*/
= Architettura
== Introduzione
Di seguito viene presentata l'architettura del progetto tramite diagrammi UML delle classi, che mostrano le relazioni tra le classi utilizzate nel progetto.\
L'applicazione è strutturata come un monolite, decisione presa per i seguenti motivi:
- *semplicità*: l'applicazione è relativamente piccola e non richiede una struttura complessa per essere gestita;
- *facilità di manutenzione*: la struttura monolitica permette di gestire più facilmente le dipendenze tra le classi, poiché tutte le classi sono contenute in un unico file e non è necessario gestire le dipendenze tra moduli diversi;
- *migliori prestazioni*: in un videogioco le prestazioni sono fondamentali e una struttura monolitica può contribuire a ottimizzare le performance, riducendo i tempi di caricamento e migliorando la fluidità del gioco.
=== Funzioni comuni
Molte classi del progetto presentano delle funzioni virtuali comuni, che vengono fornite dalle classi base del motore di gioco:\

_+ready(): void_\
Questa funzione viene chiamata quando il nodo è pronto per essere utilizzato, ovvero quando tutti i nodi figli sono stati caricati e il nodo è pronto per essere utilizzato.\
In questa funzione è possibile inizializzare le variabili, collegare i segnali e impostare le proprietà del nodo.\
È importante notare che questa funzione viene chiamata solo una volta, quando il nodo viene caricato per la prima volta nella scena, e non ad ogni frame del gioco.

_+process(delta: float): void_\
Questa funzione viene chiamata ad ogni frame del gioco e permette di aggiornare lo stato della classe ad ogni frame. 
Il parametro _delta_ rappresenta il tempo trascorso dall'ultimo frame, ed è utile per gestire le animazioni e le interazioni in modo fluido e coerente.

_+physics_process(delta: float): void_\
Questa funzione viene chiamata ad ogni frame di fisica del gioco, che di default è fisso 60 volte al secondo, anche se il numero di frame al secondo del gioco sia inferiore.\
Questa funzione è utile per gestire le interazioni fisiche tra gli oggetti, come ad esempio la gestione delle collisioni e la gestione della gravità.\
Il parametro _delta_ rappresenta il tempo trascorso dall'ultimo frame di fisica. 

_+input(event: InputEvent): void_\
Funzione chiamata ogni volta che il gioco rileva un qualsiasi input, sia da tastiera che da joystick. Il parametro _event_ rappresenta l'input che chiama la funzione.
== Asset comuni
Di seguito viene mostrata l'architettura degli #gloss[asset] presenti in più parti del gioco che non sono unici ad un livello specifico.
=== Giocatore
#figure(caption: [Diagramma delle classi del giocatore],image("imgs/class-player.png"))
Il giocatore può essere considerata la classe principale di tutta l'applicazione, attraverso il quale l'utente può interagire con la maggior parte dell'applicazione.\ Nonostante ci sia solo un giocatore presente del gioco, questo non è un #gloss[singleton], poiché per implementare un singleton in Godot è richiesto che questo sia caricato come #gloss[autoload] in ogni scena, e non c'è motivo di caricare il giocatore nel menu principale, all'avvio del gioco.

Molte variabili presenti nel giocatore sono riferimenti ai suoi nodi figli presenti nella scena, queste variabili sono precedute dalla parola chiave _\u{0040}onready_ nel codice.
Similmente, molte funzioni della classe servono solo per accedere alle variabili dei suoi nodi figli.

La classe del giocatore ha associate le seguenti classi divise per funzionalità:
- *CameraRaycast*
- *StateMachine*
- *PlayerSavesHandler*
- *Movement*
- *GrabItem*
- *ParticleEmitter*
- *PlayerUI*
==== CameraRayCast
#figure(caption: [Diagramma delle classi della telecamera del giocatore],image("imgs/class-camera.png"))
==== StateMachine
#figure(caption: [Diagramma sulla struttura della macchina di stati],image("imgs/class-state_machine.png"))\
#figure(caption: [Diagramma degli stati], image("imgs/sm-player_states.png", width: 60%))
*StateMachine*:\
*State*:\
*GroundMovementState*:\
*AirState*:\
*InteractState*:\
*ReleaseState*:\
*IdleState*:\
==== PlayerSavesHandler

==== Movement

==== GrabItem

==== ParticleEmitter

==== PlayerUI
#figure(caption: [Diagramma delle classi della UI del giocatore], image("imgs/class-player_ui.png", width: 90%))
*Collectibles*:\
*PlayerUI*:\
*PanelContainer*:\
=== Interazione
#figure(caption: [Diagramma degli oggetti con cui il giocatore può interagire],image("imgs/class-interactable.png"))
text
==== Control
#figure(caption: [Diagramma dei vari tipi di UI],image("imgs/class-input_prompts.png", width: auto))
text
==== InteractableArea
text
==== NPC
text
==== InteractableSign
text
==== NPCDialogue
text
=== Dialoghi
#figure(caption: [Diagramma sul funzionamento di un dialogo],image("imgs/class-dialogue.png"))
text
==== Dialogue
text
==== DialogueBoxSimple
text
==== DialogueBoxOptions
text
==== DialogueOptionsButtons
text
=== Salvataggi
#figure(caption: [Diagramma sul funzionamento dei salvataggi],image("imgs/class-saves.png"))
==== Saves
==== SavesHandler
=== Singletons / Autoloads
#figure(caption: [Classi _Autoloads_],image("imgs/class-autoloads.png", width: auto))
==== LevelsTransition
text
==== OptionsSave
text
==== InputUIHandler
text
/*
== Menu
=== Menu di pausa
=== Menu principale*/
== Struttura base livello
#figure(caption: [Diagramma di un livello base],image("imgs/class-base_level.png", width: auto))
text
=== PlayerSpawn
text
=== PauseMenu
text
== Livello "Regressione lineare"
=== Cannone e grafico LR
#figure(caption: [Diagramma sul funzionamento di un grafico "Linear Regression" nel gioco],image("imgs/class-linear_regression.png"))
==== LRCannon
==== LinearRegressionGraph
== Livello "Albero di decisione"
text
=== Albero
#figure(caption: [Diagramma sul funzionamento dell'Albero di decisione],image("imgs/class-decision_tree.png"))
text
== Livello "Causalità"
#figure(caption: [Diagramma del livello della causalità],image("imgs/class-causality_level.png"))
=== Scena di intermezzo

= Requisiti soddisfatti
Nella seguente sezione vengono presentati tutti i requisiti presenti nel documento _Analisi dei requisiti_, presentando il loro stato di soddisfazione.
== Tabella requisiti soddisfatti
#figure(
  caption: [Requisiti di funzionalità],
  table(
    columns: (0.65fr, 2fr, 0.8fr),
    inset: 8pt,
    align: center + horizon,
    fill: (x, y) => if (y == 0) { luma(230) },
    table.header([*ID Requisito*], [*Descrizione*], [*Soddisfatto*]),
    //UC1
    [R-01-F-O],
    [Il giocatore deve essere in grado di muoversi in uno spazio tridimensionale],
    [\u{2713}],
    //UC1.1
    [R-02-F-O],
    [Il giocatore deve essere in grado di muoversi in uno spazio tridimensionale portando un oggetto],
    [\u{2713}],
    //UC2
    [R-03-F-O],
    [Il giocatore deve essere in grado saltare],
    [\u{2713}],
    //UC2.1
    [R-04-F-O],[Il giocatore deve essere in grado di saltare con un oggetto in mano],[\u{2713}],
    //UC3, 3.1
    [R-05-F-O],
    [La telecamera deve muoversi automaticamente dietro il giocatore quando questo si muove],
    [\u{2713}],
    //UC3, 3.2
    [R-06-F-O],
    [Il giocatore deve essere in grado di ruotare la telecamera],
    [\u{2713}],
    //UC4, UC5
    [R-07-F-O],[Il giocatore deve tornare in una posizione precedente quando cade dal livello],
    [\u{2713}],
    [R-08-F-O],
    //UC6
    [Il giocatore deve essere in grado di raccogliere collezionabili sparsi per il livello],
    [\u{2713}],
    //UC7
    [R-09-F-O],
    [Il giocatore deve essere in grado di interagire con entità presenti nel livello],
    [\u{2713}],
    //UC7.1
    [R-10-F-O],
    [Il giocatore deve essere in grado di visualizzare subito il messagio di un'entità automatica],
    [\u{2713}],
    //UC7.2
    [R-11-F-O],
    [Il giocatore deve essere in grado di parlare con un personaggio non giocabile],
    [\u{2713}],
    //UC8.1
    [R-12-F-O],
    [Il giocatore deve poter visualizzare il dialogo quando interagisce con delle entità specifiche],
    [\u{2713}],
    //UC8.2
    [R-13-F-O],
    [Il giocatore deve avere la possibilità  di prendere una decisione quando gli viene mostrato nel dialogo],
    [\u{2713}],
    //UC8.3
    [R-14-F-O],
    [Il giocatore deve poter andare avanti nel dialogo],
    [\u{2713}],
    //UC8.4
    [R-15-F-O],
    [Il giocatore deve poter finire l'interazione con un'entità],
    [\u{2713}],
    //UC9
    [R-16-F-O],
    [Il giocatore deve poter essere in grado di raccogliere oggetti],
    [\u{2713}],
    //UC10
    [R-17-F-O],
    [Il giocatore deve poter essere in grado di lasciare l'oggetto che sta portando],
    [\u{2713}],
    //UC11
    [R-18-F-O],
    [Il giocatore deve poter interagire con un cartello in un livello],
    [\u{2713}],
    // UC11.1
    [R-19-F-O],
    [Il giocatore deve poter visualizzare il contenuto di un cartello],
    [\u{2713}],
    //UC11.2
    [R-20-F-O],
    [Il giocatore deve poter visualizzare gli oggetti che ha classificato correttamente],
    [\u{2713}],
    //UC11.3
    [R-21-F-O],
    [Il giocatore deve poter visualizzare il grafico di un cartello],
    [\u{2713}],
    //UC11.4
    [R-22-F-O],[Il giocatore deve poter modificare i dati presenti in un cartello],[\u{2713}],
    //UC12
    [R-23-F-O],
    [Il giocatore deve poter essere in grado di interagire con un'area di transizione],
    [\u{2713}],
    //UC12.1
    [R-24-F-O],
    [Il giocatore deve poter essere in grado di cambiare livello],
    [\u{2713}],
    //UC13
    [R-25-F-O],
    [Il giocatore deve poter interagire con la macchina LR],
    [\u{2713}],
    //UC14
    [R-26-F-O],
    [Il giocatore deve poter inserire punti nel grafico LR],
    [\u{2713}],
    //UC15
    [R-27-F-O],
    [Il giocatore deve poter resettare i punti aggiunti nel grafico LR],
    [\u{2713}],
    //UC16
    [R-28-F-O],[Il giocatore deve poter salire sopra un nodo dell'albero di decisione],[\u{2713}],
    //UC16.1
    [R-29-F-O],[Il giocatore deve poter visualizzare le scelte da prendere sopra il nodo],[\u{2713}],
    //UC17
    [R-30-F-O],
    [Il giocatore deve poter piazzare un oggetto sopra un nodo dell'albero di decisione],
    [\u{2713}],
    //UC17.1
    [R-31-F-O],
    [Il giocatore deve poter visualizzare se l'oggetto posto sul nodo sia giusto],
    [\u{2713}],
    //UC17.2
    [R-32-F-O],
    [Il giocatore deve poter visualizzare se l'oggetto posto sul nodo sia sbagliato],
    [\u{2713}],
    //UC18
    [R-33-F-O],
    [Il giocatore deve poter salvare il gioco in momenti specifici],
    [\u{2713}],
    //UC19
    [R-34-F-O],
    [Il giocatore deve poter mettere in pausa il gioco],
    [\u{2713}],
    //UC20
    [R-35-F-O],
    [Il giocatore deve poter riprendere il gioco dal menu di pausa],
    [\u{2713}],
    //UC21
    [R-36-F-O],
    [Il giocatore deve poter accedere alle opzioni del gioco],
    [\u{2713}],
    //UC22
    [R-37-F-O],
    [Il giocatore deve poter tornare al livello hub dal menu di pausa],
    [\u{2713}],
    //UC23
    [R-38-F-D],
    [Il giocatore deve poter tornare al menu principale dal menu di pausa],
    [\u{2713}],
    //UC24
    [R-39-F-O],
    [Il giocatore deve poter chiudere il gioco dal menu di pausa o principale],
    [\u{2713}],
    //UC25
    [R-40-F-O],
    [Il giocatore deve poter caricare una partita salvata dal menu principale],
    [\u{2713}],
    [R-41-F-O],
    [Il giocatore deve poter avviare una nuova partita dal menu principale],
    [\u{2713}],
    [R-42-F-O],
    [Il giocatore deve poter modificare la modalità della finestra dal menu delle opzioni],
    [\u{2713}],
    [R-43-F-O],
    [Il giocatore deve poter modificare la risoluzione della finestra],
    [\u{2713}],
    [R-44-F-D],
    [Il giocatore deve poter modificare la scala di risoluzione del gioco],
    [\u{2713}],
    [R-45-F-D],
    [Il giocatore deve essere in grado di poter modificare il tipo di anti-aliasing usato nel gioco, oppure non usarlo],
    [\u{2713}],
    [R-46-F-D],[Il giocatore deve essere in grado di modificare la qualità delle ombre nel gioco],
    [\u{2713}],
    [R-47-F-D],[Il giocatore deve poter cambiare lingua di gioco],
    [\u{2713}],
    [R-48-F-D],[Il giocatore deve poter cambiare il volume generale del gioco],
    [\u{2713}],
    [R-49-F-O],[Il gioco deve applicare e salvare le opzioni selezionate],
    [\u{2713}],
    [R-50-F-O],[Il giocatore deve poter accendere delle unità esterne di un condizionatore premendo un tasto],
    [\u{2713}],
    [R-51-F-O],[Il giocatore deve poter vedere scene di intermezzo],[\u{2713}],
    "R-01-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti la progettazione architetturale",
    "\u{2713}",

    "R-02-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti le tecnologie utilizzate",
    "\u{2713}",

    "R-03-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti la progettazione della base di dati",
    "\u{2713}",

    "R-04-Q-O",
    "È richiesta la presentazione del documento Specifica Tecnica che include dettagli riguardanti l'implementazione del sistema di raccomandazione utilizzato con LLM",
    "\u{2713}",

    "R-05-Q-O",
    "Tutte le attività del progetto devono essere svolte rispettando le Norme di Progetto",
    "\u{2713}",

    "R-06-Q-O", "Tutto il codice e la documentazione vanno salvati all'interno di un repository pubblico", 
    "\u{2713}",
    "R-01-V-O",
    "Il gioco deve avere almeno 3 livelli",[\u{2713}],
    "R-02-V-O",[Un livello deve avere come tema "Regressione lineare"],[\u{2713}],
    "R-03-V-O",[Un livello deve avere come tema "Alberi di decisione"],[\u{2713}],
    "R-04-V-O",[Un livello deve avere come tema "Causalità"],[\u{2713}],
    "R-05-V-O",[Deve essere presente un livello "Tutorial" che insegni al giocatore i comandi base],[\u{2713}],
    "R-06-V-O",[Il movimento del gioco deve essere tridimensionale],[\u{2713}],
    "R-01-A-O", 
    "Il gioco deve supportare il sistema operativo Windows",
    "\u{2713}",
    "R-02-A-D","Il gioco deve supportare il sistema operativo Ubuntu","\u{2713}",
    "R-03-A-D","Il gioco deve supportare il sistema operativo Mac-OS","",
    "R-04-A-D",
    "La piattaforma deve essere responsive e funzionare correttamente su dispositivi desktop con risoluzione minima di 640x360px",
    "",
    "R-05-A-O","Il gioco deve supportare input da tastiera",[\u{2713}],
    "R-06-A-D","Il gioco deve supportare input da un joypad generico",[\u{2713}],
    "R-07-A-O"," Il gioco deve mostrare gli input del dispositivo che si sta usando",[\u{2713}]
  )
)

== Grafico requisiti soddisfatti