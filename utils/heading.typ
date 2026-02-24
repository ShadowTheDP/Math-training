#import "utils.typ": *

#let heading_setup(
  fontsize: 10pt,
  mathenv-counter-depth: 2,
  graph-depth: 1,
  body
) = {
  show heading: set text(font: fonts.sans-serif, size: rem(1))

  let rem = rem.with(base: fontsize)

  let custom-numbering(..nums) = {
    let ns = nums.pos()
    if ns.len() == 1 {
      str(ns.at(0) - 1) + "."
    } else {
      (ns.at(0) - 1, ..ns.slice(1)).map(str).join(".") + "."
    }
  }
  
  set heading(numbering: custom-numbering)
  
  show heading.where(level: 1): it => {
    colbreak(weak: true)
    context {
      let c = counter(heading).get()
      set text(size: rem(1.75))
      block(below: rem(5),
        v(rem(10)) + 
        text(font: "Charter", size: rem(1.5), "C H A P T E R    ") +
        text(font: "Charter", size: rem(3), str(c.at(0) - 1)) +
        v(rem(0)) +
        text(font: "Charter", size:rem(2.5), it.body)
      )
      
      if mathenv-counter-depth > 0 {
        counter("math-theorem").update((c.at(0) - 1, 0))
      }
      if graph-depth >= 1 {
        counter("graph").update(0)
      }
    }
  }
  
  show heading.where(level: 2): it => {
    set text(size: rem(1.5))
    context {
      let c = counter(heading).get()
      block(above: rem(2), below: rem(1.25),
        (c.at(0) - 1, ..c.slice(1)).map(str).join(".") + "." +
        " " + it.body
      )
      counter(figure.where(kind: "graph")).step(level: 3)
      counter("graph").update(0)
      if mathenv-counter-depth > 1 {
        // No need to step here unless we want depth-3 numbering for math
      }
      if graph-depth >= 2 {
        counter("graph").update(0)
      }
    }
  }
  
  show heading.where(level: 3): set text(size: rem(1.125))
  
  body
}

#let quote(author: "", body) = {
  set align(right)
  block(width: 85%,
    emph(body)
  )
  "----- "  + emph(author)
}