#let documento(contenuto) = {
  set text(font: "Arial", size: 12pt, fill: black, lang: "it")

  set par(justify: true, linebreaks: "optimized", first-line-indent: 0em)
  show link : set text(font: "Jetbrains Mono");

  set align(center)
  /*par(justify: false, text(hyphenate: false, size: 28pt, fill: black, [Università degli Studi di Padova]))
  par(
    justify: false,
    text(weight: "thin", hyphenate: false, size: 20pt, fill: black, [Laurea Triennale in Informatica]),
  )*/
  //Logo
  align(center, grid(rows: (1fr,1.2fr,0.3fr,0.5fr,1.2fr,0.2fr,0.3fr,0.3fr),
    image("imgs/logo_zucchetti.png", height: 7.5em),
    image("imgs/logo_unipd.png", height: 12em),
    par(
    justify: false,
    text(weight: "thin", hyphenate: false, size: 25pt, fill: black, [Tirocinio Curriculare]),
  ),
  par(justify: false, text(weight: "thin", hyphenate: false, size: 25pt, fill: black, [Laurea Triennale in Informatica])),
  // Titolo
  par(justify: false, text(weight: "bold", hyphenate: false, size: 42pt, fill: black, [Piano di Lavoro])),
  // Autore
  par(justify: false, text(hyphenate: false, size: 20pt, fill: black, [Filippo Sabbadin])),
  par(justify: false, text(hyphenate: false, size: 16pt, fill: black, [2010008])),
  //par(justify: false, text(hyphenate: false, size: 20pt, fill: black, [2010008]))

  // Data
  //par(justify: false, text(hyphenate: false, size: 15pt, fill: black, [18 Giugno 2025]))))
  ))
  pagebreak()
  // contenuto
  set page(header: [#grid(
      columns: (5fr, 4fr),
      align: horizon,
      "Filippo Sabbadin\n2010008\nPiano di lavoro stage c/o Zucchetti Spa",
      [#align(end,image("imgs/logo_zucchetti.png", height:3em))],
    )
  ])
  
  set page(numbering: "- 1 -", margin: (top: 8em))
  set align(left)
  show heading : it => [
    #it
    #v(1em)
  ]

  counter(page).update(1)
  contenuto
}
