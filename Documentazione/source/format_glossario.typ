#let documento(
  titolo: "Titolo del documento",
  email: "unipd.codehex16@gmail.com",
  data: [],
  versioni: (
    "0.1.0",
    "Data",
    "Autore",
    "Cambiamenti",
    "Verificatore",
  ),
  ruoli: (),
  contenuto,
) = {
  set text(font: "Noto Sans")
  set text(size: 12pt)
  set text(lang: "it")
  set par(justify: true, linebreaks: "optimized", first-line-indent: 1em)
  show link: set text(font: "Jetbrains Mono")

/*
  grid(
    columns: (1fr, 1fr),
    align: horizon,
    align(
      left,
      image("images/logo_unipd.png", height: 6em),
    ),
    align(
      right,
      box(
        align(center)[
          #image("images/logo_extended.jpg", width: 13em)
          #v(0em)
          #text(size: 10pt, fill: rgb("#424242"), link("mailto:unipd.codehex16@gmail.com"))
        ],
      ),
    ),
  )

*/
  // Titolo
  set align(center)
  align(horizon)[
    #set par(justify: false)
    #text(28pt, weight: "black", fill: black, hyphenate: false)[#titolo]
/*
    #table(
      columns: (auto, auto),
      align: left,
      inset: 10pt,
      stroke: none,
      [*Data*], [#data],
      table.hline(stroke: 0.5pt),
      [*Versione*], [#versioni.at(0)]
    )*/

  ]

  // Ruoli
/*
  set align(left)
  align(bottom)[
    #table(
      columns: (auto, auto),
      stroke: none,
      table.vline(start: 1, x: 1, stroke: 0.5pt),
      inset: 10pt,
      table.header(text(size: 14pt)[*Ruoli*]),
      ..ruoli
    )
  ]

  // Versionamento
  pagebreak()
  text(size: 16pt, weight: "black", "Registro delle Versioni")
  show table.cell: it => [
    #set par(justify: false)
    #text(hyphenate: false, it)
  ]

  table(
    align: left,
    columns: (auto, auto, auto, auto, auto),
    fill: (x, y) => if (y == 0) { luma(230) },
    inset: 10pt,
    table.header(
      [*Versione*],
      [*Data*],
      [*Autore*],
      [*Cambiamenti*],
      [*Verificatore*],
    ),
    ..versioni
  )
*/
  // Indice
  pagebreak()

  set page(
    margin: (top: 4cm, bottom: 4cm, left: 2cm, right: 2cm),
    header: [
      #grid(
        align: horizon,
        columns: (1fr, 1fr),
        //align(left)[#image("images/logo.jpg", width: 2em)], align(right)[#titolo],
      )
      #line(length: 100%, stroke: 0.5pt)
    ],
    numbering: "I",
    footer: [
      #align(center, line(length: 15%))
      #context { align(center, counter(page).display(page.numbering)) }
    ],
  )
  counter(page).update(1)


  show outline.entry.where(level: 1): it => {
    v(1.5em, weak: true)
    strong(it)
  }
  outline(title: [Indice], indent: auto)

  // CONTENUTO
  set page(numbering: "1")
  set align(left)
  set heading(numbering: none)
  show heading.where(level: 1): it => [
    #text(size: 35pt, it)
  ]
  show heading: it => [
    #it
  ]
  counter(page).update(1)
  contenuto
}