#import "utils.typ": *

#let graph_setup(
  fontsize: 10pt,
  graph_counter_depth: 3,
  body
) = {

  let rem = rem.with(base: fontsize)

  counter(figure).update(0)
  
  show figure.where(kind: "graph"): it => {
    counter("graph").step()
    set line(stroke: (thickness: 0.6pt))
    context {
      let loc = it.location()
      let section = show-counter(counter(heading).at(loc), none)
      let graph_index = counter("graph").at(loc).first() + 1
      let letter = str.from-unicode(64 + graph_index)
      let numbering = section + letter

      figure(
        kind: "graph-display",
        supplement: none,
        numbering: none,
      )[
        #it.body
        #v(rem(0.75))
        #block(width: 100%, align(center, [
          #strong(it.supplement + " " + numbering)
          #h(rem(0.5)) | #h(rem(0.5))
          #it.caption.body
        ]))
      ]
    }
  }

  let line_style = (
    broken: (dash: "dashed", )
  )
  
  body
}

#let broken(color, thickness: 0.6pt) = {
  (dash: "dashed", cap: "round", thickness: thickness, paint: color)
}

#let normal(color, thickness: 0.6pt) = {
  (cap: "round", thickness: thickness, paint: color)
}

#let point(position, name, anchor, padding) = {
    cetz.draw.content(position, name, anchor: anchor, padding: padding)
    cetz.draw.circle(position, radius: 0.04, fill: colors.black)
}

#let midpoint(A, B) = {
  let (x1, y1) = A
  let (x2, y2) = B

  ((x1 + x2) / 2, (y1 + y2) / 2)
}

#let length(A, B) = {
  let (x1, y1) = A
  let (x2, y2) = B
  
  calc.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
}

#let reflection_point(O, A) = {
  let (x, y) = O
  let (a, b) = A
  
  (2 * x - a, 2 * y - b)
}

#let reflection_line(le, A) = {
  let (a, b, c) = le
  let (x, y) = A
  let numx = (2 * a * (a * x + b * y + c)) / (a * a + b * b)
  let numy = (2 * b * (a * x + b * y + c)) / (a * a + b * b)

  (x - numx, y - numy)
}

#let orthocenter(A, B, C) = {
  let (x1, y1) = A
  let (x2, y2) = B
  let (x3, y3) = C
  let Delta = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)
  
  let numx = (x1*x1 + y1*y1) * (y2 - y3) + (x2*x2 + y2*y2) * (y3 - y1) + (x3*x3 + y3*y3) * (y1 - y2)
  let numy = (x1*x1 + y1*y1) * (x3 - x2) + (x2*x2 + y2*y2) * (x1 - x3) + (x3*x3 + y3*y3) * (x2 - x1)
  
  let Hx = (x1 + x2 + x3) - numx / Delta
  let Hy = (y1 + y2 + y3) - numy / Delta

  (Hx, Hy)
}

#let centroid(A, B, C) = {
  let (x1, y1) = A
  let (x2, y2) = B
  let (x3, y3) = C

  ((x1 + x2 + x3) / 3, (y1 + y2 + y3) / 3)
}

#let circumcenter(A, B, C) = {
  let (x1, y1) = A
  let (x2, y2) = B
  let (x3, y3) = C

  let D = 2 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))
  let numx = (x1 * x1 + y1 * y1) * (y2 - y3) + (x2 * x2 + y2 * y2) * (y3 - y1) + (x3 * x3 + y3 * y3) * (y1 - y2)
  let numy = (x1 * x1 + y1 * y1) * (x3 - x2) + (x2 * x2 + y2 * y2) * (x1 - x3) + (x3 * x3 + y3 * y3) * (x2 - x1)
  
  if D == 0 {
    ()
  } else {
    let x = numx / D
    let y = numy / D
    
    (x, y)
  }
}

#let incenter(A, B, C) = {
  let (x1, y1) = A
  let (x2, y2) = B
  let (x3, y3) = C
  let a = length(B, C)
  let b = length(C, A)
  let c = length(A, B)
  let x = (a * x1 + b * x2 + c * x3) / (a + b + c)
  let y = (a * y1 + b * y2 + c * y3) / (a + b + c)

  (x, y)
}

#let excenter(A, B, C) = {
  let (x1, y1) = A
  let (x2, y2) = B
  let (x3, y3) = C
  let a = length(B, C)
  let b = length(C, A)
  let c = length(A, B)
  let x = (-a * x1 + b * x2 + c * x3) / (-a + b + c)
  let y = (-a * y1 + b * y2 + c * y3) / (-a + b + c)

  (x, y)
}

#let foot(le, point) = {
  let (a, b, c) = le
  let (x0, y0) = point
  let delta = (a * x0 + b * y0 + c) / (a * a + b * b)
  let x = x0 - a * delta
  let y = y0 - b * delta
  
  (x, y)
}

#let get_line_equation(pointA, pointB) = {
  let (x1, y1) = pointA
  let (x2, y2) = pointB
  
  let a = y2 - y1
  let b = x1 - x2
  let c = x2 * y1 - x1 * y2 
  
  (a, b, c)
}

#let get_circle_equation(center, radius) = {
  let (x, y) = center
  
  (x, y, radius)
}

#let perpendicular_lp(le, point) = {
  let (x, y) = point
  let (a, b, c) = le

  (b, -a, a * y - b * x)
}

#let parallel_lp(le, point) = {
  let (x, y) = point
  let (a, b, c) = le

  (a, b, -(a * x + b * y))
}

#let IP_lc(le, ce) = {
  let (a, b, c) = le
  let (x, y, r) = ce
  if b == 0 {
    let x0 = - c / a
    let d = calc.pow(r, 4) - (c / a + x) * (c / a + x)
    if d < 0 {((), ())}
    if d == 0 {((x0, y), ())}
    if d > 0 {((x0, y + calc.sqrt(d)), (x0, y - calc.sqrt(d)))}
  } else {
    let A = a * a + b * b
    let B = 2 * (a * (c + b * y) - b * b * x)
    let C = (c + b * y) * (c + b * y) + b * b * (x * x - r * r)
    let d = B * B - 4 * A * C
    if d < 0 {((), ())}
    if d == 0 {
      let x0 = - B / (2 * A)
      let y0 = -(a * x0 + c) / b
      
      ((x0, y0), ())
    }
    if d > 0 {
      let x1 = (- B + calc.sqrt(d)) / (2 * A)
      let x2 = (- B - calc.sqrt(d)) / (2 * A)
      let y1 = -(a * x1 + c) / b
      let y2 = -(a * x2 + c) / b
      
      ((x1, y1), (x2, y2))
    }
  }
}

#let IP_ll(le1, le2) = {
  let (a1, b1, c1) = le1
  let (a2, b2, c2) = le2
  let delta = a2 * b1 - a1 * b2
  if delta == 0 {
    ()
  } else {
    let x = (b2 * c1 - b1 * c2) / delta
    let y = (a1 * c2 - a2 * c1) / delta
    
    (x, y)
  }
}

#let IP_cc(ce1, ce2) = {
  let (x1, y1, r1) = ce1
  let (x2, y2, r2) = ce2
  let d = length((x1, y1), (x2, y2))
  if d == 0 or d < calc.abs(r1 - r2) or d > r1 + r2 {
    ()
  } else {
    let a = (r1 * r1 - r2 * r2 + d * d) / (2 * d)
    let h = calc.sqrt(r1 * r1 - a * a)
    let x_mid = x1 + a * (x2 - x1) / d
    let y_mid = y1 + a * (y2 - y1) / d
    let x_off = -h * (y2 - y1) / d
    let y_off = h * (x2 - x1) / d
    (
      (x_mid + x_off, y_mid + y_off), 
      (x_mid - x_off, y_mid - y_off)
    )
  }
}

#let point_on_circle(ce, deg) = {
  let (x, y, r) = ce
  
  (x + r * calc.cos(deg), y + r * calc.sin(deg))
}

#let graph(
  caption: "Something that you used to described the theorem",
  body
) = {
  figure(
    kind: "graph",
    caption: caption,
    supplement: [Figure]
  )[
    #body
  ]
}
