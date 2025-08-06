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
- *Movement*
- *CameraRaycast*
- *StateMachine*
- *PlayerSavesHandler*
- *GrabItem*
- *ParticleEmitter*
- *PlayerUI*
==== Movement
La classe "Movement" si occupa di gestire gli input per il movimento del giocatore, la funzione _get_move_input_ si occupa di prendere l'input del movimento e ruotarlo in base alla rotazione della telecamera.
==== CameraRayCast
#figure(caption: [Diagramma delle classi della telecamera del giocatore],image("imgs/class-camera.png"))
La telecamera del giocatore viene gestita da più classi per garantire diverse funzionalità tra quali la rotazione intorno al giocatore, proiezione di elementi della UI sullo schermo ed evitare che la telecamera passi attraverso i muri, generando il fenomeno chiamato #gloss[clipping].\

- *CameraRayCast*\
Oltre che a gestire il lavoro di tutte le altre classi per il corretto funzionamento della telecamera, questa classe lancia un raggio dalla posizione del giocatore verso il basso per controllare velocemente la distanza dal terreno del giocatore.
Nel caso il raggio tocca ancora il terreno, la telecamera rimane per terra e non si sposta in alto con il giocatore.

- *PlayerCamera*\
La telecamera effettiva, eredita dalla classe di Godot "Camera3D". Offre il metodo _look at target_ che si occupa di girare la telecamera verso un obiettivo. Questo metodo viene usato da "CameraRayCast" per girare la telecamera verso un punto calcolata da quest'ultima.\

- *CameraProjectUI*\
La classe "CameraProjectUI" gestisce gli elementi della UI la cui posizione viene "proiettata" dallo spazio 3D del gioco, allo spazio 2D dello schermo.
Contiene un array, composto da questi elementi. Nel caso l'array sia vuoto, la modalità di processo viene disabilitata, cioè le operazioni della classe non vengono più effettuate ad ogni fotogramma del gioco.\

- *SpringArm3D*\
Classe fornita da Godot. La sua posizione globale corrisponde sempre a quella del giocatore, e si occupa di avvicinare la telecamera quando è vicino ad un muro per evitare il clipping.\

- *CameraTarget*\
La classe "CameraTarget" eredita dalla classe di Godot "Marker3D". La sua posizione viene calcolata da "CameraRaycast" e si occupa di gestire gli input per ruotare e muovere la telecamera intorno al giocatore.\

- *CameraFocusTarget*\
La classe "CameraFocusTarget" si occupa di gestire lo spostamento della telecamera in casi speciali, ad esempio durante un dialogo con un personaggio non giocabile, dove la telecamera deve girarsi verso il personaggio che sta parlando.\

==== StateMachine
#figure(caption: [Diagramma sulla struttura della macchina di stati],image("imgs/class-state_machine.png"))\
La macchina di stati è stata utilizzata per controllare meglio i diversi stati in cui il personaggio del giocatore può eseguire, esempio: il movimento, salto...
L'uso della macchina di stati, inoltre, ha garantito una gestione più semplice del personaggio del giocatore e ha reso più facile aggiungere funzionalità a questo.
La figura sotto mostra il possibile flusso degli stati del giocatore.
#figure(caption: [Diagramma degli stati], image("imgs/sm-player_states.png", width: 60%))

- *StateMachine*\
La classe "StateMachine" si occupa di gestire la transizione degli stati.
L'attributo _state_ indica lo stato corrente del personaggio del giocatore. Quando riceve il segnale "finished" dallo stato in cui si trova, si occupa di passare allo stato indicato dal segnale, passando gli eventuali dati contenuto nel Dictionary allo stato successivo.\

- *State*\
Classe base astratta per tutti gli stati. Include un riferimento al giocatore ed alla macchina di stati. Fornisce i seguenti metodi virtuali per le classi figlie:
- _+enter(previous_state_path: String, data: Dictionary)_
#v(-0.5em)
Chiamato non appena lo stato diventa attivo. L'attributo _data_ contiene dei possibili dati mandati dallo stato precedente.

- _+exit()_
#v(-0.5em)
Chiamato quando si esce dallo stato

- _+physics_update(delta: float)_
#v(-0.5em)
Chiamato ad ogni frame fisico dello stato quando questo è *attivo*.

- _+update(delta: float)_
#v(-0.5em)
Chiamato ad ogni frame dello stato quando questo è *attivo*.

- _+handle_input(event: InputEvent)_
#v(-0.5em)
Chiamato quando viene premuto un input quando lo stato è attivo. L'attributo _event_ rappresenta l'input premuto.\ 

- *IdleState*
Lo stato "Idle" è lo stato iniziale del giocatore. Questo stato viene chiamato quando il giocatore è fermo per terra.
Può passare a tutti gli altri stati in base agli input premuti in diverse condizioni.
Ad esempio se il giocatore sta portando qualcosa e preme il tasto di interazione, il personaggio passa allo stato "Release", ma se non sta portando niente, allora non succede niente. Invece se preme lo stesso tasto dentro un area specifica, il personaggio passa allo stato "Interact"

- *GroundMovementState*
Il personaggio del giocatore passa allo stato "GroundMovement" quando viene premuto un input per spostarsi rimanendo per terra.
Come lo stato "Idle", si può passare a tutti gli altri stati anche da questo, seguendo le stesse condizioni dello stato "Idle".

- *AirState*\
Si può passare a questo stato in due condizioni: il giocatore cade da una piattaforma, o preme il tasto per saltare. Nell'ultimo caso, lo stato precedente manda un valore "jump = true" all'interno del Dictionary, in questo modo lo stato controlla se è presente il medesimo valore ed in caso positivo, esegue il salto, caricando la rispettiva animazione e modificando la velocità verticale.

- *InteractState*\
Lo stato "Interact" indica che il personaggio del giocatore è impegnato ad interagire con un'altra entità, ad esempio mentre parla con un personaggio non giocabile o legge un cartello. A differenza degli altri stati, non è un input a far cambiare stato, ma i segnali dalle entità esterne.

- *GrabState*
Il personaggio del giocatore passa allo stato "Grab" quando il giocatore preme il tasto per prendere un oggetto vicino a uno di questi. Importante notare che questo stato rappresenta solo quando il personaggio prende un oggetto, dopo aver svolto l'azione, il personaggio torna allo stato "Idle", cambiando le animazioni in modo che rispecchino la situazione.

- *ReleaseState*
Quando il giocatore preme di nuovo il tasto per prendere un oggetto mentre il personaggio sta portando un oggetto, questo passa allo stato "Release" e lascia l'oggetto.
Come il suo stato opposto, una volta lasciato l'oggetto, il giocatore torna allo stato "Idle".

==== PlayerUI
#figure(caption: [Diagramma delle classi della UI del giocatore], image("imgs/class-player_ui.png", width: 90%))
Il giocatore presenta la sua UI personale che viene caricata insieme a il giocatore.
Nella UI viene visualizzato il numero di _training_data_ raccolti, divisi per tipo.

- *Collectibles*:
La classe "Collectibles" contiene i dati effettivi sul numero dei _training_data_ raccolti. Ogni volta che il valore viene aggiornato, manda il rispettivo segnale in modo da aggiornare il conteggio anche nella UI.

- *PlayerUI*:
La classe "PlayerUI" gestisce, appunto, la UI del giocatore. Riceve i segnali di "Collectibles" e aggiorna i valori. La classe è composta da 3 "PanelContainer", ognuno che contiene il numero del suo rispettivo tipo di _training_data_.

==== PlayerSavesHandler
La classe "PlayerSavesHandler" gestisce i salvataggi del giocatore. Vengono salvati tre attributi, il numero di ognuno dei _training data_ raccolti per i livelli.
Ogni volta che il giocatore raccoglie un _training data_, il valore viene aggiornato nella classe, e viene chiamato il metodo fornito dalla classe base _save_data()_ per salvare i dati nel file "./player_save.ini".

==== GrabItem
La classe "GrabItem" si occupa di controllare quando il giocatore si avvicina ad un oggetto che può prendere.
Il controllo viene fatto da un'"Area3D", quando un oggetto che può essere preso entra in quest'area, viene avvisato il giocatore che può afferrare l'oggetto.

==== ParticleEmitter
La classe "ParticleEmitter" si occupa di caricare le "GPUParticles3D", cioè le particelle o effetti, in specifiche condizioni. Ad esempio quando il giocatore salta, carica le particelle del salto, quando corre, carica il "fumo" della corsa.

=== Interazione
#figure(caption: [Diagramma degli oggetti con cui il giocatore può interagire],image("imgs/class-interactable.png"))
Nei livelli sono presenti diverse entità con cui il giocatore può interagire. Di seguito vengono descritte i diversi tipi di entità, e le classi che le compongono.
==== InteractableArea
Classe base astratta che fornisce i metodi alle classi figlie.
//da descrivere le funzioni, anche se sono abbastanza self explanatory
La classe è composta da una classe Area3D, che invia i segnali quando il giocatore entra ed esce, e da una classe "Control" che rappresenta la UI che il giocatore visualizza quando entra La classe è composta da una classe Area3D, che invia i segnali quando il giocatore entra ed esce, e da una classe "Control" che rappresenta la UI che il giocatore visualizza appena entra nell'area. 
==== Control
Di seguito vengono mostrati i vari tipi di UI che il giocatore può visualizzare quando entra nell'area.
#figure(caption: [Diagramma dei vari tipi di UI],image("imgs/class-input_prompts.png", width: auto))
- *SimpleProjectLabel*
Viene usata dalla classe "NPC" come messaggio semplice e rappresenta un elemento UI che viene proiettato nello spazio 2D della telecamera.
Appena il giocatore entra nell'area, la classe manda sé stessa come riferimento alla classe "CameraProjectUI". Questa la aggiunge all'array, attivando la classe.
Quando il giocatore esce, l'elemento viene tolto dall'array. 

- *InputButtonUI*
La classe "InputButtonUI" rappresenta un messaggio che contiene l'input da premere. L'immagine dell'input da premere cambia in base al dispositivo connesso: viene mostrato il tasto della tastiera se il giocatore sta utilizzando la tastiera, il tasto del joypad se sta utilizzando un joypad.
Il cambio dell'immagine dell'input viene chiamato dal segnale _device_changed_, mandato dal singleton "InputHandlerUI", con attributo il nome del controller collegato.
Questa classe viene usata da oggetti inanimati come un cartello.

- *InputButtonUIProject*
La classe "InputButtonUIProject" contiene sempre l'immagine dell'input da premere, l'unica differenza è che questo elemento viene proiettato nello spazio 2D della telecamera.
Viene usata dalla classe "NPCDialogue".

==== NPC
La classe "NPC" rappresenta un personaggio non giocabile che ha assegnato una semplice frase come messaggio. Questa frase viene visualizzata in una classe "SimpleProjectLabel" il cui funzionamento è stato spiegato nella sezione precedente.
Presenta anche una classe "Marker3D" che segna la posizione della UI, e una classe "NPCModel" che gestisce le animazioni del modello 3D del personaggio.
==== InteractableSign
La classe "InteractableSign" rappresenta un cartello che il giocatore può leggere. Il cartello può contenere diverse informazioni, come una lista o un grafico. Il contenuto del cartello è inserito in un'altra classe "Control".
==== NPCDialogue
La classe "NPCDialogue" rappresenta un personaggio non giocabile che, a differenza della classe "NPC", presenta un dialogo. Il giocatore può interagire con il personaggio e visualizzare il dialogo premendo il rispettivo tasto.
=== Dialoghi
Di seguito viene mostrato il funzionamento di un dialogo, insieme alle classi utilizzate per questo scopo.
#figure(caption: [Diagramma sul funzionamento di un dialogo],image("imgs/class-dialogue.png"))

==== Dialogue
La classe "Dialogue" gestisce l'andamento del dialogo, caricando i messaggi successivi in base all'ordine con cui sono stati inseriti nella scena. Vi sono due tipi di messaggi:
- *DialogueBoxSimple*
- *DialogueBoxOptions*
==== DialogueBoxSimple
La classe "DialogueBoxSimple" rappresenta un semplice messaggio all'interno del dialogo. Questa classe è anche responsabile di gestire gli input del giocatore. La funzione _on_interact_button_pressed()_ viene chiamata quando viene premuto il tasto dell'interazione e si occupa di gestire le azioni da svolgere.
==== DialogueBoxOptions
La classe "DialogueBoxOptions" eredita dalla classe "DialogueBoxSimple" e rappresenta un messaggio di dialogo con delle opzioni da scegliere.
Queste opzioni sono contenute dentro la classe "DialogueOptionsButtons"
Contiene due metodi che vengono chiamati in base al segnale mandato da "DialogueOptionsButtons":
- _on_correct_option_pressed()_
- _on_wrong_option_pressed()_
==== DialogueOptionsButtons
Questa classe contiene le opzioni da scegliere, ogni opzione è una classe "DialogueOptionButton", e viene inserita come nodo figlio nella scena.
Quando un'opzione viene selezionata, la classe invia il segnale _correct_option_pressed_ se la scelta è considerata giusta, _wrong_option_pressed_ nel caso sia considerata sbagliata.

=== Salvataggi
#figure(caption: [Diagramma sul funzionamento dei salvataggi],image("imgs/class-saves.png"))
==== Saves
Classe base astratta per tutte le classi che si occupano di salvare o caricare i dati dal file _.ini_.
Fornisce l'attributo _save_path_ che indica il percorso dove salvare il file _.ini_.
Inoltre fornisce i metodi virtuali _save_data_ e _load_data_ per salvare o caricare i dati. Questi due metodi sono sovrascritti nelle classi figlie.
==== SavesHandler
Classe base astratta per tutte le classi che gestiscono il cambio dei dati da salvare, fornisce i metodi virtuali per caricare o salvare i dati modificati e passarli alla classe che li salva nel file _.ini_.
Inoltre fornisce un attributo _debug_mode_, attivabile dall'editor. Se attivato, impedisce che vengano caricati i dati di salvataggio.  
=== Singletons / Autoloads
Per alcune classi vi era la necessità che fossero sempre disponibili per tutte le classi nel gioco. Godot permette di creare delle classi _Autoloads_, cioè classi che vengono caricate sempre nella scena, garantendo anche un'unica istanza della classe.
#figure(caption: [Classi _Autoloads_],image("imgs/class-autoloads.png", width: auto))
==== LevelsTransition
La classe "LevelsTransition" si occupa della transizione tra due classi. Il metodo _switch_level_ carica il livello il cui percorso è fornito come argomento della funzione. Il motivo per cui è stato usato il percorso come String anziché il livello stesso come "PackedScene" è stato per evitare riferimenti ciclici, in quanto se due livelli contenevano un riferimento a tra di loro nella scena, il gioco non caricava correttamente il livello successivo.
==== OptionsSave
"OptionsSave" è la classe che carica le impostazioni del gioco. Queste opzioni devono essere sempre disponibili, in quanto servono per applicare le modifiche fatte dal giocatore in qualsiasi momento, come la risoluzione alla finestra, il volume dell'applicazione, etc...
==== InputUIHandler
La classe "InputUIHandler" si occupa di controllare i dispositivi di input collegati, e mandare il segnale _device_changed_ nel caso il nome del dispositivo dell'ultimo input non corrisponda all'attributo _current_joy_.
Il metodo _check_minimum_input_left_strength_threshold()_ stabilisce la potenza minima che l'input deve superare per mandare il segnale. Questo perché alcuni controller presentano il problema del #gloss[drifting] e la classe potrebbe leggere input che non sono premuti dal giocatore.

== Struttura base livello
Ogni livello viene creato con le seguenti classi:
#figure(caption: [Diagramma di un livello base],image("imgs/class-base_level.png", width: auto))
=== Level
Classe del livello, non svolge molte funzioni visto che i componenti possono comunicare tra di loro attraverso segnali.
Gli attributi booleani _red_collectibles_, _blue_collectibles_ e _green_collectibles_ stabiliscono quali tipi di _training_data_ sono presenti nel livello, e quindi quali far visualizzare nella UI del giocatore.
=== PlayerSpawn
Classe che si occupa di generare il giocatore nella posizione in cui si trova.
Appena generato il giocatore viene assegnato alla classe "Level"
=== PauseMenu
La classe "PauseMenu", come dice il nome, è il menù di pausa, questo viene caricato quando il giocatore preme il rispettivo tasto, mettendo in pausa tutta la scena.

== Livello "Regressione lineare"
Di seguito viene descritto il funzionamento delle meccaniche principali del livello "Regressione lineare".
=== Cannone e grafico LR
#figure(caption: [Diagramma sul funzionamento di un grafico "Linear Regression" nel gioco],image("imgs/class-linear_regression.png"))
==== LRCannon
La classe "LRCannon" rappresenta il cannone nel livello. Eredita da "InteractableArea" e infatti il giocatore può interagirci quando entra dentro l'area apposita.
Quando il giocatore preme l'imput per interagire, la telecamera viene cambiata ed il giocatore entra nello stato "Interact".
La classe è composta da "CannonMesh" che si occupa della rotazione del cannone quando questo è attivo e quando viene inserito un nuovo punto nel grafico.
==== LinearRegressionGraph
Classe base astratta usata per i due tipi di grafico presenti nel livello: orizzontale e verticale.
Si occupa di svolgere le operazioni di regressione lineare per ottenere la formula della retta. Tuttavia, non si può applicare la formula ad un oggetto 3D.
La funzione _calculate_pos_rot_ si occupa di prendere due punti dalla formula della retta, per poi posizionare il rispettivo modello 3D in mezzo ai due punti e ruotarlo in modo che vada verso uno dei due punti.
La posizione globale viene poi modificata in base al tipo della classe.
== Livello "Albero di decisione"
Di seguito viene descritto il funzionamento della meccanica principale del livello "Albero di decisione".
#figure(caption: [Diagramma sul funzionamento dell'Albero di decisione],image("imgs/class-decision_tree_level.png", width: 90%))
=== DecisionTree
La classe "DecisionTree" è composta da più istanze di "DecisionNodeFinal" e "DecisionNodeIntermediate", inserite tutte come nodi figli nella scena.
Si occupa di inviare i segnali agli altri nodi presenti nel livello.
=== DecisionNode
Classe base astratta per i due tipi di "DecisionNode" presenti nell'albero: _intermediate_ e _final_.
Fornisce i metodi virtuali _on_area_3d_body_entered_ e _on_area_3d_body_exited_ che vengono chiamati quando entra un oggetto di tipo "CharacterBody3D" nell'area sopra la piattaforma.
Il comportamento poi viene modificato dalle classi figlie.
- *DecisionNodeIntermediate*: quando entra il giocatore nell'area, viene visualizzata la UI con le indicazioni da seguire;
- *DecisionNodeFinal*: quando entra un cane nell'area, controlla se l'id di questo corrisponde all'id associato all'istanza.
=== DogBreedsSign
Oltre all'albero di decisione nel livello è presente anche un cartello con cui il giocatore può interagire e visualizzare le razze die cani che ha indovinato.\
La classe "DogBreedsSign" rappresenta questo cartello. Questa, è composta da una classe "DogSignUI" che è il contenuto del catello, contenente tutte le razze dei cani che il giocatore ha indovinato.\
Quando il cartello viene chiuso, emette il segnale _hide_grid_ che chiama il metodo _on_dog_breed_sign_hide_grid_ nella classe "CheckUnlocked"
=== CheckUnlocked
La classe "CheckUnlocked" si occupa di controllare le razze di cani sbloccate e tenere il conto di quelle nuove che il giocatore non ha ancora controllato, nell'attributo _td_to_give_.\
Il valore di questo attributo viene modificato all'inizio del caricamento del livello e quando il giocatore indovina una nuova razza nell'albero di decisione, ed è la differenza tra l'attributo _value_ e il valore _td_given_.
Al caricamento del livello, riceve il segnale _data_loaded_ dal nodo che gestisce i salvataggi "DTSavesHandler", assegna il valore dell'attributo _td_given_.
Quando riceve il segnale _new_breed_unlocked_ dall'albero di decisione, _value_ aumenta di 1, ed aggiorna il valore di _td_to_give_.
Quando riceve il segnale _hide_grid_ dal cartello, chiama la funzione per generare i _training_data_ tanti quanti il valore di _td_to_give_.
=== CollectibleSpawner
La classe "CollectibleSpawner" si occupa di generare dei _training_data_ all'interno del livello.
Il tipo di _training_data_ generato viene deciso da quale tra i tre attributi presenti, _load_red_, _load_blue_ e _load_green_ hanno valore uguale a "true".
Il metodo _generate_collectibles_ prende il percorso del _training_data_ giusto e poi chiama _load_collectible_ per generarli.
=== DTSavesHandler
La classe "DTSavesHandler" gestisce i salvataggi ed il cambio di valore delle variabili del livello.
Quando vengono caricati i dati dal salvataggio, la classe manda il segnale _data_loaded_ alla classe "CheckUnlocked", per assegnare il valore dei _training_data_ già generati in una sessione precedente.
Il segnale viene anche mandato al DecisionTree per modificare il valore iniziale dell'array della classe.
== Livello "Causalità"
Di seguito viene descritto il funzionamento delle meccaniche principali del livello "Causalità".
#figure(caption: [Diagramma del livello della causalità],image("imgs/class-causality_level.png"))

=== ACUnit
"ACUnit" è la classe che rappresenta un condizionatore. Eredita da "InteractableArea", il giocatore, quando entra nell'area, può premere il tasto di interazione per accenderlo.
Quando viene acceso, il valore dell'array nodo padre, in questo caso "ACUnits", viene aggiornato con il giusto indice.
=== ACUnits
La classe "ACUnits" si occupa di gestire tutte le istanze di "ACUnit", inserite come nodi figli nella scena.
Quando viene acceso un condizionatore, emette il segnale _unit_turned_on_, passando direttamente l'array aggiornato come argomento nel segnale.
Quando tutti i condizionatori sono stati accesi, manda il segnale _all_units_on_, usato in questo caso per far iniziare la scene di intermezzo.
=== CutscenesHandler
La classe "CutsceneHandler" si occupa di gestire le scene di intermezzo nel livello, inserite come nodi figli nella scena. Nonstante la classe è stata pianificata per gestire più scene, alla fine ne è presente solo una. Questa classe svolge anche il ruolo da mediatore, ricevendo i segnali dal livello e mandandoli ai nodi figli, gestendo il traffico dei segnali.
=== CausalitySavesHandler
"CausalitySavesHandler" gestisce i salvataggi e cambio di variabili all'interno del livello "Causality". In questa classe, le variabili sono salvate in un Dictionary. Quando i salvataggi vengono caricati, la classe emette il segnale _data_loaded_.
=== Scena di intermezzo
Di seguito viene descritto il funzionamento della scena di intermezzo.
==== CrashCutscene
La classe che gestisce la scena di intermezzo principale del livello.
Si occupa principalmente di inviare i segnali per iniziare correttamente la scena.
Quando il giocatore accende l'ultimo condizionatore, viene emsso il segnale _change_values_. Se invece il livello viene caricato con già tutti i condizionatori accessi, viene emesso il segnale _change_specific_values_.
==== Gestione dei personaggi non giocabili
Dopo la scena di intermezzo, alcuni personaggi possono cambiare il dialogo a loro assegnato, oppure il comportamento con il giocatore.
#figure(caption: [Diagramma sul funzionamento dei personaggi non giocabili nella scena di intermezzo],image("imgs/class-cutscene_npc.png"))

*ChangeNPCScientistBehaviour*\
Questa classe si occupa di cambiare il comportamento del rispettivo personaggio non giocabile.
Viene assegnata ad un nodo figlio del nodo del personaggio.
All'inizio del livello, il personaggio presenta un dialogo predefinito e non si gira quando parla con il giocatore.
Dopo aver ricevuto il segnale _change_values_ dalla classe "CrashCutscene", sostituisce il dialogo del personaggio con il dialogo assegnato alla classe, e cambia il comportamento, in modo che si giri e cambi animazione quando parla con il giocatore.
Inoltre, dopo che il giocatore risponde correttamente alla domanda del nuovo dialogo, il comportamento cambia di nuovo, e viene tolto il dialogo, rimpiazzando il messaggio automatico che appare quando il giocatore entra nell'area di interazione.\

*ChangeNPCIceCreamBehaviour*\
Questa classe si occupa di cambiare il comportamento del rispettivo personaggio non giocabile.
Viene assegnata ad un nodo figlio del nodo del personaggio.\
Funziona nello stesso modo della classe descritta prima, però avviene solo un cambio del dialogo e non c'è la modifica del comportamento.

*NPCIceCreamSave*\
Lo scopo della classe "NPCIceCreamSave" è quello di caricare il gruppo di persone davanti alla gelateria nel caso il livello venga caricato quando già tutti i condizionatori sono stati accesi.\
Le persone vengono caricate quando la classe riceve il segnale _change_specific_values_, in quanto vengono caricate solo ed esclusivamente al caricamento del livello.\

*ChangeSignUI*\
Questa classe si occupa di cambiare il contenuto del rispettivo cartello.
Viene assegnata ad un nodo figlio del nodo del cartello.\
Funziona nello stesso modo delle classi che cambiano il dialogo o comportamento dei personaggi. Quando riceve il segnale _change_values_, cambia il contenuto del cartello, rimpiazzandolo con l'istanza assegnata alla classe.

==== Gestione degli elementi da animare
#figure(caption: [Diagramma sul funzionamento degli elementi da animare nella scena di intermezzo],image("imgs/class-cutscene_animate.png"))
*CrashCutsceneCamera*\
La classe "CrashCutsceneCamera" rappresenta la telecamera che inquadra gli oggetti nella scena di intermezzo. Eredita da "Camera3D".\
La telecamera viene impostata come corrente quando la scena inizia, e si occupa di mandare i segnali nel giusto momento tramite un "AnimationPlayer", presente come nodo figlio. Il lavoro di questo è semplicemente chiamare i metodi presenti nella classe della telecamera, che a loro volta inviano i segnali.\

*PathCutscene*\
Questa classe rappresenta un punto che percorre una linea in un determinato percorso. Viene utilizzato dai "FollowNPC" per capire la direzione da seguire per arrivare alla giusta destinazione.
Non appena riceve il segnale _start_following_ dalla telecamera, il punto inizia a percorrere il percorso, chiamando tutti i nodi figli, in questo caso "FollowNPC" a seguire il punto.\

*FollowNPC*\
Classe che eredita da un semplice "CharacterBody3D". Rappresenta un personaggio che segue il punto "PathCutscene" per arrivare a destinazione.
Il metodo _start_following_ viene chiamato dal nodo genitore, per far iniziare a seguire il punto. Ogni personaggio ha una sua velocità variabile, il cui valore è contenuto nell'attributo _speed_.
Il metodo _stop_following_, invece, fa sistemare il personaggio in una poszione vicina, prima di fermarlo chiamando il metodo _stop_.\

*AreaStopFollow*\
Classe che si occupa a far fermare i personaggi nel seguire il punto nel percorso.
Quando un personaggio entra nell'area, fa emttere alla classe il segnale _body_entered_ che chiama il metodo _on_body_entered_ mandando il personaggio come argomento. Qui la classe chiama il metodo del personaggio _stop_following_.

*CutsceneEmitParticles*\

*Apartment*\

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