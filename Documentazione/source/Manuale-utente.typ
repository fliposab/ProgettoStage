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
Lo scopo di questo documento è quello di fornire una guida all’utilizzo del prodotto, spiegandone l’installazione, i requisiti consigliati per garantire il corretto funzionamento dell’applicazione, le funzionalità principali e le modalità di utilizzo.

== Scopo del prodotto
Il progetto consiste nello sviluppo di un videogioco con il motore di gioco #gloss[Godot] di tipo #gloss[platformer], in cui il giocatore controlla un personaggio che si muove in un ambiente tridimensionale.\
Il gioco si basa su temi di #gloss[Intelligenza Artificiale] e #gloss[Machine Learning], sviluppando meccaniche ed elementi del livello basati su questi argomenti.\
Il gioco comprende 3 livelli, ognuno con un tema diverso, un menu principale che viene visualizzato non appena il gioco viene avviato, e un menu di pausa che può essere visualizzato in qualsiasi momento durante il gioco.

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
- Glossario:\
#link("https://github.com/fliposab/ProgettoStage/blob/main/Documentazione/Glossario.pdf")
\

= Requisiti consigliati
== Requisiti hardware

= Installazione ed esecuzione
Il gioco può essere scaricato dalla seguente pagina:\
#link("https://github.com/fliposab/ProgettoStage/releases")\

Nella pagina si troveranno due versioni:
- 0.1.0: versione #gloss[PoC]
- 1.0.0: versione #gloss[MVP]

Selezionare la versione desiderata, il sistema operativo corrispondente alla macchina che si sta usando ed estrarre il pacchetto zip dentro una cartella.\
Il gioco è un eseguibile e può essere avviato senza bisogno di altri programmi.

= Mappatura comandi
Di seguito viene riportata la mappatura degli input del gioco. Per aiutare comunque il giocatore e rendere l'esperienza più fluida, i tasti vengono mostrati anche durante l'esecuzione del gioco.
== Tastiera
La tastiera è la periferica utilizzata maggiormente durante lo sviluppo del gioco. Nonostante non sia stata sviluppata per atività di gioco, una corretta disposizione dei tasti può comunque garantire una posizione rilassata del giocatore.
#figure(caption: [Tastiera], image("imgs/keyboard.jpg",width:90%))
- *WASD*:
- *Frecce direzionali*:
- *Barra spaziatrice*:
- *E*:
- *Q*:
- *R*:
- *Invio*:
- *Esc*:\
\
- Il gioco non richiede la presenza di un tastierino numerico nella tastiera.
- Il gioco non prevede l'utilizzo di un mouse.
- La lingua della tastiera non è importante, ma è comunque consigliato che abbia caratteri alfanumerici.

== Controller
In generale i controller sono sviluppati per essere usati con una #gloss[console], e differiscono nei simboli mostrati sui tasti.
Per risolvere questo problema, durante la sessione di gioco, viene mostrata un'interfaccia universale dei tasti del controller.\
Ad esempio, le coppie A/B e X/Y sono invertite tra i controller Xbox e Nintendo, mentre i controller DualShock/DualSense utilizzano i simboli Triangolo/Croce/Cerchio/Quadrato.\
#figure(caption: [Tasti controller Xbox],image("imgs/controller-diagram.png"))
In questo esempio verranno riportati i tasti di un controller Xbox, visto che sono i più compatibili con giochi eseguiti su PC.\
La mappatura dei comandi è la seguente:

- *Levetta analogica sinstra*: movimento del personaggio
- *Levetta analogica destra*: movimento telecamera
- *A*: salto
- *B*: interagisci
- *X*: 
- *Y*: Cambia oggetto / arma
- *D-Pad*: Navigazione nei menu

// Metter il trademark di xbox nel footer
= Navigazione
== Menu Principale
#figure(caption: [Menu principale], image("imgs/menu_principale.png",width:90%))
Appena avviato, il gioco mostrerà la schermata principale con le seguenti opzioni:
- *Carica partita*: disponibile solo se sono presenti dati di salvataggio, porta il giocatore al livello principale tenendo i progressi salvati nelle sessioni precedenti.
- *Nuova partita*: elimina tutti i dati di salvataggio, se presenti, e porta il giocatore al livello principale.
- *Opzioni*: apre il menù delle opzioni dove il giocatore può modificare alcuni valori del gioco come la risoluzione della finestra, la qualità delle ombre e la lingua del gioco.
- *Esci dal gioco*: chiude il gioco.
== Opzioni
#figure(caption: [Opzioni con valori predefiniti], image("imgs/menu_opzioni.png",width:90%))
Il menu opzioni permette di cambiare alcuni valori del gioco, grafica e lingua.\
I valori predefini sono stati selezionati in modo da garantire un buon rapporto tra qualità dell'immagine e prestazioni.\
Quando il giocatore passa sopra una delle opzioni, viene fornita una sua breve descrizione sotto. Il giocatore può cambiare i seguenti valori:
- *Modalità finestra*: il giocatore può scegliere se giocare in modalità finestra o mettere il gioco a schermo intero occupando tutto lo spazio dello schermo.
- *Risoluzione finestra*: il giocatore può scegliere la risoluzione per quando gioca in modalità finestra, questa si adatterà alla scelta del giocatore. Cambiare questa opzione in modalità schermo intero non ha nessun effetto.
- *Scala risoluzione*: valore a cui la risoluzione del gioco viene moltiplicata. La differenza rispetto all'opzione precedente sta nel fatto che la finestra mantiene le dimensioni quando viene modificata. Utile se si sta giocando a schermo intero.
- *FPS Massimi*: rappresenta il numero massimo di fotogrammi in un secondo. Un valore più alto risulta in un video più fluido, ma richiede più risorse.\ Nota: questo valore non può superare la frequenza di aggiornamento dello schermo.
- *Anti-Aliasing*: tecnica che riduce l’effetto “scalettatura” (aliasing) sui bordi degli oggetti, rendendo le immagini più lisce e meno frastagliate.\ Offre le seguenti opzioni:
  - Nessuno: non viene applicata alcuna tecnica di anti-aliasing.
  - FXAA: Fast Approximate Anti Aliasing, tecnica di anti-aliasing che applica un filtro rapido alle immagini per ridurre l’effetto “scalettatura” senza richiedere molta potenza di calcolo. Offre un buon compromesso tra qualità visiva e prestazioni.
  - MSAA 2x: Multi-Sample Anti-Aliasing a 2 campioni. Tecnica che migliora la qualità dei bordi degli oggetti campionando ogni pixel più volte e mediando i risultati, riducendo l’aliasing con un impatto moderato sulle prestazioni.
  - MSAA 4x: Multi-Sample Anti-Aliasing a 4 campioni. Tecnica che migliora molto la qualità dei bordi degli oggetti campionando ogni pixel più volte e mediando i risultati, riducendo l’aliasing con un impatto alto sulle prestazioni.
- *Qualità delle ombre*: Modifica la risoluzione delle ombre. Il valore va da "alto" a "molto basso", ovviamente, un valore alto ha un impatto molto più significativo sulle prestazioni rispetto a "molto basso".
- *Lingua*: cambia la lingua del gioco. La modifica viene applicata subito e non è necessario un riavvio del gioco.

== Menu di pausa
#figure(image("imgs/menu_pausa.png", width: 90%), caption: [Menu di pausa])
Il menu di pausa è accessibile in qualsiasi momento durante il livello quando il giocatore è libero di muoversi.
Premendo il tasto apposito, il gioco viene fermato e viene visualizzato il menu.
Il giocatore può scegliere le seguenti azioni:
- *Riprendi*: riprende il gioco. SI può anche premere lo stesso tasto di pausa per eseguire questa azione.
- *Torna al livello hub*: disponibile solo se il giocatore non è già nel livello hub. Salva la partita e riporta il giocatore al livello principale.
- *Opzioni*: apre il menu delle opzioni.
- *Torna al menu principale*: salva la partita e porta il giocatore al menu principale-
- *Salva ed esci dal gioco*: salva la parita e chiude il gioco. Attenzione a non chiudere il gioco attraverso la toolbar della finestra o scorciatoie del sistema operativo (ad esempio "Alt+F4"), visto che questi metodi NON salvano la partita.
= Livelli
Il gioco comprende 3 livelli da completare + 1 livello dove il giocatore può scegliere che livelli da giocare.

== Livello hub / principale

Il giocatore viene sempre portato in questo livello dopo la schermata principale. Da qui può scegliere uno dei tre livelli avvicinandosi a uno dei "tubi" presenti:
- *Regressione lineare*: indicato dal tubo rosso.
- *Albero di decisione*: indicato dal tubo verde.
- *Causalità*: indicato dal tubo blu.

== Livello "Linear Regression"

== Livello "Decision Tree"
*Pastore australiano*:\
*Beagle*:\
*Border Collie*:\
*Boston Terrier*:\
*Cocker Spaniel*:\
*Corgi*:\
*Bassotto*:\
*Pastore tedesco*:\
*Golden Retriever*:\
*Husky*:\
*Volpino*:\
*Barboncino*:\
*Rottweiler*:\
*Shiba Inu*:\
*Shin Tzu*:\

== Livello "Causality"