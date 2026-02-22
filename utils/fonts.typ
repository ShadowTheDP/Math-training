#import "utils.typ": *

#let fonts_setup(
  fontsize: 10pt,
  body
) = {
  let rem = rem.with(base: fontsize)
  
  set text(font: fonts.serif, size: rem(1))
  
  // Bold
  show strong: it => {
    text(font: fonts.bold, weight: 580, it.body)
  }

  // Italic
  show emph: it => {
    text(font: fonts.italic, style: "italic", it.body)
  }

  // Math
  show math.equation: set text(font: fonts.math)

  body
}