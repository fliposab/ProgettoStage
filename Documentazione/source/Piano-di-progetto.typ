#import "format.typ": *
#import "@preview/i-figured:0.2.4"

#show: doc => documento(titolo: "Piano di progetto",
doc)
// spaciugo per aggiungere l'indice delle immagini
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
Per facilitare la comprensione del documento, è stato creato un glossario che contiene i termini utilizzati nel documento e le loro definizioni.\
Il glossario è accessibile tramite il link [Glossario](glossario.typ) oppure consultando il rispettivo documento all'interno della stessa cartella.

== Riferimenti
=== Riferimenti normativi
- Norme di progetto:\
link
=== Riferimenti informativi

= Analisi dei rischi
== Rischi tecnici
== Rischi di analisi e Progettazione

= Pianificazione del lavoro

= Periodi di sviluppo
== Introduzione
== Settimana 1
== Settimana 2
== Settimana 3
== Settimana 4
== Settimana 5
== Settimana 6
== Settimana 7
== Settimana 8