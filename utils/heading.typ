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
    if ns.len() > 0 {
      let first = ns.at(0) - 1
      ns = (first,) + ns.slice(1)
    }
    ns.map(str).join(".") + "."
  }
  
  set heading(numbering: custom-numbering)
  
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    counter("heading").step(level: 1)
    context {
      let c = counter(heading).get()
      set text(size: rem(1.75))
      block(below: rem(5),
        v(rem(10)) + 
        text(font: "Charter", size: rem(1.5), "C H A P T E R    ") +
        text(font: "Charter", size: rem(3), show-counter(c, none)) +
        v(rem(0)) +
        text(font: "Charter", size:rem(2.5), it.body)
      )
      if c.first() != 0 {
        if mathenv-counter-depth > 1 {
          counter("math-theorem").step(level: 1)
        }
        if graph-depth >= 1 {
          counter("graph").update(0)
        }
      }
    }
  }
  
  show heading.where(level: 2): it => {
    set text(size: rem(1.5))
    counter("heading").step(level: 2)
    context {
      let c = counter(heading).get()
      block(above: rem(2), below: rem(1.25),
        show-counter(c, ".") +
        " " + it.body
      )
      counter(figure.where(kind: "graph")).step(level: 3)
      counter("graph").update(0)
      if c.first() != 0 {
        if mathenv-counter-depth > 2 {
          counter("math-theorem").step(level: 2)
        }
        if graph-depth >= 2 {
          counter("graph").update(0)
        }
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