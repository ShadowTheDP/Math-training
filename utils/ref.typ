#import "utils.typ": *

#let ref_setup(
  fontsize: 10pt,
  mathenv-counter-depth: 2,
  equation-counter-depth: 1,
  body
) = {
  let rem = rem.with(base: fontsize)

  set cite(style: "alphanumeric")

  show ref: it => context {
    let el = it.element
    if not has(el) { return it }
    let kind = if el.has("kind") { el.kind } else { none }
    let loc = el.location()
  
    if kind == "math-theorem" {
      let c = counter(kind).at(loc)
      if c.len() < mathenv-counter-depth { c.push(0) }
      let t = c.pop()
      c.push(t + 1)
      return el.supplement + " " +  link(it.target, c.map(str).join("."))
    } 
    if kind == "math-equation" {
      let c = counter(kind).at(loc)
      if c.len() < equation-counter-depth { c.push(0) }
      let t = c.pop()
      c.push(t + 1)
      return link(it.target, "(" + c.map(str).join(".") + ")")
    }

    it
  }

  show cite: it => {
    show regex("[A-Za-z0-9]"): set text(fill: colors.citation)
    it
  }
  
  body
}