#let documento(
  titolo: "Titolo del documento",
  autore: "Filippo Sabbadin",
  //versioni : (
  //   "0.1.0","Data","Autore","Cambiamenti","Verificatore",
  //),

  
  contenuto,
) = {
  set text(font: "Noto Sans")
  set text(size: 11pt)
	set text(lang: "it")
  set par(justify: true, linebreaks: "optimized",first-line-indent:0em)
  show link : set text(font:"Jetbrains Mono");
/*
  grid(
    columns: (1fr, 1fr),
    align : horizon,
    
    align(left, 
    image("images/logo_unipd.png", height: 6em),
    ), 
    align(right,
    box(
      align(center)[
      #image("images/logo_extended.jpg", width: 13em)
      #v(0em)
      #text(size: 10pt, fill: rgb("#424242"),
      link("mailto:unipd.codehex16@gmail.com"))
      ]
    )
    )
  )*/
  
  set align(center)

  (image("imgs/logo_zucchetti.png", width: 400pt))
  linebreak()
  (image("imgs/logo_unipd.png", width: 250pt))

  linebreak()
  linebreak()
  linebreak()

  set align(center)
  par(
    justify: false, 
    text(46pt, weight: "bold", fill: black, hyphenate: false)[AI TrAIning]
  )
  linebreak()
  // Titolo
  set align(center)
  par(
    justify: false, 
    text(32pt, weight: "black", fill: black, hyphenate: false)[#titolo]
  )

  linebreak()
  linebreak()
  linebreak()
  linebreak()
  linebreak()
  //Autore
  set align(center)
  par(
    justify: false, 
    text(16pt, fill: black, hyphenate: false)[#autore]
  )

  // Indice
  pagebreak()
  
  set page(
    margin: (top: 4cm, bottom: 4cm, left: 2cm, right: 2cm),
    header: [
      #grid(
        align: horizon, 
        columns: (1fr, 1fr),
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


  pagebreak()

  // CONTENUTO
  set page(numbering: "1")
  set align(left)
  set heading(numbering: "1.")
  show heading.where(level: 1): it => {   
    pagebreak(weak: true)
    align(center)[
      #text(size: 20pt)[#it]
    ]
  }
  show heading : it => [
    #it
    #v(1em)
  ] 

  show heading.where(level: 2): set text(size: 18pt)
  show heading.where(level: 3): set text(size: 16pt)
  show heading.where(level: 4): set text(size: 14pt)
  show heading.where(level: 5): set text(size: 13pt)
  show heading.where(level: 6): set text(size: 12pt)
  show heading.where(level: 7): set text(size: 11pt)

  
  counter(page).update(1)
  contenuto
}

#let gloss(body) = {
  [#text(blue, size:12pt, font: "Noto Sans")[#underline[#body]\*]]
}


#let pseudoheading(body) = {
  set text(size: 14pt, font: "Noto Sans")
  set text(weight: "bold")
  set align(center)
  set par(justify: false)
  smallcaps(body)
}