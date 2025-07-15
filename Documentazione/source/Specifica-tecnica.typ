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

== Riferimenti
=== Riferimenti normativi

=== Riferimenti informativi

=== Riferimenti tecnici

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
  [Typst],[],[],
  [\u{002A}.csv],[],[-],
  [\u{002A}.ini],[],[-],
  table.cell([*Softwares*], colspan: 3),
  [Godot],[],[4.4.1-stable-mono],
  [Blender],[],[4.4.3],
  [GIMP],[],[3.0.4],
  table.cell([*Strumenti e serivzi*], colspan: 3),
  [Git],[],[2.50.1],
  [GitHub Actions],[],[-]
))

= Architettura
== Premessa
== Assets comuni
=== Giocatore
#figure(caption: [Diagramma delle classi del giocatore],image("imgs/class-player.png"))
==== Telecamera
#figure(caption: [Diagramma delle classi del giocatore],image("imgs/class-camera.png"))
==== State Machine
==== Collezionabili
=== Interazione
#figure(caption: [Diagramma degli oggetti con cui il giocatore può interagire],image("imgs/class-interactable.png"))
==== Cartelli
==== NPC
==== Dialoghi
#figure(caption: [Diagramma sul funzionamento di un dialogo],image("imgs/class-dialogue.png"))
=== Salvataggi
=== LevelLoader
== Menu
=== Menu di pausa
=== Menu principale
== Livello "Regressione lineare"
=== Cannone
=== Grafico
== Livello "Albero di decisione"
=== Albero
== Livello "Causalità"

= Requisiti soddisfatti
== Tabella requisiti soddisfatti
== Grafico requisiti soddisfatti