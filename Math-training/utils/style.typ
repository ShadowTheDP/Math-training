#import "utils.typ": *

#let style_setup(
  fontsize: 10pt,
  ..args,
  body
) = {
  
  let doc = args.at("doc")
  
  let rem = rem.with(base: fontsize)
  
  set document(..doc)
  
  set par(
    leading: rem(0.65),
    justify: true,
    spacing: rem(2),
  )
  
  set page(
    numbering: "1 / 1",
    margin: (x: rem(10)),
  )
  
  show link: set text(fill: colors.link)
  
  set enum(indent: rem(1.25), numbering: "i)")
  set list(indent: rem(1.25), spacing: rem(2))
  set terms(indent: rem(1.25), spacing: rem(1), separator: [. ])
  show enum.where(tight: false): set enum(spacing: rem(1.25))
  show list.where(tight: false): set list(spacing: rem(1.25))
  
  show figure: set block(breakable: true)
  
  body
}