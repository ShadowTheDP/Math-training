#import "utils.typ": *

#import "math.typ": eqn, mathenv, proof, claim_p, corollary, definition, example, lemma, lemma_p, problem, property, proposition, remark, solution, subproof, theorem

#import "graph.typ": broken, normal, point, midpoint, length, foot, centroid,  circumcenter, orthocenter, incenter, excenter, get_circle_equation, get_line_equation, IP_cc, IP_lc, IP_ll, parallel_lp, perpendicular_lp, point_on_circle, reflection_line, reflection_point, graph

#import "heading.typ": quote

#let init(
  fontsize: 10pt,
  ..args,
  body
) = {
  import "utils.typ": *
  import "fonts.typ": fonts_setup
  import "heading.typ": heading_setup
  import "math.typ": math_setup
  import "style.typ": style_setup
  import "ref.typ": ref_setup
  import "graph.typ": graph_setup
  
  let mathenv-counter-depth = args.at("mathenv-counter-depth", default: 2)
  let equation-counter-depth = args.at("equation-counter-depth", default: 1)
  let graph-depth = args.at("graph-depth", default: 2)
  let doc = args.at(
    "doc",
    default: (
      title: "Mathematics",
      author: "ShadowTheDP",
      date: auto
    )
  )
  let quote = args.at("quote", default: "live and learn")
  let book_title = args.at("book_title", default: "Mathematics")
  
  let rem = rem.with(base: fontsize)
  
  show: style_setup.with(
    fontsize: fontsize,
    doc: doc
  )

  show: fonts_setup.with(
    fontsize: fontsize
  )
  
  show: heading_setup.with(
    fontsize: fontsize,
    mathenv-counter-depth: mathenv-counter-depth,
    graph-depth: graph-depth
  )

  show: math_setup.with(
    fontsize: fontsize,
    mathenv-counter-depth: mathenv-counter-depth,
    equation-counter-depth: equation-counter-depth,
  )

  show: ref_setup.with(
    fontsize: fontsize,
    mathenv-counter-depth: mathenv-counter-depth,
    equation-counter-depth: equation-counter-depth,
  )

  show: graph_setup.with(
    fontsize: fontsize
  )
  
  set page(
    numbering: "1 / 1",
    header: [
      #strong(doc.author) --- #quote #h(1fr) #underline[#strong(doc.title)]
    ]
  )
  
  set outline(title: none, indent: rem(2.5))

  show outline: it => {
    text(
      fill: colors.outline-title, size: rem(1.75),
      font: fonts.sans-serif, weight: "bold",
      [Table of Contents]
    )
    v(rem(1.5))
    it
    pagebreak()
  }
  show outline.entry.where(level: 1): it => {
    v(rem(1), weak: true)
    text(weight:"bold", font:fonts.sans-serif, it)
  }
  show outline.entry.where(level: 2): it => {
    v(rem(0.5))
    it
  }

  show bibliography: it => {
    text(
      size: rem(1.5), font: fonts.sans-serif, weight: "bold",
      [References]
    )
    it
  }

  titlepage[
    #v(2em)
    #block(
      inset: rem(1.5),
      stroke: 1pt + black,
      text(size: rem(1.75))[#strong(doc.title)]
    )
    #v(2em)
    #align(center)[by: #doc.author]
  ]

  outline()

  body
}