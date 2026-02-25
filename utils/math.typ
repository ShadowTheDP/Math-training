#import "utils.typ": *


#let math_setup(
  mathenv-counter-depth: 2,
  equation-counter-depth: 1,
  fontsize: 10pt,
  body
) = {
  let rem = rem.with(base: fontsize)
  show math.equation.where(block: true): it => block(
    spacing: rem(1.25),
    width: 100%,
    breakable: true,
    it
  )
  show figure.where(kind: "math-theorem"): it => {
    set align(left)
    counter("math-theorem").step(level: mathenv-counter-depth)
    block(spacing: rem(2), width: 100%, breakable: true, it)
  }
  show figure.where(kind: "math-equation"): it => {
    counter("math-equation").step(level: equation-counter-depth)
    block(spacing: rem(1.25), width: 100%, breakable: true, it)
  }
  show figure.where(kind: "math-proof-solution"): it => {
    set align(left)
    block(spacing: rem(2), width: 100%, breakable: true, it)
  }
  body
}



#let eqn(
  hash: none,
  s
) = {
  figure(kind: "math-equation", supplement: [Equation])[
    #if has(hash) { uuid(hash) }
    #set math.equation(numbering: (..nums) => context {
      "(" + counter("math-equation").get().map(str).join(".") + ")"
    })
    #s
  ]
}

#let mathenv(
  name: "Theorem",
  hash: none,
  desp: none,
  nocounter: false,
  body
) = {
  let title = context strong(
    name + " " + counter("math-theorem").get().map(str).join(".")
  )
  if nocounter {
    title = strong(name)
  }
  if has(desp) {
    title = title + strong(" (" + desp + ").")
  } else {
    title = title + strong(".")
  }
  
  figure(kind: "math-theorem", supplement: name)[
    #if has(hash) { uuid(hash) }
    #title
    #body
  ]
}

#let proof(
  name: "Proof",
  reset: true,
  desp: none,
  qed-symbol: [#sym.square.stroked],
  body
) = {
  let title = strong(name)

  if reset {
    counter("claim_p").update(0)
    counter("lemma_p").update(0)
    counter("case-p").update(0)
    state("case-p-depth").update(0)
  }
  if has(desp) {
    title = title + strong(" (" + desp + ").")
  } else {
    title = title + strong(".")
  }

  figure(kind: "math-proof-solution", supplement: none)[
    #title
    #body
    #if has(qed-symbol) { sym.wj + h(1fr) + sym.wj + qed-symbol }
  ]
}

#let theorem = mathenv.with(name: "Theorem")

#let proposition = mathenv.with(name: "Proposition")

#let lemma = mathenv.with(name: "Lemma")

#let corollary = mathenv.with(name: "Corollary")

#let example = mathenv.with(name: "Example")

#let definition = mathenv.with(name: "Definition")

#let remark = mathenv.with(name: "Remark")

#let problem = mathenv.with(name: "Problem")

#let property = mathenv.with(name: "Property")

#let subproof = proof.with(
  reset: false,
  qed-symbol: [#sym.square.filled]
)

#let solution = proof.with(name: "Solution")

#let claim_p(
  name: "Claim",
  body1,
  body2
) = {
  counter("claim_p").step()
  
  let title = context strong(name + " " + counter("claim_p").get().map(str).join(".") + " -")
  
  block(spacing: rem(2), width: 100%, fill: rgb(255, 0, 0, 8), inset: rem(1))[
    #text(fill: red)[#title]
    #body1
  ]
  subproof(
    name: "Proof of Claim"
  )[
    #body2
  ]
}

#let lemma_p(
  name: "Lemma",
  body1,
  body2
) = {
  counter("lemma_p").step()
  
  let title = context strong(name + " " + counter("lemma_p").get().map(str).join(".") + " -")
  
  block(spacing: rem(2), width: 100%, fill: rgb(0, 0, 255, 8), inset: rem(1))[
    #text(fill: blue)[#title]
    #body1
  ]
  subproof(
    name: "Proof of Lemma"
  )[
    #body2
  ]
}

#let case-p(
    title,
    body
  ) = {
    let depth-state = state("case-p-depth", 0)
    depth-state.update(d => d + 1)
    
    context {
      let d = depth-state.get()
      counter("case-p").step(level: d)
    }
    
    context {
      let d = depth-state.get()
      // 參考 claim-p 與 lemma-p 的風格：使用極淺背景色與對應深色文字
      // 這裡選擇綠色系 (rgb 0, 128, 0) 來區分紅色的 Claim 和藍色的 Lemma
      let bg-color = rgb(0, 128, 0, 8)
      let text-color = colors.green
      
      block(
        spacing: rem(1.5), 
        width: 100%, 
        fill: bg-color, 
        inset: rem(1), 
        radius: 2pt
      )[
        #text(weight: "bold", fill: text-color)[
          case #counter("case-p").display("1.1") -
        ]
        #h(0.2em)
        #strong(title)
        
        #block(inset: (left: rem(0.5), top: rem(0.4)), width: 100%)[
          #body
        ]
      ]
    }
    
    depth-state.update(d => d - 1)
  }