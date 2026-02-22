#import "@preview/cetz:0.4.2"
#import "@preview/gentle-clues:1.2.0": *

#let has(v) = {
  type(v) != type(none)
}

#let rem(n, base: 10pt) = {
  n * base
}

#let colors = (
  uuid: oklch(62.7%, 0.194, 149.214deg),
  link: oklch(48.8%, 0.243, 264.376deg),
  outline-title: oklch(60.9%, 0.126, 221.723deg),
  citation: oklch(52.7%, 0.154, 150.069deg),
  red:     rgb(255, 0, 0, 200),
  blue:    rgb(0, 0, 255, 200),
  green:   rgb(0, 128, 0, 200),
  yellow:  rgb(128, 128, 0, 200),
  magenta: rgb(255, 0, 255, 200),
  cyan:    rgb(0, 191, 191, 200),
  black:   rgb(0, 0, 0),
  white:   rgb(255, 255, 255),
  gray:    rgb(128, 128, 128, 200),
  brown:   rgb(128, 0, 0, 200),
  orange:  rgb(255, 128, 0, 200),
  purple:  rgb(128, 0, 128, 200),
  redt:     rgb(255, 0, 0, 20),
  bluet:    rgb(0, 0, 255, 20),
  greent:   rgb(0, 255, 0, 20),
  yellowt:  rgb(255, 255, 0, 20),
  magentat: rgb(255, 0, 255, 20),
  cyant:    rgb(0, 255, 255, 20),
  brownt:   rgb(128, 0, 0, 20),
  oranget:  rgb(255, 165, 0, 20),
  purplet:  rgb(128, 0, 128, 20),
)

#let fonts = (
  serif: (
    "New Computer Modern", "Noto Serif CJK SC", "Noto Serif CJK TC", 
    "Noto Serif CJK JP", "Noto Color Emoji"
  ),
  sans-serif: ("New Computer Modern Sans", "Noto Sans CJK SC",
    "Noto Sans CJK TC", "Noto Color Emoji"
  ),
  monospaced: ("Fira Mono", "Noto Color Emoji"),
  bold: ("New Computer Modern", "Noto Sans CJK SC", "Noto Sans CJK TC", 
  "Noto Color Emoji"
  ),
  italic: ("New Computer Modern", "AR PL UKai", "AR PL UKai TW"),
  math: ("New Computer Modern Math", "Noto Serif CJK SC", "Noto Serif CJK TC",
    "Noto Color Emoji"
  ),
)

#let url(s) = {
  link(s, text(font:fonts.monospaced, size: 0.9em, fill: blue, s))
}

#let uuid(s) = {
  set text(
    font: fonts.monospaced, size: 0.92em, fill: colors.uuid, weight: 400
  )
  place(top + left, dx: -7em, box("(" + s + ")"))
}

#let titlepage(
  fontsize: 11pt,
  body
) = {
  set page(numbering: none, margin: auto, header: none)
  set align(center)
  body
  pagebreak()
  counter(page).update(1)
}

#let show-counter(list, last) = {
  let list = list
  if list.len() > 0 {
    list.at(0) -= 1
  }
  let s = list.map(str).join(".")
  if last != none {
    s + last
  } else {
    s
  }
}

