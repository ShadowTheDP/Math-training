#import "utils/utils.typ": *
#import "utils/init.typ": *

#show: init.with(
  doc:(
    title: "Notes to EGMO",
    author: "ShadowTheDP"
  ),
  mathenv-counter-depth: 2
)

= Preliminaries

This PDF give all section solution of the book _Eucildean Geometry in Mathematical Olympiads_ written by *Evan Chen*.

Here's all of the typos or mistakes in _EGMO_ : #url("https://web.evanchen.cc/textbooks/geombook-errata.pdf")

Here's the solution provided by *Evan Chen* : #url("https://web.evanchen.cc/textbooks/AGEST.pdf")

== The description of mathenv

Take an example:

#definition(
  desp: "something"
)[
  the main body
]

$stretch(=)^"    type name   "|stretch(=)^" num "|stretch(=)^"source in the book"|stretch(=)^"    the main body    "$

At the very first of this example, is the type name of this example, followed by the serial number of the example, the string inside the brackets is usually the source in the book _EGMO_, the string after the "." is the main body of this mathenv.

== Center of a Triangle

- The *Orthocenter* of $triangle A B C$, usually denoted by $H$, is the intersection of the perpendiculars (or altitudes) from $A$ to $B C$, $B$ to $C A$, and $C$ to $A B$. The triangle formed by the feet of these altitudes is called the *orthic triangle*.
- The *Centroid*, usually denoted by $G$, is the intersection the medians, which are the lines joining each vertex to the midpoint of the opposite side. The triangle formed by the midpoints is called the *medial triangle*.
- The *Incenter*, usually denoted by $I$ , is the intersection of the angle bisectors of the angles of $triangle A B C$. It is also the center of a circle (the *incircle*) tangent to all three sides. The radius of the incircle is called the inradius $r$. The triangle formed by the points of tangency of the incircle is called *contact triangle*
- The *Circumcenter*, usually denoted by $O$, is the center of the unique circle (the *circumcircle*) passing through the vertices of $triangle A B C$. The radius of this circumcircle is called the circumradius $R$.

== Notation

Consider a triangle $A B C$. Throughout this text, let $a = B C, b = C A, c = A B$, and abbreviate $A = angle B A C, B = angle C B A, C = angle A C B$.

Here's some common used notation in this pdf:

  - $angle$ : a standard angle
  - $angle.arc$ : a directed angle from $angle$
  - $s := (a + b + c) / 2$ : the semiperimeter of $triangle A B C$
  - $[P_1 P_2 P_3 dots P_n]$ : the area of polygon $P_1 P_2 P_3 dots P_n$,
  - $(P_1 P_2 P_3 dots P_n)$ : a circle with a sequence of points $P_1, P_2, P_3, dots P_n$ all lying on it
  - $A B inter C D$ : the intersection of the two lines $A B$ and $C D$
  - For algebraic computations, we may use sigma notation as follows:
  $ sum_("cyc") f(a, b, c) = f(a, b, c) + f(b, c, a) + f(c, a, b) $
  $ sum_("sym") f(a, b, c) = f(a, b, c) + f(a, c, b) + f(b, a, c) + f(b, c, a) + f(c, a, b) + f(c, b, a) $

= Angle Chasing

#quote(
  author: "Galileo Galilei"
)[
  Mathematics is the language in which God has written the universe.
]

#problem(
  desp: "Problem 1.36."
)[
  Let $A B C D E$ be a convex pentagon such that $B C D E$ is a square with center $O$ and $angle A = 90degree$. Prove that $A O$ bisects $angle B A E$.
]

#graph(
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 3)
    let C = (0, 0)
    let D = (3, 0)
    let E = (3, 3)
    let O = (1.5, 1.5)
    let O_1 = midpoint(B, E)
    let ce1 = get_circle_equation(O_1, length(O_1, B))
    let A = point_on_circle(ce1, 120deg)

    circle(O_1, radius: length(O_1, B), stroke: normal(colors.brown), fill: colors.brownt)
    line(B, C, D, E, B, stroke: normal(colors.red))
    line(O, B, A, E, O, A, stroke: broken(colors.magenta))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "east", 0.1)
    point(D, $D$, "west", 0.1)
    point(E, $E$, "west", 0.1)
    point(O, $O$, "north", 0.1)
  }),
  caption: [Problem 1.36.]
)

#proof[
  Since $O$ is the center of $B C D E$, we have $angle B O E = 90 degree = angle B A E => A, B, O, E$ concyclic. Also, $B O = E O$. The result follows.
]

#problem(
  desp: "Problem 1.37 (BAMO 1999/2)."
)[
  Let $O = (0, 0), A = (0, a), "and" B = (0, b)$, where $0 < a < b$ are reals. Let $Gamma$ be a circle with diameter $A B$ and let $P$ be any other point on $Gamma$. Line $P A$ meets the $x$-axis again at $Q$. Prove that $angle B Q P = angle B O P$.
]

#graph(
  cetz.canvas({
    import cetz.draw: *

    let a = 2
    let b = 5
    let O = (0, 0)
    let A = (0, a)
    let B = (0, b)
    let O_1 = midpoint(A, B)
    let Gamma = get_circle_equation(O_1, length(O_1, A))
    let P = point_on_circle(Gamma, 160deg)
    let PA = get_line_equation(P, A)
    let x-axis = (0, 1, 0)
    let Q = IP_ll(PA, x-axis)
    let O_2 = midpoint(B, Q)

    circle(O_1, radius: length(O_1, A), stroke: normal(colors.cyan), fill: colors.cyant)
    circle(O_2, radius: length(O_2, Q), stroke: normal(colors.blue), fill: colors.bluet)
    line((-4, 0), (4, 0), stroke: normal(colors.black))
    line(P, A, Q, B, A, O, P, stroke: normal(colors.magenta))
    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "south", 0.1)
    point(O, $O$, "north", 0.1)
    point(P, $P$, "south-east", 0.1)
    point(Q, $Q$, "south-west", 0.1)
  }),
  caption: [Problem 1.37 (BAMO 1999/2).]
)

#proof[
  Obviously we have $angle B P Q = angle B P A = 90 degree "and" angle B O Q = 90 degree$, therefore $P, B, Q, O$ are concyclic. The result follows.
]

#problem(
  desp: "Problem 1.38."
)[
  In cyclic quadrilateral $A B C D$, let $I_1$ and $I_2$ denote the incenters of $triangle A B C$ and $triangle D B C$, respectively. Prove that $I_1 I_2 B C$ is cyclic.
]

#graph(
  caption: [Problem 1.38.],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let ABCD = get_circle_equation(O, 2)
    let A = point_on_circle(ABCD, 155deg)
    let B = point_on_circle(ABCD, 215deg)
    let C = point_on_circle(ABCD, 325deg)
    let D = point_on_circle(ABCD, 75deg)
    let I1 = incenter(A, B, C)
    let I2 = incenter(D, B, C)
    let O1 = circumcenter(B, I1, C)

    circle(O, radius: 2, stroke: normal(colors.red), fill: colors.redt)
    circle(O1, radius: length(O1, I1), stroke: broken(colors.brown))
    line(A, B, C, D, A, stroke: normal(colors.orange))
    line(A, C, stroke: normal(colors.orange))
    line(B, D, stroke: normal(colors.orange))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "east", 0.2)
    point(C, $C$, "west", 0.2)
    point(D, $D$, "south-west", 0.1)
    point(I1, $I_1$, "north-west", 0.1)
    point(I2, $I_2$, "south-west", 0.1)
  })
)

#proof[
  In fact, we have
  $ angle B I_1 C &= pi / 2 + (angle B A C) / 2 \
  &= pi / 2 + (angle B D C) / 2 \
  &= angle B I_2 C. $
  As result.
]

#problem(
  desp: "Problem 1.39 (CGMO 2012/5)."
)[
  Let $A B C$ be a triangle. The incircle of $triangle A B C$ is tangent to $A B$ and $A C$ at $D$ and $E$ respectively. Let $O$ denote the circumcenter of $triangle B C I$ .Prove that $angle O D B = angle O E C$.
]

#graph(
  caption: [Problem 1.39 (CGMO 2012/5).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (3, 3)
    let C = (4, 0)
    let I = incenter(A, B, C)
    let O = circumcenter(B, C, I)
    let AB = get_line_equation(A, B)
    let AC = get_line_equation(A, C)
    let D = foot(AB, I)
    let E = foot(AC, I)

    circle(I, radius: length(I, D), stroke: broken(colors.blue), fill: colors.cyant)
    circle(O, radius: length(O, I), stroke: normal(colors.blue), fill: colors.bluet)
    line(A, B, C, A, stroke: normal(colors.blue))
    line(B, O, D, stroke: normal(colors.green))
    line(C, O, E, stroke: normal(colors.green))
    line(A, I, O, stroke: broken(colors.magenta))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(D, $D$, "south-east", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(I, $I$, "south-east", 0.1)
    point(O, $O$, "north", 0.1)
  })
)

#proof[
  Well-known $A, I, O$ colinear. Since $A D = A E , A I$ is an angle bisector, we have $triangle A D O tilde.equiv triangle A E O$, so $angle A O D = angle A O E$, the result follows.
]

#problem(
  desp: "Problem 1.40 (Canada 1991/3)."
)[
  Let $P$ be a point inside circle $omega$. Consider the set of chords of $omega$ that contain $P$. Prove that their midpoints all lie on a circle.
]

#graph(
  caption: [Problem 1.40 (Canada 1991/3).],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let P = (0, 2.5)
    let lP1 = (0, 1, -2.5)
    let lP2 = (-1, 2, -5)
    let omega = get_circle_equation(O, 3)
    let (N1, M1) = IP_lc(lP1, omega)
    let (N2, M2) = IP_lc(lP2, omega)
    let Q = midpoint(N2, M2)
    let O1 = midpoint(O, P)

    circle(O, radius: 3, stroke: normal(colors.red), fill: colors.redt)
    circle(O1, radius: length(O1, O), stroke: normal(colors.blue), fill: colors.bluet)
    line(N1, M1, stroke: broken(colors.brown))
    line(N2, M2, stroke: broken(colors.red))
    line((0, 3), (0, -3), stroke: broken(colors.brown))
    line(P, Q, O, stroke: normal(colors.red))
    point(P, $P$, "south-east", 0.1)
    point(O, $O$, "north-east", 0.1)
    point(Q, $Q$, "south-east", 0.05)
  })
)

#proof[
  It's sufficient to proof all Q lie on the circle with $P O$ is diameter. In fact we have $O Q perp Q P$ at all the time.
]

#problem(
  desp: "Problem 1.41 (Russian Olympiad 1996)."
)[
  Points $E$ and $F$ are on side BC of convex quadrilateral $A B C D$ (with $E$ closer than $F$ to $B$). It is known that $angle B A E = angle C D F$ and $angle E A F = angle F D E$. Prove that $angle F A C = angle E D B$.
]

#proof[
  Since $angle E A F = angle F D E$, we have $A, E, F, D$ concyclic. Also it's sufficient to show $A, B, C, D$ are concyclic. In fact,
  $ angle B A D + angle D C B &= angle B A E + angle E A F + angle F A D + angle D C F \
  &= angle C D F + angle F D E + angle F E D + angle D C F \
  &= pi. $
  As result.
]

#problem(
  desp: "Lemma 1.42."
)[
  Let $A B C$ be an acute triangle inscribed in circle $Omega$ . Let $X$ be the midpoint of the arc $B C$ not containing $A$ and define $Y, Z$ similarly. Show that the orthocenter of $X Y Z$ is the incenter $I$ of $A B C$.
]<Problem1.2.7>

#graph(
  caption: [Lemma 1.42],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (1.5, 4)
    let C = (6, 0)
    let I = incenter(A, B, C)
    let O = circumcenter(A, B, C)
    let Omega = get_circle_equation(O, length(O, B))
    let AI = get_line_equation(A, I)
    let BI = get_line_equation(B, I)
    let CI = get_line_equation(C, I)
    let (X, n) = IP_lc(AI, Omega)
    let (Y, n) = IP_lc(BI, Omega)
    let (n, Z) = IP_lc(CI, Omega)

    circle(O, radius: length(O, A), stroke: normal(colors.red), fill: colors.redt)
    circle(X, radius: length(X, I), stroke: broken(colors.magenta))
    circle(Y, radius: length(Y, I), stroke: broken(colors.magenta))
    circle(Z, radius: length(Z, I), stroke: broken(colors.magenta))
    line(A, B, C, A, stroke: normal(colors.blue), fill: colors.bluet)
    line(X, Y, Z, X, stroke: broken(colors.green), fill: colors.greent)
    line(A, I, X, stroke: broken(colors.cyan))
    line(B, I, Y, stroke: broken(colors.cyan))
    line(C, I, Z, stroke: broken(colors.cyan))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(X, $X$, "north", 0.1)
    point(Y, $Y$, "south-west", 0.1)
    point(Z, $Z$, "east", 0.1)
    point(I, $I$, "east", 0.1)
  })
)

#proof[
  Notice that it's sufficient to show $A X perp Z Y$, since $A, I, X$ colinear and $A I$ is radical axis of $(A I B) "and" (A I C)$, same applies on $B Y$ and $C Z$, the result follows.
]

#problem(
  desp: "Problem 1.43 (JMO 2011/5)."
)[
  Points $A, B, C, D, E$ lie on a circle $omega$ and point $P$ lies outside the circle. The given points are such that:
  
  + lines $P B$ and $P D$ are tangent to $omega$,
  + $P, A, C$ are collinear,
  + $D E parallel A C$.
  Prove that $B E$ bisects $A C$.
]

#graph(
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c1 = get_circle_equation(O, 2.5)
    let A = point_on_circle(c1, 135deg)
    let B = point_on_circle(c1, 80deg)
    let D = point_on_circle(c1, 210deg)
    let OB = get_line_equation(O, B)
    let OD = get_line_equation(O, D)
    let PB = perpendicular_lp(OB, B)
    let PD = perpendicular_lp(OD, D)
    let P = IP_ll(PB, PD)
    let PA = get_line_equation(P, A)
    let (C, n) = IP_lc(PA, c1)
    let DE = parallel_lp(PA, D)
    let (E, n) = IP_lc(DE, c1)
    let BE = get_line_equation(B, E)
    let M = IP_ll(PA, BE)
    let O1 = circumcenter(P, D, B)

    circle(O, radius: 2.5, stroke: normal(colors.red), fill: colors.redt)
    circle(O1, radius: length(O1, P), stroke: broken(colors.brown))
    line(B, P, D, stroke: normal(colors.orange))
    line(D, E, C, stroke: normal(colors.magenta))
    line(B, M, E, stroke: normal(colors.magenta))
    line(P, A, C, stroke: normal(colors.orange))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "south", 0.15)
    point(C, $C$, "west", 0.15)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "north", 0.15)
    point(P, $P$, "east", 0.1)
    point(O, $O$, "south-east", 0.1)
    point(M, $M$, "south-west", 0.1)
  }),
  caption: [Problem 1.43 (JMO 2011/5).]
)

#proof(
  desp: "Angle Chasing" 
)[
  Since $angle P B O = angle P D O = 90 degree$, we have $P, B, O, D$ concyclic with $P O$ is the diameter. Now we have to claim $M$ lies on the circle. Since $D E parallel P C$
  $ angle P M B = angle D E B = angle P D B. $
  Then $angle P M O = 90 degree$, which is obvious.
]

#proof(
  desp: "Projective Geometry"
)[
  Notice the $A B C D$ is a harmonic quadrilateral, Since $D E parallel A C$
  $ -1 = (A, C; B, D) =^E (A, C; B E inter A C, D) = (A, C; B E inter A C, P_infinity). $
  which shows $M = B E inter A C$ is midpoint.
]

#problem(
  desp: "Lemma 1.44 (Three Tangents)."
)[
  Let $A B C$ be an acute triangle. Let $B E$ and $C F$ be altitudes of triangle $A B C$, and denote by $M$ the midpoint of $B C$. Prove that $M E, M F,$ and the line through $A$ parallel to BC are all tangents to $(A E F)$.
]<Problem1.2.9>

#graph(
  caption: [Lemma 1.44 (Three Tangents).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (1.5, 4)
    let C = (6, 0)
    let AC = get_line_equation(A, C)
    let AB = get_line_equation(A, B)
    let E = foot(AC, B)
    let F = foot(AB, C)
    let M = midpoint(B, C)
    let P = (0, 4)
    let Q = (6, 4)
    let O = circumcenter(A, F, E)
    
    circle(O, radius: length(O, A), stroke: normal(colors.blue), fill: colors.bluet)
    circle(M, radius: length(M, B), stroke: broken(colors.cyan))
    line(B, E, stroke: normal(colors.red))
    line(C, F, stroke: normal(colors.red))
    line(A, B, C, A, stroke: normal(colors.magenta), fill: colors.magentat)
    line(F, M, E, stroke: normal(colors.green))
    line(P, A, Q, stroke: normal(colors.green))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(E, $E$, "south-west", 0.15)
    point(F, $F$, "east", 0.15)
    point(M, $M$, "north", 0.1)
    point(P, $P$, "east", 0.1)
    point(Q, $Q$, "west", 0.1)
  })
)

#proof[
  Notice that $B, F, E, C$ concyclic, with $M$ is the center of the circle. To show $M E$, $M F$ is tangent to $dot.o A E F$. It's sufficient to show $angle M F E = angle M E F = angle A$. In fact,
  $ angle M F E = angle M E F &= 1 / 2 (pi - angle E M F) \
  &= 1 / 2 (angle B M F + angle C M E) \
  &= 1 / 2 (pi - 2 angle A + pi - 2 angle B) \
  &= angle A. $
  Next it's to show the line through $A$ parallel to BC is tangents to $dot.o A E F$.
  $ angle Q A C = angle C = angle A F E. $
  which is obvious.
]

#problem(
  desp: "Lemma 1.45 (Right Angles on Incircle Chord)."
)[
  The incircle of $A B C$ is tangent to $B C$, $C A$, $A B$ at $D, E, F$ respectively. Let $M$ and $N$ be the midpoints of $B C$ and $A C$, respectively. Ray $B I$ meets line $E F$ at $K$. Show that $B K perp C K$. Then show $K$ lies on line $M N$.
]<Problem1.2.10>

#graph(
  caption: [Lemma 1.45 (Right Angles on Incircle Chord).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (2, 5)
    let C = (7, 0)
    let I = incenter(A, B, C)
    let M = midpoint(B, C)
    let N = midpoint(A, C)
    let O = midpoint(I, C)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let EF = get_line_equation(E, F)
    let BI = get_line_equation(B, I)
    let K = IP_ll(EF, BI)

    circle(I, radius: length(I, D), stroke: normal(colors.brown), fill: colors.brownt)
    circle(O, radius: length(O, I), stroke: broken(colors.green), fill: colors.cyant)
    line(A, B, C, A, stroke: normal(colors.red), fill: colors.redt)
    line(F, E, K, stroke: broken(colors.blue))
    line(B, I, K, stroke: broken(colors.blue))
    line(M, N, K, stroke: broken(colors.blue))
    line(C, K, stroke: broken(colors.blue))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "south", 0.15)
    point(F, $F$, "east", 0.15)
    point(M, $M$, "north", 0.15)
    point(N, $N$, "west", 0.15)
    point(K, $K$, "south", 0.1)
    point(I, $I$, "south", 0.1)
  })
)

#proof[
  #claim_p[
    $I, E, K, C, D$ are concyclic, with diameter $I C$.
  ][
    It's sufficient to show $angle I K E = angle I L E = 1 / 2 angle C$. Since
    $ angle I K E &= angle B K F \ 
    &= pi - angle B F E - angle F B K \
    &= pi - (pi / 2 + 1 / 2 angle A) - 1 / 2 angle B \
    &= 1 / 2 angle C. $
    as result.
  ]
  Therefore, $angle B K C = 90 degree => B K perp C K$, also we have $M$ is the circumcenter of $B K C$.
  Now it suffices to show $M K parallel A B$ , since
  $ angle M K B = angle M B K = angle A B K. $
  we are done
]

#problem(
  desp: "Problem 1.46 (Canada 1997/4)."
)[
   The point $O$ is situated inside the parallelogram $A B C D$ such that $angle A O B + angle C O D = 180 degree$. Prove that $angle O B C = angle O D C$.
]

#proof[
  Let $O'$be a point outside the parallelogram $A B C D$ such that $triangle O'D C tilde.equiv triangle O A B$, we can easily have $O' O A D, O' O B C$ are parallelogram, also $O' D O C$ concyclic.\
  We are done since $angle O D C = angle O O' C = angle O B C$.
]

#problem(
  desp: "Problem 1.47 (IMO 2006/1)."
)[
  Let $A B C$ be triangle with incenter $I$ . A point $P$ in the interior of the triangle satisfies $ angle P B A + angle P C A = angle P B C + angle P C B. $ Show that $A P ≥ A I$ and that equality holds if and only if $P = I$ .
]

#proof[
  Since $ angle P B A + angle P C A = angle P B C + angle P C B = (B + C) / 2. $
  Notice that $B, P, I, C$ concyclic. Let $O$ be circumcenter of the circle. Well-known $A, I, O$ colinear, then we are done.
]

#problem(
  desp: "Lemma 1.48 (Simson Line)."
)[
  Let $A B C$ be a triangle and $P$ be any point on ($A B C$). Let $X, Y, Z$ be the feet of the perpendiculars from $P$ onto lines $B C, C A$, and $A B$. Prove that points $X, Y, Z$ are collinear.
]<Problem1.2.13>

#graph(
  caption: [Lemma 1.48 (Simson Line).],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 4)
    let B = (0, 0)
    let C = (6, 0)
    let O = circumcenter(A, B, C)
    let c = get_circle_equation(O, length(O, B))
    let P = point_on_circle(c, 60deg)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let X = foot(BC, P)
    let Y = foot(CA, P)
    let Z = foot(AB, P)
    let O1 = midpoint(P, A)
    let O2 = midpoint(P, B)
    let O3 = midpoint(P, C)

    circle(O, radius: length(O, A), stroke: normal(colors.green), fill: colors.greent)
    circle(O1, radius: length(O1, A), stroke: broken(colors.cyan))
    circle(O2, radius: length(O2, B), stroke: broken(colors.cyan))
    circle(O3, radius: length(O3, C), stroke: broken(colors.cyan))
    line(A, B, C, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(X, Y, Z, stroke: normal(colors.magenta))
    line(P, X, stroke: normal(colors.blue))
    line(P, Y, stroke: normal(colors.blue))
    line(P, Z, stroke: normal(colors.blue))
    line(A, Z, stroke: normal(colors.cyan))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(P, $P$, "south-west", 0.1)
    point(X, $X$, "north", 0.15)
    point(Y, $Y$, "north-east", 0.1)
    point(Z, $Z$, "south-east", 0.1)
  })
)

#proof[
  It's sufficient to show $angle Z X P = angle Y X P$. Obviously we have the following:
  
  - $P, Z, A, Y$ concyclic, with diameter $A P$.
  - $P, Z, B, X$ concyclic, with diameter $B P$.
  - $P, Y, X, C$ concyclic, with diameter $C P$.
  In fact, we have
  $ angle Y X P = angle Y C P = angle A C P = angle A B P = angle Z B P = angle Z X P. $
  Hence the result.
]

#problem(
  desp: "Problem 1.49 (USAMO 2010/1)."
)[
  Let $A X Y Z B$ be a convex pentagon inscribed in a semicircle of diameter $A B$. Denote by $P, Q, R, S$ the feet of the perpendiculars from $Y$ onto lines $A X, B X, A Z, B Z,$ respectively. Prove that the acute angle formed by lines $P Q$ and $R S$ is half the size of $angle X O Z$, where $O$ is the midpoint of segment $A B$.
]

#graph(
  caption: [Problem 1.49 (USAMO 2010/1).],
  cetz.canvas({
    import cetz.draw: *

    let A = (0, 0)
    let B = (7, 0)
    let O = midpoint(A, B)
    let c = get_circle_equation(O, length(A, O))
    let X = point_on_circle(c, 120deg)
    let Y = point_on_circle(c, 70deg)
    let Z = point_on_circle(c, 30deg)

    let AX = get_line_equation(A, X)
    let BX = get_line_equation(B, X)
    let AZ = get_line_equation(A, Z)
    let BZ = get_line_equation(B, Z)
    let P = foot(AX, Y)
    let Q = foot(BX, Y)
    let R = foot(AZ, Y)
    let S = foot(BZ, Y)
    let PQ = get_line_equation(P, Q)
    let RS = get_line_equation(R, S)
    let H = IP_ll(PQ, RS)
    let C = circumcenter(Y, H, B)
    let D = circumcenter(Y, H, A)

    line(A, X, B, Z, A, stroke: normal(color.green))
    line(P, X, stroke: normal(color.green))
    line(S, Z, stroke: normal(color.green))
    line(A, O, B, stroke: normal(colors.red))
    line(P, Q, H, R, S, stroke: broken(colors.magenta))
    line(X, O, Z, stroke: broken(colors.magenta))
    line(P, Y, Q, stroke: normal(colors.red))
    line(R, Y, S, stroke: normal(colors.red))
    line(H, Y, stroke: normal(colors.red))
    circle(O, radius: length(Y, O), stroke: normal(colors.cyan), fill: colors.cyant)
    circle(C, radius: length(C, Y), stroke: broken(colors.blue), fill: colors.bluet)
    circle(D, radius: length(D, Y), stroke: broken(colors.blue), fill: colors.bluet)
    point(O, $O$, "north", 0.15)
    point(A, $A$, "east", 0.15)
    point(B, $B$, "west", 0.15)
    point(X, $X$, "south-east", 0.1)
    point(Y, $Y$, "south", 0.15)
    point(Z, $Z$, "west", 0.15)
    point(P, $P$, "east", 0.1)
    point(Q, $Q$, "north-east", 0.1)
    point(R, $R$, "south-east", 0.1)
    point(S, $S$, "south-west", 0.1)
    point(H, $H$, "north-east", 0.1)
  })
)

#proof[
  During the process of drawing the graph, we have our first claim:
  #claim_p[
    $P Q, R S, A B$ are concurrent at point $H$, also $Y H perp A B$.
  ][
    Define $H colon.eq "The foot of the perpendicular from point" Y "to line" A B$. According to the property of Simson Line, we can have $P, Q, H$ and $S, R, H$ collinear, the result follows.
  ]
  Back onto this problem, it suffices to show $angle P H S = angle X B Z = 1 / 2 angle X O Z$, therefore, we have another claim:
  #claim_p[
    $Q, Y, S, B, H$ are concyclic, with diameter $Y B$.
  ][
    Obviously we have $angle Y S B = angle Y H B = angle Y Q B = pi / 2$. We get $Y, Q, H, B$ and $Y, H, B, S$ concyclic, as result.
  ]
  done.
]

#problem(
  desp: "Problem 1.50 (IMO 2013/4)."
)[
  Let $A B C$ be an acute triangle with orthocenter $H$, and let $W$ be a point on the side $B C$, between $B$ and $C$. The points $M$ and $N$ are the feet of the altitudes drawn from $B$ and $C$, respectively. $omega_1$ is the circumcircle of triangle $B W N$ and $X$ is a point such that $W X$ is a diameter of $omega_1$. Similarly, $omega_2$ is the circumcircle of triangle $C W M$ and $Y$ is a point such that $W Y$ is a diameter of $omega_2$. Show that the points $X, Y,$ and $H$ are collinear.
]

#graph(
  caption: [Problem 1.50 (IMO 2013/4).],
  cetz.canvas({
    import cetz.draw: *
    
    let A = (6, 5)
    let B = (0, 0)
    let C = (8, 0)
    let H = orthocenter(A, B, C)
    let W = (5, 0)
    let AC = get_line_equation(A, C)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let M = foot(AC, B)
    let N = foot(AB, C)
    let D = foot(BC, A)
    let O_1 = circumcenter(B, N, W)
    let O_2 = circumcenter(C, M, W)
    let O3 = midpoint(A, H)
    let omega_1 = get_circle_equation(O_1, length(O_1, B))
    let omega_2 = get_circle_equation(O_2, length(O_2, C))
    let (Z, _) = IP_cc(omega_1, omega_2)
    let X = reflection_point(O_1, W)
    let Y = reflection_point(O_2, W)

    line(A, B, C, A, stroke: normal(colors.red), fill: colors.redt)
    line(A, H, D, stroke: normal(colors.magenta))
    line(B, H, M, stroke: normal(colors.magenta))
    line(C, H, N, stroke: normal(colors.magenta))
    circle(O_1, radius: length(O_1, B), stroke: broken(colors.brown))
    circle(O_2, radius: length(O_2, C), stroke: broken(colors.brown))
    circle(O3, radius: length(O3, A), stroke: broken(colors.orange), fill: colors.oranget)
    line(X, B, stroke:  broken(colors.blue))
    line(Y, C, stroke: broken(colors.blue))
    line(X, H, Y, stroke: normal(colors.green))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(W, $W$, "north", 0.3)
    point(M, $M$, "south-west", 0.1)
    point(N, $N$, "south", 0.2)
    point(D, $D$, "north", 0.2)
    point(H, $H$, "north-east", 0.15)
    point(Z, $Z$, "south-east", 0.15)
    point(X, $X$, "south-east", 0.1)
    point(Y, $Y$, "south-west", 0.1)
  })
)

#proof(
  desp: "Angle Chasing"
)[
  Obviously $A, N, Z, H, M$ are concyclic with diameter $A H$.
  #claim_p[
    $Z, H, Y$ are collinear.
  ][
    We have
    $ angle.arc M Z H = angle.arc M A H = pi / 2 - angle.arc W C M = pi / 2 - angle.arc W Y M = angle.arc M W Y = angle.arc M Z Y $
    which is obvious.
  ]
  Same applies on $Z, H, X$. In conclusion, $X, Z, H, Y$ are collinear
]

#proof(
  desp: "Computational Geometry"
)[
  First we define $D colon.eq A H inter B C, B W = t a, C W = (1 - t)a$.
  
  Since $W X$, $W Y$ are the diameter, $angle X B W = angle Y C W = pi / 2$. It's sufficient to show $ H D = (C D) / a B X + (B D) / a C Y $
  
  First calculate $B X "and" C Y$,
  $ B X &= (B W) / (tan B X W) \
  &= B W (cos B N W) / (sin B N W) \
  &= B W (B N ^2 + N W ^2 - B W ^2) / (2 B N dot N W) (N W) / (B W sin B) \
  &= (B N ^2 + N W ^2 - B W ^2) / (2 B N sin B) \
  C Y &= (C W) / (tan W Y C) \
  &= C W (cos C M W) / (sin C M W) \
  &= C W (C M ^2 + M W ^2 - C W ^2) / (2 C M dot M W) (M W) / (C W sin C) \
  &= (C M ^2 + M W ^2 - C W ^2) / (2 C M sin C) \
  H D &= (c cos B) / (2 tan C) + (b cos C) / (2 tan B) $

  From Stewart's theorem we get the followings:
  $ N W ^2 = (N C ^2 B W + N B ^2 C W) / (B C) - B W dot C W \
  M W ^2 = (M C ^2 B W + M B ^2 C W) / (B C) - B W dot C W $

  substitute those variable and simplify, we have:
  $ B X &= (a (1 - t)) / (tan B) \
  C Y &= (a t) / (tan C) $

  It's sufficient to show,
  $ (c cos B) / (2 tan C) + (b cos C) / (2 tan B) &= (a (1 - t)) / (tan B) (C D) / a + (a t) / (tan C) (B D) / a \
  c / 2 sin B + b / 2 sin C &= (1 - t) C D tan C + t B D tan B \
  1 / 2 A D + 1 / 2 A D &= A D $
  which is obvious.
]

#problem(
  desp: "Problem 1.51 (IMO 1985/1)."
)[
  A circle has center on the side $A B$ of the cyclic quadrilateral $A B C D$. The other three sides are tangent to the circle. Prove that $A D + B C = A B$.
]

#proof[
  Consider $T colon.eq dot.o (C O D) inter A B$, we have
  $ angle D T A = angle D C O = 1 / 2 angle D C B = 1 / 2 (pi - angle B A D) = pi / 2 - 1 / 2 angle T A D $
  That means triangle $D A T$ is isosceles. Same as triangle $C B T$, the result follows.
]

= Circles

#quote(
  author: "Bertrand Russell"
)[
  Mathematics, rightly viewed, possesses not only truth but supreme beauty.
]

#problem(
  desp: "Lemma 2.24."
)[
  Let $A B C$ be a triangle with $I_A, I_B,$ and $I_C$ as excenters. Prove that triangle $I_A I_B I_C$ has orthocenter $I$ and that triangle $A B C$ is its orthic triangle.
]<Problem2.1>

#graph(
  caption: [Lemma 2.24.],
  cetz.canvas({
    import cetz.draw: *

    let A = (3.5, 2.5)
    let B = (0, 0)
    let C = (5, 0)
    let O = circumcenter(A, B, C)
    let I = incenter(A, B, C)
    let IA = excenter(A, B, C)
    let IB = excenter(B, C, A)
    let IC = excenter(C, A, B)

    circle(O, radius: length(O, A), stroke: normal(colors.red), fill: colors.redt)
    line(IA, IB, IC, IA, stroke: normal(colors.blue), fill: colors.cyant)
    line(IA, A, stroke: broken(colors.magenta))
    line(IB, B, stroke: broken(colors.magenta))
    line(IC, C, stroke: broken(colors.magenta))
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "east", 0.15)
    point(C, $C$, "west", 0.15)
    point(I, $I$, "south-west", 0.2)
    point(IA, $I_A$, "north", 0.15)
    point(IB, $I_B$, "south-west", 0.1)
    point(IC, $I_C$, "south-east", 0.1)
  })
)

#proof[
  It's obvious that $I_A, I, A$ collinear, it suffices to show $I_A A perp I_C A I_B$, which is trivial. The same applies to the rest. Then we're done.
]

#problem(
  desp: "Theorem 2.25 (The Pitot Theorem)."
)[
  Let $A B C D$ be a quadrilateral. If a circle can be inscribed in it, prove that $A B + C D = B C + D A$.
]<Problem2.2>

#proof[
  Let $A B, B C, C D, D A$ be tangent to the circle at points $E, F, G, "and" H$ respectively. We easily have,
  $ A B + C D = A E + E B + C G + G D = A H + F B + C F + H D = B C + D A $
  done.
]

#problem(
  desp: "Problem 2.26 (USAMO 1990/5)."
)[
  An acute-angled triangle $A B C$ is given in the plane. The circle with diameter $A B$ intersects altitude $C C'$ and its extension at points $M$ and $N$, and the circle with diameter $A C$ intersects altitude $B B'$ and its extensions at $P$ and $Q$. Prove that the points $M, N, P, Q$ lie on a common circle.
]

#graph(
  caption: [Problem 2.26 (USAMO 1990/5).],
  cetz.canvas({
    import cetz.draw: *

    let A = (3.5, 3.5)
    let B = (0, 0)
    let C = (5, 0)
    let H = orthocenter(A, B, C)
    let AB = get_line_equation(A, B)
    let AC = get_line_equation(A, C)
    let BC = get_line_equation(B, C)
    let Ap = foot(BC, A)
    let Cp = foot(AB, C)
    let Bp = foot(AC, B)
    let O1 = midpoint(A, B)
    let O2 = midpoint(A, C)
    let c1 = get_circle_equation(O1, length(O1, A))
    let c2 = get_circle_equation(O2, length(O2, A))
    let CCp = get_line_equation(C, Cp)
    let BBp = get_line_equation(B, Bp) 
    let (N, M) = IP_lc(CCp, c1)
    let (P, Q) = IP_lc(BBp, c2)
    let O3 = circumcenter(M, N, P)

    circle(O1, radius: length(O1, A), stroke: normal(colors.cyan), fill: colors.cyant)
    circle(O2, radius: length(O2, C), stroke: normal(colors.cyan), fill: colors.cyant)
    circle(O3, radius: length(O3, N), stroke: broken(colors.magenta), fill: colors.magentat)
    line(A, B, C, A, stroke: normal(colors.blue))
    line(A, Ap, stroke: broken(colors.green))
    line(C, N, Cp, M, stroke: broken(colors.green))
    line(B, Q, Bp, P, stroke: broken(colors.green))
    point(A, $A$, "south", 0.2)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(H, $H$, "south-west", 0.1)
    point(Ap, $A'$, "north", 0.2)
    point(Bp, $B'$, "south-west", 0.15)
    point(Cp, $C'$, "south", 0.3)
    point(M, $M$, "south-east", 0.1)
    point(N, $N$, "north", 0.3)
    point(P, $P$, "south-west", 0.1)
    point(Q, $Q$, "north-east", 0.2)
  })
)

#proof[
  Obviously, $A' = (A B B') inter (A C C') inter B C$ and $A A' perp B C$, since $A A', B B', C C'$ collinear at orthocenter $H$, the result is trivially true.
]

#problem(
  desp: "Problem 2.27 (BAMO 2012/4)."
)[
  Given a segment $A B$ in the plane, choose on it a point $M$ different from $A$ and $B$. Two equilateral triangles $A M C$ and $B M D$ in the plane are constructed on the same side of segment $A B$. The circumcircles of the two triangles intersect in point $M$ and another point $N$.
  + Prove that AD and BC pass through point N.
  + Prove that no matter where one chooses the point M along segment AB, all lines MN will pass through some fixed point K in the plane.
]

#graph(
  caption: [Problem 2.27 (BAMO 2012/4).],
  cetz.canvas({
    import cetz.draw: *

    let A = (0, 0)
    let B = (7, 0)
    let M = (4.5, 0)
    let C = (2.25, 2.25 * calc.sqrt(3))
    let D = (5.75, 1.25 * calc.sqrt(3))
    let O1 = circumcenter(A, M, C)
    let O2 = circumcenter(B, M, D)
    let c1 = get_circle_equation(O1, length(O1, A))
    let c2 = get_circle_equation(O2, length(O2, B))
    let (N, _)= IP_cc(c1, c2)

    circle(O1, radius: length(O1, A), stroke: normal(colors.green), fill: colors.greent)
    circle(O2, radius: length(O2, B), stroke: normal(colors.green), fill: colors.greent)
    line(A, M, B, D, M, C, A, stroke: normal(colors.orange), fill: colors.oranget)
    line(M, N, stroke: normal(colors.magenta))
    line(C, N, B, stroke: broken(colors.red))
    line(A, N, D, stroke: broken(colors.red))
    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "north-west", 0.1)
    point(M, $M$, "south-east", 0.1)
    point(C, $C$, "south", 0.1)
    point(D, $D$, "south", 0.1)
    point(N, $N$, "east", 0.2)
  })
)

#proof(
  desp: "Part 1"
)[
  With $angle C N A = angle A N M = angle M N B = angle B N D = 60 degree$, the result is now obvious.
]

#proof(
  desp: "Part 2"
)[
  Define $K$ s.t. $A, K, B, N$ concyclic and $A K B$ is a equilateral triangle. It suffices to show
  $ (sin A K N) / (sin B K N) = (sin A K M) / (sin B K M) $
  In fact, we have
  $ (sin A K N) / (sin B K N) = (A N) / (B N), quad (sin A K M) / (sin B K M) = (A M) / (B M) (B K) / (A K) = (A M) / (B M) $
  with $M N$ bisects $angle A N B$. We are done.
]

#problem(
  desp: "Problem 2.28 (JMO 2012/1)."
)[
  Given a triangle $A B C$, let $P$ and $Q$ be points on segments $A B$ and $A C$, respectively, such that $A P = A Q$. Let $S$ and $R$ be distinct points on segment $B C$ such that $S$ lies between $B$ and $R$, $angle B P S = angle P R S$, and $angle C Q R = angle Q S R$. Prove that P, Q, R, S are concyclic.
]

#proof[
  Since $angle B P S = angle P R S$, that means $B P A$ is tangent to $dot.o P S R$ at point $P$. Same applies on the line $C Q A$, we notice that
  $ A P ^2 = "Pow"(A, (P S R)) = "Pow"(A, (Q S R)) = A Q ^2 $
  but $A in.not B C$ which is the radical axis of these two circle, that implies $(P S R) = (Q S R)$, we are done.
]

#problem(
  desp: "Problem 2.29 (IMO 2008/1)."
)[
  Let $H$ be the orthocenter of an acute-angled triangle ABC. The circle $Gamma_A$ centered at the midpoint of $B C$ and passing through $H$ intersects the sideline $B C$ at points $A_1$ and $A_2$. Similarly, define the points $B_1, B_2, C_1$, and $C_2$. Prove that six points $A_1, A_2, B_1, B_2, C_1$, and $C_2$ are concyclic.
]

#graph(
  caption: [Problem 2.29 (IMO 2008/1).],
  cetz.canvas({
    import cetz.draw: *
    
    let A = (0, 0)
    let B = (8, 0)
    let C = (2.5, 6.25)
    let H = orthocenter(A, B, C)
    let Am = ((B.at(0) + C.at(0)) / 2, (B.at(1) + C.at(1)) / 2)
    let Bm = ((C.at(0) + A.at(0)) / 2, (C.at(1) + A.at(1)) / 2)
    let Cm = ((A.at(0) + B.at(0)) / 2, (A.at(1) + B.at(1)) / 2)
  
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
  
    let r_Am = length(Am, H)
    let r_Bm = length(Bm, H)
    let r_Cm = length(Cm, H)
  
    let circleAm = get_circle_equation(Am, r_Am)
    let circleBm = get_circle_equation(Bm, r_Bm)
    let circleCm = get_circle_equation(Cm, r_Cm)
  
    let (A1, A2) = IP_lc(BC, circleAm)
    let (B1, B2) = IP_lc(CA, circleBm)
    let (C1, C2) = IP_lc(AB, circleCm)
    let O = circumcenter(A1, B1, C1)
  
    circle(name: "GammaA", Am, radius: r_Am, stroke: normal(colors.magenta), fill: colors.purplet)
    content(("GammaA.north-east"), [$Gamma_A$], anchor: "south-west", padding: 0.1)
    circle(name: "GammaB", Bm, radius: r_Bm, stroke: normal(colors.magenta), fill: colors.purplet)
    content(("GammaB.north-west"), [$Gamma_B$], anchor: "south-east", padding: 0.1)
    circle(name: "GammaC", Cm, radius: r_Cm, stroke: normal(colors.magenta), fill: colors.purplet)
    content(("GammaC.south-east"), [$Gamma_C$], anchor: "north-west", padding: 0.1)
    circle(O, radius: length(O, A1), stroke: broken(colors.cyan), fill: colors.cyant)
    line(A, B, C, A, stroke: normal(colors.green), fill: colors.greent)
    point(A1, $A_1$, "west", 0.15)
    point(A2, $A_2$, "south", 0.2)
    point(B1, $B_1$, "south-east", 0.1)
    point(B2, $B_2$, "east", 0.15)
    point(C1, $C_1$, "north-west", 0.1)
    point(C2, $C_2$, "north-east", 0.1)
    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "north-west", 0.1)
    point(C, $C$, "south-east", 0.1)
    point(Am, $A_m$, "south-west", 0.1)
    point(Bm, $B_m$, "south-east", 0.1)
    point(Cm, $C_m$, "north", 0.15)
    point(H, $H$, "east", 0.1)
  })
)

#proof[
  According to the cyclic of those six points, it's sufficient to show $B_1, B_2, C_1, C_2$ concyclic.
  
  First we observe that $A H perp B C$. Since $B_m C_m$ is the median of the triangle $A B C$, which $B_m C_m parallel B C$, we get $A H perp B_m C_m$. This implies that $A H$ is the root axis of $dot.o B_m$ and $dot.o C_m$. The result follows from the property of the radical axis.
]

#problem(
  desp: "Problem 2.30 (USAMO 1997/2)."
)[
  Let $A B C$ be a triangle. Take points $D, E, F$ on the perpendicular bisectors of $B C, C A, A B$ respectively. Show that the lines through $A, B, C$ perpendicular to $E F, F D, D E$ respectively are concurrent.
]

#graph(
  caption: [Problem 2.30 (USAMO 1997/2).],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 5)
    let B = (0, 0)
    let C = (6, 0)
    let am = midpoint(B, C)
    let bm = midpoint(C, A)
    let cm = midpoint(A, B)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let la = perpendicular_lp(BC, am)
    let lb = perpendicular_lp(CA, bm)
    let lc = perpendicular_lp(AB, cm)
    let D = IP_ll(la, (0, 1, 1))
    let E = IP_ll(lb, (1, 0, -4))
    let F = IP_ll(lc, (1, 0, -1))
    let DE = get_line_equation(D, E)
    let FD = get_line_equation(F, D)
    let llb = perpendicular_lp(FD, B)
    let llc = perpendicular_lp(DE, C)
    let P = IP_ll(llb, llc)

    line(A, B, C, A, stroke: normal(colors.yellow), fill: colors.yellowt)
    line(D, E, F, D, stroke: normal(colors.blue))
    line(A, P, stroke: normal(colors.cyan))
    line(B, P, stroke: normal(colors.cyan))
    line(C, P, stroke: normal(colors.cyan))
    point(P, $P$, "south-west", 0.1)
    circle(name: "GammaA", D, radius: length(D, B), stroke: broken(colors.red), fill: colors.redt)
    circle(name: "GammaB", E, radius: length(E, C), stroke: broken(colors.red), fill: colors.redt)
    circle(name: "GammaC", F, radius: length(F, A), stroke: broken(colors.red), fill: colors.redt)
    content("GammaA.south-east", [$Gamma_A$], anchor: "north-west", padding: 0.2)
    content("GammaB.north-east", [$Gamma_B$], anchor: "south-west", padding: 0.2)
    content("GammaC.north-west", [$Gamma_C$], anchor: "south-east", padding: 0.2)
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "south", 0.15)
    point(F, $F$, "south", 0.1)
  })
)

#proof[
  Define $Gamma_A$ as a circle with center $D$ and radius $D B$, define $Gamma_B, Gamma_C$ similarly. For the radical axis of $Gamma_A$ and $Gamma_B$ must be perpendicular to $D E$ and passes through C, same applies on other situation, the result is now obvious.
]

#problem(
  desp: "Problem 2.31 (IMO 1995/1)."
)[
  Let $A, B, C, D$ be four distinct points on a line, in that order. The circles with diameters $A C$ and $B D$ intersect at $X$ and $Y$ . The line $X Y$ meets $B C$ at $Z$. Let $P$ be a point on the line $X Y$ other than $Z$. The line $C P$ intersects the circle with diameter $A C$ at $C$ and $M$, and the line $B P$ intersects the circle with diameter $B D$ at $B$ and $N$. Prove that the lines $A M, D N, X Y$ are concurrent.
]

#graph(
  caption: [Problem 2.31 (IMO 1995/1).],
  cetz.canvas({
    import cetz.draw: *

    let A = (0, 0)
    let B = (2, 0)
    let C = (4.5, 0)
    let D = (7.5, 0)
    let O1 = midpoint(A, C)
    let O2 = midpoint(B, D)
    let c1 = get_circle_equation(O1, length(O1, A))
    let c2 = get_circle_equation(O2, length(O2, B))
    let (X, Y) = IP_cc(c1, c2)
    let BC = get_line_equation(B, C)
    let XY = get_line_equation(X, Y)
    let Z = IP_ll(BC, XY)
    let P = IP_ll(XY, (0, 1, -1))
    let BP = get_line_equation(B, P)
    let CP = get_line_equation(C, P)
    let (N, B) = IP_lc(BP, c2)
    let (C, M) = IP_lc(CP, c1)
    let AN = get_line_equation(A, M)
    let DM = get_line_equation(D, N)
    let Q = IP_ll(AN, DM)
    let O3 = circumcenter(B, C, N)
    let O4 = circumcenter(A, M, N)

    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north-west", 0.1)
    point(X, $X$, "south-east", 0.1)
    point(Y, $Y$, "north", 0.1)
    point(P, $P$, "west", 0.1)
    point(N, $N$, "south", 0.15)
    point(M, $M$, "south", 0.15)
    point(Q, $Q$, "south", 0.15)
    circle(O1, radius: length(O1, A), stroke: normal(colors.green), fill: colors.greent)
    circle(O2, radius: length(O2, D), stroke: normal(colors.green), fill: colors.greent)
    circle(O3, radius: length(O3, N), stroke: broken(colors.blue), fill: colors.cyant)
    circle(O4, radius: length(O4, D), stroke: broken(colors.orange), fill: colors.oranget)
    line(A, B, C, D)
    line(B, P, N, stroke: normal(colors.black))
    line(C, P, M, stroke: normal(colors.black))
    line(A, M, Q, N, D, stroke: broken(colors.red))
    line(Q, X, P, Y, stroke: broken(colors.red))
  })
)

#proof[
  #claim_p[
    $N, M, C, B$ are concyclic.
  ][
    Since $N P dot P C = X P dot P Y = B P dot P M$, we have the result easily.
  ]
  It suffices to show $A, N, M, D$ concyclic. In fact, we have
  $ angle.arc D A M = angle.arc C A M = pi / 2 − angle.arc M C B = pi / 2 − angle.arc M N B = pi / 2 + angle.arc B N M = angle.arc D N M $
  as desired.
]

#problem(
  desp: "Problem 2.32 (USAMO 1998/2)."
)[
  Let $cal(C)_1$ and $cal(C)_2$ be concentric circles, with $cal(C)_2$ in the interior of $cal(C)_1$. From a point $A$ on $cal(C)_1$ one draws the tangent $A B$ to $cal(C)_2$ ($B in cal(C)_2$). Let $C$ be the second point of intersection of ray $A B$ and $cal(C)_1$, and let $D$ be the midpoint of $A B$. A line passing through $A$ intersects $cal(C)_2$ at $E$ and $F$ in such a way that the perpendicular bisectors of $D E$ and $C F$ intersect at a point $M$ on $A B$. Find, with proof, the ratio $(A M) / (M C)$.
]

#proof[
  Since we have $A E dot A F = A B ^2 = A D dot A C => D, C, F, E$ concyclic. Therefore, $M$ is the midpoint of $D C$. Then we have
  $ (A M)  / (A C) = 5 / 3 $
]

#problem(
  desp: "Problem 2.33 (IMO 2000/1)."
)[
  Two circles $G_1$ and $G_2$ intersect at two points $M$ and $N$. Let $A B$ be the line tangent to these circles at $A$ and $B$, respectively, so that $M$ lies closer to $A B$ than $N$. Let $C D$ be the line parallel to $A B$ and passing through the point $M$, with $C$ on $G_1$ and $D$ on $G_2$. Lines $A C$ and $B D$ meet at $E$; lines $A N$ and $C D$ meet at P; lines $B N$ and $C D$ meet at $Q$. Show that $E P = E Q$.
]

#proof[
  Define $O_2 colon.eq$ the center of $G_2$, since $A B perp B O_2$ and $A B parallel C D$ we have $M B = D B$, on the other hand, we have $angle E B A = angle B D M = angle A B M$, similarly, $angle E A B = angle A C M = angle B A M$, we get $triangle E A B tilde.equiv triangle M A B ==> E B = M B$.

  That implies $angle E M Q = pi / 2$, it's well-known that $A B$'s midpoint lies on the radical axis of these two circle. Since $A B parallel P Q$, we deduce $M$ is the midpoint of $P Q$. It follows that $E P = E Q$ as well.
]

#problem(
  desp: "Problem 2.34 (Canada 1990/3)."
)[
  Let $A B C D$ be a cyclic quadrilateral whose diagonals meet at $P$. Let $W, X, Y, Z$ be the feet of $P$ onto $A B, B C, C D, D A$, respectively. Show that $W X + Y Z = X Y + W Z$.
]

#graph(
  caption: [Problem 2.34 (Canada 1990/3).],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c1 = get_circle_equation(O, 4)
    let A = point_on_circle(c1, 225deg)
    let B = point_on_circle(c1, 315deg)
    let C = point_on_circle(c1, 60deg)
    let D = point_on_circle(c1, 100deg)
    let AC = get_line_equation(A, C)
    let BD = get_line_equation(B, D)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CD = get_line_equation(C, D)
    let DA = get_line_equation(D, A)
    let P = IP_ll(AC, BD)
    let W = foot(AB, P)
    let X = foot(BC, P)
    let Y = foot(CD, P)
    let Z = foot(DA, P)
    let O1 = circumcenter(A, W, Z)
    let O2 = circumcenter(B, W, X)

    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "north-west", 0.1)
    point(C, $C$, "south-west", 0.1)
    point(D, $D$, "south", 0.15)
    point(W, $W$, "north", 0.15)
    point(X, $X$, "south-west", 0.1)
    point(Y, $Y$, "south", 0.15)
    point(Z, $Z$, "south-east", 0.1)
    point(P, $P$, "west", 0.15)
    circle(O, radius: 4, stroke: normal(colors.green), fill: colors.greent)
    circle(O1, radius: length(O1, P), stroke: broken(colors.red))
    circle(O2, radius: length(O2, P), stroke: broken(colors.red))
    line(A, W, B, X, C, Y, D, Z, A, stroke: normal(colors.black))
    line(A, P, C, stroke: normal(colors.black))
    line(B, P, D, stroke: normal(colors.black))
    line(W, P, X, stroke: normal(colors.orange))
    line(Y, P, Z, stroke: normal(colors.orange))
    line(X, W, Z, Y, X, stroke: normal(colors.magenta), fill: colors.magentat)
  })
)

#proof[
  Obviously, $P, X, B, W$ and $P, Z, A, W$ are concyclic. Since we have
  $ angle P W X = angle P B X = angle D B C = angle D A C = angle Z A P = angle Z W P $
  that implies $P$ lies on the angle bisector of $angle Z W X$, similarly, $P$ also lies on the angle bisector of $angle W X Y, angle X Y Z, angle Y W Z$. Hence, the distance from $P$ to each side were the same, the result is now trivial.
]

#problem(
  desp: "Problem 2.35 (IMO 2009/2)."
)[
  Let $A B C$ be a triangle with circumcenter $O$. The points $P$ and $Q$ are interior points of the sides $C A$ and $A B$, respectively. Let $K, L$, and $M$ be the midpoints of the segments $B P, C Q$, and $P Q$, respectively, and let $Gamma$ be the circle passing through K, L, and M. Suppose that the line P Q is tangent to the circle $Gamma$ . Prove that $O P = O Q$.
]

#proof[
  Notice that it's sufficient to show
  $ P o w (P, (A B C)) = P o w (Q, (A B C)) <==> A Q dot Q B = A P dot P C。 $
  In fact, we have,
  $ (A Q) / (A P) &= (P C) / (Q B) \
  (sin angle A P Q) / (sin angle A Q P) &= (M L) / (M K) \
  (sin angle Q P C) / (sin angle P Q B) &= (sin angle M K L) / (sin angle M L K) \
  (sin angle M P C) / (sin angle M Q B) &= (sin angle P M L) / (sin angle Q M K) $
  which is obvious.
]

#problem(
  desp: "Problem 2.36."
)[
  Let $A D, B E, C F$ be the altitudes of a scalene triangle $A B C$ with circumcenter O. Prove that $(A O D), (B O E)$, and $(C O F)$ intersect at point X other than O.
]

#graph(
  caption: [Problem 2.36.],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (4, 4.5)
    let C = (5, 0)
    let O = circumcenter(A, B, C)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let D = foot(BC, A)
    let E = foot(CA, B)
    let F = foot(AB, C)
    let O1 = circumcenter(A, O, D)
    let O2 = circumcenter(B, O, E)
    let O3 = circumcenter(C, O, F)
    let c1 = get_circle_equation(O1, length(O1, O))
    let c2 = get_circle_equation(O2, length(O2, O))
    let (X, O) = IP_cc(c1, c2)
    let H = orthocenter(A, B, C)

    circle(O, radius: length(O, A), stroke: normal(colors.orange), fill: colors.oranget)
    circle(O1, radius: length(O1, O), stroke: broken(colors.green), fill: colors.cyant)
    circle(O2, radius: length(O2, O), stroke: broken(colors.green), fill: colors.cyant)
    circle(O3, radius: length(O3, O), stroke: broken(colors.green), fill: colors.cyant)
    line(A, F, B, D, C, E, A, stroke: normal(colors.blue))
    line(A, D, stroke: broken(colors.magenta))
    line(B, E, stroke: broken(colors.magenta))
    line(C, F, stroke: broken(colors.magenta))
    line(O, H, X, stroke: normal(colors.red))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "east", 0.15)
    point(C, $C$, "north", 0.3)
    point(O, $O$, "north-east", 0.1)
    point(D, $D$, "north", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "east", 0.1)
    point(X, $X$, "north", 0.2)
    point(H, $H$, "north", 0.1)
  })
)

#proof[
  Notice that $P o w (H, (A O D)) = P o w (H, (B O E)) = P o w (H, (C O F))$, the result follows.
]

#problem(
  desp: "Problem 2.37 (Canada 2007/5)."
)[
  Let the incircle of triangle $A B C$ touch sides $B C, C A$, and $A B$ at $D, E$, and $F$, respectively. Let $omega, omega_1, omega_2$, and $omega_3$ denote the circumcircles of triangles $A B C$, $A E F$, $B D F$, and $C D E$ respectively. Let $omega$ and $omega_1$ intersect at $A$ and $P$, $omega$ and $omega_2$ intersect at $B$ and $Q$, $omega$ and $omega_3$ intersect at $C$ and $R$.
  + Prove that $omega_1$, $omega_2$, and $omega_3$ intersect in a common point.
  + Show that lines $P D, Q E$, and $R F$ are concurrent.
]

#graph(
  caption: [Problem 2.37. (Canada 2007/5).],
  cetz.canvas({
    import cetz.draw: *
    let A = (1, 4)
    let B = (0, 0)
    let C = (6, 0)
    let O = circumcenter(A, B, C)
    let I = incenter(A, B, C)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
  
    let O1 = circumcenter(A, E, F)
    let O2 = circumcenter(B, F, D)
    let O3 = circumcenter(C, D, E)
  
    let omega = get_circle_equation(O, length(O, A))
    let omega1 = get_circle_equation(O1, length(O1, A))
    let omega2 = get_circle_equation(O2, length(O2, B))
    let omega3 = get_circle_equation(O3, length(O3, C))
  
    let (P, n) = IP_cc(omega, omega1)
    let (n, Q) = IP_cc(omega, omega2)
    let (n, R) = IP_cc(omega, omega3)
    
    let On = circumcenter(E, D, P)
    let Om = circumcenter(D, F, R)
    let Ol = circumcenter(E, F, Q)

    circle(On, radius: length(On, P), stroke: broken(colors.magenta), fill: colors.magentat)
    circle(Om, radius: length(Om, R), stroke: broken(colors.magenta), fill: colors.magentat)
    circle(Ol, radius: length(Ol, Q), stroke: broken(colors.magenta), fill: colors.magentat)
    circle(O, radius: length(O, A), stroke: normal(colors.red))
    circle(O1, radius: length(O1, A), stroke: normal(colors.brown))
    circle(O2, radius: length(O2, B), stroke: normal(colors.brown))
    circle(O3, radius: length(O3, C), stroke: normal(colors.brown))
    line(P, D, stroke: normal(colors.cyan))
    line(Q, E, stroke: normal(colors.cyan))
    line(R, F, stroke: normal(colors.cyan))
    line(A, B, C, A, stroke: normal(colors.blue))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "east", 0.15)
    point(I, $I$, "south", 0.2)
    point(P, $P$, "east", 0.1)
    point(Q, $Q$, "east", 0.1)
    point(R, $R$, "north-west", 0.1)
  })
)

#proof(
  desp: "Part 1"
)[
  Obvious.
]

#proof(
  desp: "Part 2"
)[
  Notice that it suffices to show $E, D, Q, P$ concyclic.
  #lemma_p[
    Define $M colon.eq P D inter dot.o (A B C)$ other than $P$, $M$ is the midpoint of arc $B C$
  ][
    It suffices to show $angle B P D = angle C P D$. In fact, we have
    $ (P B) / (P C) = (B F) / (C E) = (B D) / (C D) $
  ]
  Since we have
  $ angle E P D &= angle A P D - angle A P E \
  &= B + A / 2 - (pi / 2 - A / 2) \
  &= A + B - pi / 2 $
  $ angle E Q D &= angle B Q E - angle B Q D \
  &= A + B / 2 - (pi / 2 - B / 2) \
  &= A + B - pi / 2 $
  Hence the result.
]

#problem(
  desp: "Problem 2.38 (Iran TST 2011/1)."
)[
  In acute triangle $A B C$, $angle B$ is greater than $angle C$. Let $M$ be the midpoint of $B C$ and let $E$ and $F$ be the feet of the altitudes from $B$ and $C$, respectively. Let $K$ and $L$ be the midpoints of $M E$ and $M F$, respectively, and let $T$ be on line $K L$ such that $T A parallel B C$. Prove that $T A = T M$.
]

#graph(
  caption: [Problem 2.38 (Iran TST 2011/1).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (1.5, 4)
    let C = (6, 0)
    let AB = get_line_equation(A, B)
    let AC = get_line_equation(A, C)
    let BC = get_line_equation(B, C)
    let E = foot(AC, B)
    let F = foot(AB, C)
    let M = midpoint(B, C)
    let K = midpoint(M, E)
    let L = midpoint(M, F)
    let KL = get_line_equation(K, L)
    let la = parallel_lp(BC, A)
    let T = IP_ll(KL, la)
    let O = circumcenter(A, E, F)

    line(A, F, B, M, C, E, A, stroke: normal(colors.green), fill: colors.greent)
    line(F, L, M, K, E, stroke: normal(colors.blue))
    line(L, K, T, stroke: broken(colors.orange))
    line(A, T, M, stroke: broken(colors.cyan))
    circle(O, radius: length(O, A), stroke: broken(colors.magenta), fill: colors.magentat)
    point(A, $A$, "south", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "east", 0.1)
    point(K, $K$, "north-west", 0.1)
    point(L, $L$, "north-east", 0.1)
    point(M, $M$, "north", 0.1)
    point(T, $T$, "west", 0.1)
  })
)

#proof[
  #lemma_p[
    $T A, M E, M F$ are both tangent to $dot.o (A E F)$
  ][
    See @Problem1.2.9
  ]
  Notice that $L M ^2 = L F ^2$ and $K M ^2 = K E ^2$, that implies $K L$ is the radical axis of $dot.o (A E F)$ and $dot.o (M)$. The result is now trivial.
]

= Lengths and Ratios

#quote(
  author: "Often attributed to Mark Twain"
)[
  Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.
]

#problem(
  desp: "Problem 3.16."
)[
  Let $A B C$ be a triangle with contact triangle $D E F$. Prove that $A D, B E, C F$ concur. The point of concurrency is the Gergonne point of triangle $A B C$.
]

#graph(
  caption: [Problem 3.16.],
  cetz.canvas({
    import cetz.draw: *

    let A = (3.5, 3.5)
    let B = (0, 0)
    let C = (5, 0)
    let I = incenter(A, B, C)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let AD = get_line_equation(A, D)
    let BE = get_line_equation(B, E)
    let G = IP_ll(AD, BE)

    circle(I, radius: length(I, D), stroke: broken(colors.blue))
    line(A, E, C, D, B, F, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(A, G, D, stroke: broken(colors.orange))
    line(B, G, E, stroke: broken(colors.orange))
    line(C, G, F, stroke: broken(colors.orange))
    point(A, $A$, "south", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "south-east", 0.1)
    point(G, $G$, "east", 0.3)
  })
)

#proof[
  In fact, we have
  $ (A E) / (E C) (C D) / (D B) (B F) / (F A) = (s - a) / (s - c) (s - c) / (s - b) (s - b) / (s - a) = 1, quad s = (a + b + c) / 2. $
]

#problem(
  desp: "Lemma 3.17."
)[
  In cyclic quadrilateral $A B C D$, points $X$ and $Y$ are the orthocenters of $triangle A B C$ and $triangle B C D$. Show that $A X Y D$ is a parallelogram.
]<Problem3.2>

#graph(
  caption: [Lemma 3.17.],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c = get_circle_equation(O, 3)
    let A = point_on_circle(c, 100deg)
    let B = point_on_circle(c, -135deg)
    let C = point_on_circle(c, -45deg)
    let D = point_on_circle(c, 60deg)
    let X = orthocenter(A, B, C)
    let Y = orthocenter(B, C, D)

    circle(O, radius: 3, stroke: normal(colors.red))
    line(A, B, C, D, A, stroke: normal(colors.yellow), fill: colors.redt)
    line(A, X, Y, D, stroke: normal(colors.brown))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "south", 0.15)
    point(X, $X$, "north", 0.15)
    point(Y, $Y$, "north", 0.15)
  })
)

#proof[
  Obviously $A X parallel D Y$. It suffices to show $A X = D Y$. WLOG Assume $R = 1$.
  $ A X = 2 cos angle B A C = 2 cos angle B D C = D Y $
  which is clear.
]

#problem(
  desp: "Problem 3.18."
)[
  Let $A D, B E, C F$ be concurrent cevians in a triangle, meeting at $P$. Prove that
  $ (P D) / (A D) + (P E) / (B E) + (P F) / (C F) = 1 $
]

#proof[
  It's trivial since
  $ (P D) / (A D) + (P E) / (B E) + (P F) / (C F) = [B P C] / [B A C] + [C P A] / [C B A] + [A P B] / [A C B] = [A B C] / [A B C] = 1 $
]

#problem(
  desp: "Problem 3.19 (Shortlist 2006/G3)."
)[
  Let $A B C D E$ be a convex pentagon such that
  $ angle B A C = angle C A D = angle D A E "and" angle A B C = angle A C D = angle A D E. $
  Diagonals $B D$ and $C E$ meet at $P$. Prove that ray $A P$ bisects $C D$.
]

#proof[
  Define $X colon.eq B D inter A C, Y colon.eq C E inter A D$
  
  Obviously we have $triangle A B C tilde triangle A C D tilde triangle A D E ==> A B C D tilde A C D E$, that implies $(A X) / (X C) = (A Y) / (Y D)$. From Ceva's theorem, the result is trivial.
]

#problem(
  desp: "Problem 3.20 (BAMO 2013/3)."
)[
  Let $H$ be the orthocenter of an acute triangle $A B C$. Consider the circumcenters of triangles $A B H$, $B C H$, and $C A H$. Prove that they are the vertices of a triangle that is congruent to $A B C$.
]

#graph(
  caption: [Problem 3.20 (BAMO 2013/3).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (3.5, 3.5)
    let C = (5, 0)
    let H = orthocenter(A, B, C)
    let O1 = circumcenter(A, B, H)
    let O2 = circumcenter(B, C, H)
    let O3 = circumcenter(C, A, H)

    line(A, B, C, A, stroke: normal(colors.red), fill: colors.redt)
    line(O1, O2, O3, O1, stroke: normal(colors.magenta), fill: colors.magentat)
    circle(O1, radius: length(O1, H), stroke: broken(colors.orange))
    circle(O2, radius: length(O2, H), stroke: broken(colors.orange))
    circle(O3, radius: length(O3, H), stroke: broken(colors.orange))
    point(A, $A$, "south", 0.3)
    point(B, $B$, "north-east", 0.15)
    point(C, $C$, "north-west", 0.15)
    point(H, $H$, "north", 0.3)
    point(O1, $O_1$, "south-east", 0.1)
    point(O2, $O_2$, "north", 0.15)
    point(O3, $O_3$, "south-west", 0.1)
  })
)

#proof[
  Notice that
  $ angle O_1 H O_3 &= angle O_1 H A + angle O_3 H A \
  &= (pi / 2 - (angle A O_1 H) / 2) + (pi / 2 - (angle A O_3 H) / 2) \
  &= pi - angle A B H - angle A C H \
  &= 2A $
  Same applies on $angle O_1 H O_2, angle O_2 H O_3$, thus $H$ is the circumcenter of $triangle O_1 O_2 O_3$. On the other hand,
  $ angle O_1 B C + angle O_3 C B &= B + C + angle O_1 B A + angle O_3 C A \
  &= B + C + (pi / 2 - (angle B O_1 A) / 2) + (pi / 2 - (angle C O_1 A) / 2) \
  &= pi $
  conclude the things above we get $O_1 B C O_3$ is a parallelogram, same for $O_1 A C O_2$ and $O_2 B A O_3$. Therefore, $triangle O_1 O_2 O_3 tilde.equiv triangle A B C$ (SSS)
]

#problem(
  desp: "Problem 3.21 (USAMO 2003/4)."
)[
  Let $A B C$ be a triangle. A circle passing through $A$ and $B$ intersects segments $A C$ and $B C$ at $D$ and $E$, respectively. Lines $A B$ and $D E$ intersect at $F$, while lines $B D$ and $C F$ intersect at $M$. Prove that $M F = M C$ if and only if $M B dot M D = M C ^2$.
]

#proof[
  Notice that
  $ M B dot M D = M C ^2 <==> angle B C M = angle C D M = angle A D B = angle A E B <==> ^ "Ceva" M F = M C $
]

#problem(
  desp: "Theorem 3.22 (Monge’s Theorem)."
)[
  Consider disjoint circles $omega_1, omega_2, omega_3$ in the plane, no two congruent. For each pair of circles, we construct the intersection of their common external tangents. Prove that these three intersections are collinear.
]<Problem3.7>

#proof[
  Let $O_1, O_2, O_3$ be the center of these three circle respectively. Applying Menelaus' Theorem solve this problem.
]

#problem(
  desp: "Theorem 3.23 (Cevian Nest)."
)[
  Let $A X, B Y, C Z$ be concurrent cevians of $A B C$. Let $X D, Y E, Z F$ be concurrent cevians in triangle $X Y Z$. Prove that rays $A D, B E, C F$ concur.
]<Problem3.8>

#proof[
  Define $P colon.eq A D inter B C, space Q colon.eq B E inter C A, space R colon.eq C F inter A B$
  
  Notice that
  $ (B P) / (P C) &= (A B sin Z A D) / (A C sin Y A D) \
  &= (A B) / (A C) (Z D dot Y A) / (Y D dot Z A) $
  same applies on $(C Q) / (Q A)$ and $(A R) / (R B)$. The result follows since Ceva.
]


#problem(
  desp: "Problem 3.24."
)[
  Let $A B C$ be an acute triangle and suppose $X$ is a point on $(A B C)$ with $A X parallel B C$ and $X != A$. Denote by $G$ the centroid of triangle $A B C$, and by $K$ the foot of the altitude from $A$ to $B C$. Prove that $K, G, X$ are collinear.
]

#graph(
  caption: [Problem 3.24.],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c = get_circle_equation(O, 3)
    let A = point_on_circle(c, 60deg)
    let B = point_on_circle(c, -150deg)
    let C = point_on_circle(c, -30deg)
    let BC = get_line_equation(B, C)
    let la = parallel_lp(BC, A)
    let (A, X) = IP_lc(la, c)
    let G = centroid(A, B, C)
    let K = foot(BC, A)
    let D = midpoint(B, C)
    let E = midpoint(C, A)
    let F = midpoint(A, B)
    let O1 = circumcenter(D, E, F)

    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(G, $G$, "north-east", 0.1)
    point(K, $K$, "north-west", 0.1)
    point(X, $X$, "south-east", 0.1)
    point(D, $D$, "north-east", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "south-east", 0.1)
    line(A, B, C, A, stroke: normal(colors.green), fill: colors.greent)
    circle(O, radius: 3, stroke: normal(colors.blue), fill: colors.bluet)
    circle(O1, radius: length(O1, K), stroke: broken(colors.orange))
    line(K, G, X, stroke: normal(colors.red))
  })
)

#proof(
  desp: "Homothety"
)[
  It's well-known that $G$ is still the centroid of the medial triangle.
  The problem is solved by using homothety at point $G$ with Nine-point circle and circumcircle.
]

#proof(
  desp: "Complex number"
)[
  WLOG Assume circumcircle be the unit circle. We define
  
  - $A = a$
  - $C = c$
  - $B = b = overline(c) = 1 / c$
  - $X = x = overline(a) = 1 / a$
  After some calculation

  - $G = g = 1 / 3 (a + b + c) = 1 / (3c) (a c + 1 + c ^2)$
  - $K = 1 / 2 (a + b + c - b c overline(a)) = 1 / (2 a c) (a ^2 c + a + a c ^2 - c)$
  It suffices to show
  $ (K - X) / (G - X) &= (1 / (2 a c) (a ^2 c + a + a c ^2 - c) - 1 / a) / (1 / (3c) (a c + 1 + c ^2) - 1 / a) \
  &= (3a (a ^2 c + a + a c ^2 - c) - 6 a c) / (2 a ^2 (a c + 1 + c ^2) - 6 a c) \
  &= (3 a ^3 c + 3 a ^2 + 3 a ^2 c ^2 - 9 a c) / (2 a ^3 c + 2 a ^2 + 2 a ^2 c ^2 - 6 a c) \
  &= 3 / 2 in RR $
  done.
]

#problem(
  desp: "Problem 3.25 (USAMO 1993/2)."
)[
  Let $A B C D$ be a quadrilateral whose diagonals $A C$ and $B D$ are perpendicular and intersect at $E$. Prove that the reflections of $E$ across $A B, B C, C D, D A$ are concyclic.
]

#proof[
  Define $W colon.eq E W perp A B, space X colon.eq E X perp B C, space Y colon.eq E Y perp C D, space Z colon.eq E Z perp D A$, Obviously $A, W, E, Z; space B, X, E, W; space C, Y, E, X; space D, Y, E, Z$ are concyclic. Further more,
  $ angle W X Y + angle W Z Y &= angle W X E + angle E X Y + angle W A E + angle E Z Y \
  &= angle W B E + angle E C Y + angle W A E + angle E D Y \
  &= pi $
  $==> W, X, Y, Z$ are concyclic, the result follows by homothety.
]

#problem(
  desp: "Problem 3.26 (EGMO 2013/1)."
)[
  The side $B C$ of the triangle $A B C$ is extended beyond $C$ to $D$ so that $C D = B C$. The side $C A$ is extended beyond $A$ to $E$ so that $A E = 2 C A$. Prove that if $A D = B E$ then the triangle $A B C$ is right-angled.
]

#proof[
  Define $F colon.eq B E inter A D$, notice that $A$ is the centroid of $triangle E B D$, also $F A = 1 / 2 A D = 1 / 2 B E ==> F A = F B = F E$, which implies $A B perp C E$ hence the result.
]

#problem(
  desp: "Problem 3.27 (APMO 2004/2)."
)[
  Let $O$ be the circumcenter and $H$ the orthocenter of an acute triangle $A B C$. Prove that the area of one of the triangles $A O H, B O H$, and $C O H$ is equal to the sum of the areas of the other two.
]

#proof[
  WLOG Assume $angle A < angle B < angle C, space R = 1$, We need to show $[B O H] = [A O H] + [C O H]$
  $ [A O H] = 1 / 2 A H d(O, A H) &= cos A sin(A - 2(pi / 2 - C)) \
  &= 1 / 2 (sin(2 B) - sin(2 C)) $
  $ [B O H] = 1 / 2 B H d(O, B H) &= cos B sin(B - 2(pi / 2 - C)) \
  &= 1 / 2 (sin(2 A) - sin(2 C)) $
  $ [C O H] = 1 / 2 C H d(O, C H) &= cos C sin(C - 2(pi / 2 - B)) \
  &= 1 / 2 (sin(2 A) - sin(2 B)) $
  The result is now obvious.
]

#problem(
  desp: "Problem 3.28 (Shortlist 2001/G1)."
)[
  Let $A_1$ be the center of the square inscribed in acute triangle $A B C$ with two vertices of the square on side $B C$. Thus one of the two remaining vertices of the square is on side $A B$ and the other is on $A C$. Points $B_1$ and $C_1$ are defined in a similar way for inscribed squares with two vertices on sides $A C$ and $A B$, respectively. Prove that lines $A A_1, B B_1, C C_1$ are concurrent.
]

#proof[
  Notice that
  $ (sin angle A_1 A B) / (sin angle A_1 A C) = sin(B + pi / 4) / sin(C + pi / 4) $
  Same applies on other two ratios, hence the result by Ceva.
]

#problem(
  desp: "Problem 3.29 (USA TSTST 2011/4)."
)[
  Acute triangle $A B C$ is inscribed in circle $omega$. Let $H$ and $O$ denote its orthocenter and circumcenter, respectively. Let $M$ and $N$ be the midpoints of sides $A B$ and $A C$, respectively. Rays $M H$ and $N H$ meet $omega$ at $P$ and $Q$, respectively. Lines $M N$ and $P Q$ meet at $R$. Prove that $O A perp R A$.
]

#graph(
  caption: [Problem 3.29 (USA TSTST 2011/4).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (5, 4)
    let C = (6, 0)
    let O = circumcenter(A, B, C)
    let c = get_circle_equation(O, length(O, A))
    let H = orthocenter(A, B, C)
    let M = midpoint(A, B)
    let N = midpoint(A, C)
    let MH = get_line_equation(M, H)
    let NH = get_line_equation(N, H)
    let (P, _) = IP_lc(MH, c)
    let (_, Q) = IP_lc(NH, c)
    let PQ = get_line_equation(P, Q)
    let MN = get_line_equation(M, N)
    let R = IP_ll(MN, PQ)
    let O1 = circumcenter(A, M, N)
    let O2 = circumcenter(M, N, P)

    circle(O, radius: length(O, A), stroke: normal(colors.red), fill: colors.oranget)
    circle(O1, radius: length(O1, A), stroke: normal(colors.red), fill: colors.oranget)
    circle(O2, radius: length(O2, Q), stroke: normal(colors.red), fill: colors.oranget)
    line(A, B, C, A, stroke: normal(colors.magenta))
    line(M, N, R, P, Q, stroke: broken(colors.blue))
    line(M, H, P, stroke: normal(colors.brown))
    line(N, H, Q, stroke: normal(colors.brown))
    line(O, A, R, stroke: broken(colors.blue))
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.05)
    point(O, $O$, "north", 0.1)
    point(H, $H$, "north", 0.15)
    point(M, $M$, "south-east", 0.1)
    point(N, $N$, "south-west", 0.1)
    point(P, $P$, "north-west", 0.1)
    point(Q, $Q$, "north", 0.1)
    point(R, $R$, "north", 0.1)
  })
)

#proof[
  Notice that $H P dot H M = 1 / 2 P o w (H, dot.o (A B C)) = H Q dot H N ==> M, N, P, Q$ concyclic. Also since $R$ is the radical center of $(A B C), (A M N), (M N P Q)$, the result follows.
]

#problem(
  desp: "Problem 3.30 (USAMO 2015/2)."
)[
  Quadrilateral $A P B Q$ is inscribed in circle $omega$ with $angle P = angle Q = 90 degree$ and $A P = A Q < B P$. Let $X$ be a variable point on segment $P Q$. Line $A X$ meets $omega$ again at $S$ (other than $A$). Point $T$ lies on arc $A Q B$ of $omega$ such that $X T$ is perpendicular to $A X$. Let $M$ denote the midpoint of chord $S T$. As $X$ varies on segment $P Q$, show that $M$ moves along a circle.
]

#proof[
  Notice that $P o w (A, dot.o (N_9)) = 1 / 2 A P ^2$ which is fixed, so is $A N_9$, since the homothety from the centroid $G$, the result follows.
]

= Assorted Configurations

#quote(
  author: "Frank Borman, Apollo 8 astronaut"
)[
  Exploration is really the essence of the human spirit.
]

#problem(
  desp: "Problem 4.41 (Hong Kong 1998)."
)[
  Let $P Q R S$ be a cyclic quadrilateral with $angle P S R = 90 degree$ and let $H$ and $K$ be the feet of the altitudes from $Q$ to lines $P R$ and $P S$. Prove that $H K$ bisects $Q S$.
]

#graph(
  caption: [Problem 4.41 (Hong Kong 1998).],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c = get_circle_equation(O, 3)
    let P = (-3, 0)
    let R = (3, 0)
    let Q = point_on_circle(c, 60deg)
    let S = point_on_circle(c, -100deg)
    let PS = get_line_equation(P, S)
    let PR = get_line_equation(P, R)
    let RS = get_line_equation(R, S)
    let H = foot(PR, Q)
    let K = foot(PS, Q)
    let M = midpoint(Q, S)
    let L = foot(RS, Q)

    circle(O, radius: 3, stroke: normal(colors.cyan), fill: colors.cyant)
    line(R, S, P, R, L, stroke: normal(color.blue))
    line(K, Q, H, stroke: normal(colors.magenta))
    line(L, Q, stroke: normal(colors.magenta))
    line(K, M, H, L, stroke: broken(colors.green))
    line(Q, M, S, stroke: broken(colors.green))
    point(P, $P$, "east", 0.15)
    point(Q, $Q$, "south", 0.15)
    point(R, $R$, "west", 0.15)
    point(S, $S$, "north", 0.15)
    point(H, $H$, "north", 0.15)
    point(K, $K$, "north-east", 0.1)
    point(M, $M$, "north-west", 0.1)
    point(L, $L$, "west", 0.15)
  })
)

#proof[
  According to Simson line, define $L := "The foot of the perpendicular from" Q "to" S R$. It suffices to show $L K$ bisects $Q S$, which is obvious since $S$ is the orthocenter of $triangle P R S$.
]

#problem(
  desp: "Problem 4.42 (USAMO 1988/4)."
)[
  Suppose $triangle A B C$ is a triangle with incenter $I$ . Show that the circumcenters of $triangle I A B, triangle I B C, "and" triangle I C A$ lie on a circle whose center is the circumcenter of $triangle A B C$.
]

#proof[
  Well-known that the circumcenter of $triangle I A B, triangle I B C, "and" triangle I C A$ lie on the midpoint of $"arc" A B, "arc" B C, "arc" C A$, respectively, the result follows.
]

#problem(
  desp: "Problem 4.43 (USAMO 1995/3)."
)[
  Given a non-isosceles, non-right triangle $A B C$, let $O$ denote its circumcenter, and let $A_1, B_1, "and" C_1$ be the midpoints of sides $B C, C A, "and" A B$, respectively. Point $A_2$ is located on the ray $O A_1$ so that $triangle O A A_1$ is similar to $triangle O A_2 A$. Points $B_2 "and" C_2$ on rays $O B_1 "and" O C_1$, respectively, are defined similarly. Prove that lines $A A_2, B B_2, "and" C C_2$ are concurrent.
]

#graph(
  caption: [Problem 4.43 (USAMO 1995/3).],
  cetz.canvas({
    import cetz.draw: *

    let A = (3.5, 3.5)
    let B = (0, 0)
    let C = (4, 0)
    let O = circumcenter(A, B, C)
    let A1 = midpoint(B, C)
    let OB = get_line_equation(O, B)
    let OC = get_line_equation(O, C)
    let B-tangent = perpendicular_lp(OB, B)
    let C-tangent = perpendicular_lp(OC, C)
    let A2 = IP_ll(B-tangent, C-tangent)
    let AA2 = get_line_equation(A, A2)
    let BC = get_line_equation(B, C)
    let D = IP_ll(AA2, BC)

    circle(O, radius: length(O, A), stroke: normal(colors.red))
    line(A, B, C, A, stroke: normal(colors.magenta), fill: colors.redt)
    line(A, O, A1, A, stroke: broken(colors.brown), fill: colors.brownt)
    line(A2, D, A, O, A2, stroke: broken(colors.brown), fill: colors.brownt)
    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(O, $O$, "east", 0.15)
    point(D, $D$, "north-west", 0.1)
    point(A1, $A_1$, "north-east", 0.1)
    point(A2, $A_2$, "north", 0.15)
  })
)

#proof[
  Define $D := A A_2 inter B C, space E := B B_2 inter C A, space F := C C_2 inter A B$. Since we have
  $ angle.arc A A_1 O + 90 degree + angle.arc A_1 B A + angle B A A_1 = 0 \
  angle.arc O A A_2 + angle.arc A_1 B A + angle.arc B A A_1 = 90 degree \
  (angle.arc B A C - angle.arc B A O - angle.arc A_2 A C) + angle.arc A_1 B A + angle.arc B A A_1 = 90 degree \
  - angle.arc A C B - 90 degree + angle.arc A C B - angle.arc A_2 A C + angle.arc B A A_1 = 90 degree \
  angle.arc B A A_1 = angle.arc A_2 A C $
  which implies $A A_2$ is the $A$-symmedian of $triangle A B C$, according to Ceva
  $ (B D) / (D C) (C E) / (E A) (A F) / (F B) = ((A B) / (B C)) ^2 ((B C) / (C A)) ^2 ((C A) / (A B)) ^2 = 1 $
  as desired.
]

#problem(
  desp: "Problem 4.44 (USA TST 2014)."
)[
  Let $A B C$ be an acute triangle and let $X$ be a variable interior point on the minor arc $B C$. Let $P$ and $Q$ be the feet of the perpendiculars from $X$ to lines $C A$ and $C B$, respectively. Let $R$ be the intersection of line $P Q$ and the perpendicular from $B$ to $A C$. Let $ell$ be the line through $P$ parallel to $X R$. Prove that as $X$ varies along minor arc $B C$, the line 	 always passes through a fixed point.
]

#proof[
  According to the property of Simson line, it's easy to show $P X R H$ is a parallelogram, and $H$ is the fixed point which satisfies the requirements of the question.
]

#problem(
  desp: "Problem 4.45 (USA TST 2011/1)."
)[
  In an acute scalene triangle $A B C$, points $D, E, F$ lie on sides $B C, C A, A B$, respectively, such that $A D perp B C, B E perp C A, C F perp A B$. Altitudes $A D, B E, C F$ meet at orthocenter $H$. Points $P$ and $Q$ lie on segment $E F$ such that $A P perp E F$ and $H Q perp E F$. Lines $D P "and" Q H$ intersect at point $R$. Compute $(H Q) / (H R)$.
]

#graph(
  caption: [Problem 4.45 (USA TST 2011/1).],
  cetz.canvas({
    import cetz.draw: *

    let A = (5.5, 5)
    let B = (0, 0)
    let C = (7, 0)
    let H = orthocenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, H)
    let E = foot(CA, H)
    let F = foot(AB, H)
    let EF = get_line_equation(E, F)
    let P = foot(EF, A)
    let Q = foot(EF, H)
    let HQ = perpendicular_lp(EF, H)
    let DP = get_line_equation(D, P)
    let R = IP_ll(DP, HQ)

    line(A, B, C, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(A, H, D, stroke: normal(colors.blue))
    line(B, H, E, stroke: normal(colors.blue))
    line(C, H, F, stroke: normal(colors.blue))
    line(D, E, Q, P, F, D, stroke: normal(colors.orange), fill: colors.oranget) 
    line(P, R, D, stroke: normal(colors.magenta))
    line(Q, H, R, stroke: normal(colors.red))
    line(A, P, stroke: normal(colors.red))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "north", 0.1)
    point(F, $F$, "south-east", 0.1)
    point(H, $H$, "east", 0.15)
    point(P, $P$, "west", 0.25)
    point(Q, $Q$, "south-west", 0.05)
    point(R, $R$, "north-east", 0.1)
  })
)

#solution(
  desp: "Projective Geometry"
)[
  Notice that
  $ (R, Q; H, P_infinity) = ^P (D, E F inter A D; H, A) = -1. $
  Since $A P parallel Q R$, which implies $H$ is the midpoint of $Q R$ $=> (H Q) / (H R) = 1$.
]

#solution(
  desp: "Pure Geometry"
)[
  Notice that for $triangle D E F$, $H$ is incenter, $A$ is $D$-excenter, $P$ is the tangent point of the excircle and $E F$, well-known $R$ is the opposite of $Q$ for the incircle. Hence $(H Q) / (H R) = 1$
]

#problem(
  desp: "Problem 4.46 (ELMO Shortlist 2012)."
)[
  Circles $Omega$ and $omega$ are internally tangent at point $C$. Chord $A B$ of $Omega$ is tangent to $omega$ at $E$, where $E$ is the midpoint of $A B$. Another circle, $omega_1$ is tangent to $Omega, omega$, and $A B$ at $D, Z$, and $F$ respectively. Rays $C D$ and $A B$ meet at $P$. If $M != C$ is the midpoint of major arc $A B$, show that
  $ tan angle Z E P = (P E) / (C M) $
]

#proof[
  Notice that $tan angle Z E P = (E Z) / (C E)$, it suffices to show
  $ (E Z) / (P E) = (C E) / (M C) $
  which is equivalent to $triangle Z C M tilde triangle Z E P$ since $angle Z C M = angle Z E P$. It suffices to show $ angle Z P E = angle Z M E <==> P, Z, E, M "concyclic" <==> P Z perp Z M $
  In fact, we have
  $ angle C E F = angle C D F = 90 degree => C, D, F, E "concyclic" $
  this implies $M$ lies on the radical axis of $omega "and" omega_1$, on the other hand, $P$ is the homothetic center of $omega "and" omega_1$, the result follows.
]

#problem(
  desp: "Problem 4.47 (USAMO 2011/5)."
)[
  Let $P$ be a point inside convex quadrilateral $A B C D$. Points $Q_1$ and $Q_2$ are located within $A B C D$ such that
  $ angle Q_1 B C = angle A B P, space angle Q_1 C B = angle D C P, $
  $ angle Q_2 A D = angle B A P, space angle Q_2 D A = angle C D P. $
Prove that $Q_1 Q_2 parallel A B$ if and only if $Q_1 Q_2 parallel C D$.
]

#proof[
  Define $E := A D inter B C$, notice that $Q_1$ is the isogonal conjugate of $P$ with respect to $triangle C D E$, $Q_2$ is the isogonal conjugate of $P$ with respect to $triangle A B E$, that implies $E, Q_1, Q_2$ are collinear, the result is now obvious.
]

#problem(
  desp: "Problem 4.48 (Japanese Olympiad 2009)."
)[
  Triangle $A B C$ is inscribed in circle. A circle with center $O$ is drawn, tangent to side $B C$ at a point $P$, and internally tangent to the arc $B C$ of not containing $A$ at a point $Q$. Show that if $angle B A O = angle C A O$ then $angle P A O = angle Q A O$.
]

#proof[
  Define $M := A O inter (A B C), space N := P Q inter (A B C)$, obviously $M N$ is the perpendicular bisector of the chord $B C$. According to the Reim's theorem, $Q, O, P, A$ are concyclic. Therefore,
  $ angle P A O = angle P Q O = angle Q P O = angle Q A O $
]

#problem(
  desp: "Problem 4.49."
)[
  Let $A B C$ be a triangle and let its incircle touch $B C$ at $D$. Let $T$ be the tangency point of the $A$-mixtilinear incircle with $(A B C)$. Prove that $angle B T A = angle C T D$.
]

#proof[
  Notice that it suffices to show $A, E, S$ collinear, where $E, S$ is the reflection of $D, T$ over the perpendicular bisector of $B C$. Well-known $A T$ and $A E$ is isogonal, redefine $S := A E inter (A B C)$, we have $S$ is the reflection of $T$ easily, the result follow.
]

#problem(
  desp: "Problem 4.50 (Vietnam TST 2003/2)."
)[
  Let $A B C$ be a scalene triangle with circumcenter $O$ and incenter $I$ . Let $H$, $K$, $L$ be the feet of the altitudes of triangle $A B C$ from the vertices $A, B, C$, respectively. Denote by $A_0, B_0, C_0$ the midpoints of these altitudes $A H$, $B K$, $C L$, respectively. The incircle of triangle $A B C$ touches the sides $B C$, $C A$, $A B$ at the points $D, E, F$, respectively. Prove that the four lines $A_0 D, B_0 E, C_0 F, "and" O I$ are concurrent.
]

#graph(
  caption: [Problem 4.50 (Vietnam TST 2003/2).],
  cetz.canvas({
    import cetz.draw: *

    let A = (4, 3.5)
    let B = (0, 0)
    let C = (5, 0)
    let O = circumcenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let I = incenter(A, B, C)
    let IA = excenter(A, B, C)
    let IB = excenter(B, C, A)
    let IC = excenter(C, A, B)
    let Op = circumcenter(IA, IB, IC)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let DIA = get_line_equation(D, IA)
    let EIB = get_line_equation(E, IB)
    let X = IP_ll(DIA, EIB)

    line(IA, IB, IC, IA, stroke: normal(colors.red), fill: colors.redt)
    line(A, B, C, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(D, E, F, D, stroke: normal(colors.red), fill: colors.redt)
    line(IA, D, X, stroke: broken(colors.blue))
    line(IB, E, X, stroke: broken(colors.blue))
    line(IC, F, X, stroke: broken(colors.blue))
    line(Op, O, I, X, stroke: normal(colors.purple))
    circle(O, radius: length(O, A), stroke: broken(colors.magenta))
    point(A, $A$, "south", 0.2)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(O, $O$, "north", 0.1)
    point(I, $I$, "north", 0.1)
    point(D, $D$, "north-west", 0.1)
    point(E, $E$, "south-west", 0.15)
    point(F, $F$, "south", 0.15)
    point(IA, $I_A$, "north", 0.15)
    point(IB, $I_B$, "west", 0.15)
    point(IC, $I_C$, "south-east", 0.1)
    point(X, $X$, "south", 0.15)
    point(Op, $O'$, "north", 0.1)
  })
)

#proof[
  Let $I_A, I_B, I_C$ denote the excenters. Well-known $A_0, D, I_A$ collinear, we take $I_A D$ instead, same for the others, also with the homothety $$ taking $triangle I_A I_B I_C |-> triangle D E F$, we already have $D I_A, E I_B, F I_C$ concur at the same point $X$. Define $O'$ be the circumcenter of $triangle I_A I_B I_C$, then we have $O' |-> I$ under $h$, and since $O$ became the nine-point center of $triangle I_A I_B I_C$, which implies $I, O, X, O'$ collinear. Hence the result.
]

#problem(
  desp: "Problem 4.51 (Sharygin 2013)."
)[
  The incircle of $triangle A B C$ touches $B C, C A, A B$ at points $A', B' "and" C'$ respectively. The perpendicular from the incenter $I$ to the $C$-median meets the line $A' B'$ in point $K$. Prove that $C K parallel A B$.
]

#graph(
  caption: [Problem 4.51 (Sharygin 2013).],
  cetz.canvas({
    import cetz.draw: *

    let A = (0, 0)
    let B = (6, 0)
    let C = (5, 4)
    let I = incenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let Ap = foot(BC, I)
    let Bp = foot(CA, I)
    let Cp = foot(AB, I)
    let M = midpoint(A, B)
    let CM = get_line_equation(C, M)
    let ABp = get_line_equation(Ap, Bp)
    let H = IP_ll(CM, ABp)
    let IK = perpendicular_lp(CM, I)
    let K = IP_ll(IK, ABp)

    line(A, B, C, A, stroke: normal(colors.blue), fill: colors.cyant)
    line(K, Bp, Cp, Ap, Bp, stroke: normal(colors.green))
    line(M, H, C, stroke: normal(colors.brown));
    line(H, I, Cp, stroke: broken(colors.red))
    line(I, C, K, I, stroke: normal(colors.orange), fill: colors.cyant)
    circle(I, radius: length(I, Ap), stroke: broken(colors.magenta))
    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "north-west", 0.1)
    point(C, $C$, "south", 0.1)
    point(Ap, $A'$, "south-west", 0.1)
    point(Bp, $B'$, "south", 0.15)
    point(Cp, $C'$, "north", 0.15)
    point(M, $M$, "north", 0.15)
    point(I, $I$, "west", 0.1)
    point(K, $K$, "south-east", 0.1)
    point(H, $H$, "south", 0.25)
  })
)

#proof[
  Notice that $H := C M inter A' B'$ is the orthocenter of $triangle K C I$, it suffices to show $H, C', I$ collinear, which is obvious.
]

#problem(
  desp: "Problem 4.52 (APMO 2012/4)."
)[
  Let $A B C$ be an acute triangle. Denote by $D$ the foot of the perpendicular line drawn from the point $A$ to the side $B C$, by $M$ the midpoint of $B C$, and by $H$ the orthocenter of $A B C$. Let $E$ be the point of intersection of the circumcircle $Gamma$ of the triangle $A B C$ and the ray $M H$, and $F$ be the point of intersection (other than $E$) of the line $E D$ and the circle $Gamma$. Prove that $(B F) / (C F) = (A B) / (A C)$ must hold.
]

#graph(
  caption: [Problem 4.52 (APMO 2012/4).],
  cetz.canvas({
    import cetz.draw: *

    let A = (4, 5)
    let B = (0, 0)
    let C = (6, 0)
    let H = orthocenter(A, B, C)
    let O = circumcenter(A, B, C)
    let BC = get_line_equation(B, C)
    let D = foot(BC, A)
    let M = midpoint(B, C)
    let MH = get_line_equation(M, H)
    let c = get_circle_equation(O, length(O, A))
    let (E, _) = IP_lc(MH, c)
    let ED = get_line_equation(D, E)
    let (_, F) = IP_lc(ED, c)

    circle(O, radius: length(O, A), stroke: normal(colors.red))
    line(A, B, C, A, stroke: normal(colors.blue), fill: colors.cyant)
    line(F, D, E, H, M, A, H, D, stroke: normal(colors.orange))
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(M, $M$, "north", 0.15)
    point(H, $H$, "north-west", 0.05)
    point(D, $D$, "north-west", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "north", 0.1)
  })
)

#proof[
  Well-known $A, E, D, M$ concyclic. In fact we have
  $ angle B A F = angle B E F = angle B E D = pi - angle E B C - angle E D B \
  = pi - angle E B C - (pi - angle M A E) = angle M A E - angle E A C = angle M A C $
  which show $A F$ is $A$-symmedian, hence the result.
]

#problem(
  desp: "Problem 4.53 (Shortlist 2002/G7)."
)[
  The incircle $Omega$ of the acute triangle $A B C$ is tangent to $B C$ at a point $K$. Let $A D$ be an altitude of triangle $A B C$, and let $M$ be the midpoint of the segment $A D$. If $N$ is the common point of the circle $Omega$ and the line $K M$ (distinct from $K$), then prove that the incircle $Omega$ and the circumcircle of triangle $B C N$ are tangent to each other at the point $N$.
]

#graph(
  caption: [Problem 4.53 (Shortlist 2002/G7).],
  cetz.canvas({
    import cetz.draw: *

    let A = (7, 6)
    let B = (0, 0)
    let C = (8, 0)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let I = incenter(A, B, C)
    let D = foot(BC, A)
    let M = midpoint(A, D)
    let K = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let AK = get_line_equation(A, K)
    let EF = get_line_equation(E, F)
    let P = IP_ll(EF, BC)
    let KM = get_line_equation(K, M)
    let c = get_circle_equation(I, length(I, K))
    let (X, _) = IP_lc(AK, c)
    let (N, _) = IP_lc(KM, c)
    let NP = get_line_equation(N, P)
    let (_, J) = IP_lc(NP, c)

    line(A, B, C, A, stroke: normal(colors.red))
    line(X, J, K, N, X, stroke: normal(colors.blue), fill: colors.bluet)
    line(X, P, N, J, stroke: normal(colors.cyan))
    line(F, E, P, C, stroke: normal(colors.cyan))
    line(K, X, A, M ,D, stroke: normal(colors.orange))
    circle(I, radius: length(I, K), stroke: normal(colors.brown), fill: colors.redt)
    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north", 0.15)
    point(I, $I$, "east", 0.15)
    point(K, $K$, "north", 0.15)
    point(D, $D$, "north", 0.15)
    point(M, $M$, "east", 0.15)
    point(N, $N$, "south", 0.3)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "south-east", 0.1)
    point(P, $P$, "north-west", 0.1)
    point(J, $J$, "south", 0.15)
    point(X, $X$, "south-east", 0.15)
  })
)

#proof[
  It's sufficient to show $K N$ bisects $angle B N C$.
  
  Define $J, X, P$, s.t. $E F inter B C =: P, space A K inter (K E F) =: X != K, space J K$ is the diameter of $(K E F)$. Well-known $(B, C; X, P) = -1$, it suffices to show $J, N, P$ collinear, since ${K D, K M, K A, K I}$ is harmonic bundles. We have $J X N K$ is harmonic quadrilateral. Well-known $P = X X inter K K$, the result follows.
]

= Computational Geometry

#quote(
  author: "Sir Richard Burton"
)[
  The gladdest moment in human life is a departure into unknown lands.
]

#problem(
  desp: "Problem 5.16 (Star Theorem)."
)[
  Let $A_1 A_2 A_3 A_4 A_5$ be a convex pentagon. Suppose rays $A_2 A_3$ and $A_5 A_4$ meet at the point $X_1$. Define $X_2, X_3, X_4, X_5$ similarly. Prove that $ product_(i = 1)^5 X_i A_(i + 2) = product_(i = 1)^5 X_i A_(i + 3) $
  where the indices are taken modulo 5.
]

#proof[
  It suffices to show
  $ product_(i = 1)^5 X_i A_(i + 2) : product_(i = 1)^5 X_i A_(i + 3) &= 1 \
  product_(i = 1)^5 (X_i A_(i + 2)) / (X_i A_(i + 3)) &= 1 \
  product_(i = 1)^5 (sin angle X_i A_(i + 3) A_(i + 2)) / (sin angle X_i A_(i + 2) A_(i + 3)) &= 1 \
  product_(i = 1)^5 (sin angle X_(i - 1) A_(i + 2) A_(i + 1)) / (sin angle X_i A_(i + 2) A_(i + 3)) &= 1 $
  which is obvious.
]

#problem(
  desp: "Problem 5.17."
)[
  Let $A B C$ be a triangle with inradius $r$. If the exradii of $A B C$ are $r_A, r_B, r_C,$ show that the triangle has area $sqrt(r dot r_A dot r_B dot r_C)$.
]

#proof[
  Well-known $r_A = (s r) / (s - a), space r_B = (s r) / (s - b), space r_C = (s r) / (s - c)$, it suffices to show
  $ sqrt((s^3 r^4) / ((s - a) (s - b) (s - c))) &= [A B C] \
  sqrt((s^4 r^4) / (s (s - a) (s - b) (s - c))) &= [A B C] \
  (s r)^2 &= [A B C] ^2 $
  which is obvious.
]

#problem(
  desp: "Problem 5.18 (APMO 2013/1)."
)[
  Let $A B C$ be an acute triangle with altitudes $A D, B E "and" C F$, and let $O$ be the center of its circumcircle. Show that the segments $O A, O F, O B, O D, O C, O E$ dissect the triangle $A B C$ into three pairs of triangles that have equal areas.
]

#graph(
  caption: [Problem 5.18 (APMO 2013/1).],
  cetz.canvas({
    import cetz.draw: *
    let A = (4, 4)
    let B = (0, 0)
    let C = (5, 0)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, A)
    let E = foot(CA, B)
    let F = foot(AB, C)
    let O = circumcenter(A, B, C)

    line(A, E, stroke: normal(colors.red))
    line(E, C, stroke: normal(colors.blue))
    line(C, D, stroke: normal(colors.green))
    line(D, B, stroke: normal(colors.red))
    line(B, F, stroke: normal(colors.blue))
    line(F, A, stroke: normal(colors.green))
    line(B, O, E, stroke: normal(colors.magenta))
    line(D, O, A, stroke: normal(colors.magenta))
    line(C, O, F, stroke: normal(colors.magenta))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "south-east", 0.1)
    point(O, $O$, "south-east", 0.1)
  })
)

#proof[
  WLOG Assume $R = 1$, calculate the area for each triangle:
  $ [A O E] = 1 / 2 c cos A cos B \
  [E O C] = 1 / 2 a cos C cos B \
  [C O D] = 1 / 2 b cos C cos A \
  [D O B] = 1 / 2 c cos B cos A \
  [B O F] = 1 / 2 a cos B cos C \
  [F O A] = 1 / 2 b cos A cos C $
  Hence the result.
]

#problem(
  desp: "Problem 5.19 (EGMO 2013/1)."
)[
  The side $B C$ of the triangle $A B C$ is extended beyond $C$ to $D$ so that $C D = B C$. The side $C A$ is extended beyond $A$ to $E$ so that $A E = 2 C A$. Prove that if $A D = B E$ then triangle $A B C$ is right-angled.
]

#proof[
  We start from $A D = B E$:
  $ A D ^2 &= B E ^2 \
  A E ^2 + A B ^2 - 2 A E dot A B cos angle B A E &= A C ^2 + C D ^2 - 2 A C dot C D cos angle A C D \
  (2 b) ^2 + c ^2 + 4 b c cos A &= b ^2 + a ^2 + 2 b a cos C \
  (2 b) ^2 + c ^2 + 2(b ^2 + c ^2 - a ^2) &= b ^2 + a ^2 + (a ^2 + b ^2 - c ^2) \
  b ^2 + c ^2 &= a ^2 $
  and we are done.
]

#problem(
  desp: "Problem 5.20 (Harvard-MIT Math Tournament 2013)."
)[
  Let triangle $A B C$ satisfy $2 B C = A B + A C$ and have incenter $I$ and circumcircle $omega$. Let $D$ be the intersection of $A I$ and $omega$ (with $A, D$ distinct). Prove that $I$ is the midpoint of $A D$.
]

#proof[
  Let $D E F$ be the contact triangle, with $D, E, F$ lie on $B C, C A, A B$ respectively, and $M$ lies on $B C$, s.t. $D M perp B C$. Since $2 B C = A B + A C$, we have $A E = A F = a / 2$. Notice that
  $ A I &= (A E) / (tan A / 2) = a / (2 tan A / 2) \
  I D &= I C = (I M) / (tan A / 2) = a / (2 tan A / 2) $
  the result is now obvious.
]

#problem(
  desp: "Problem 5.21 (USAMO 2010/4)."
)[
  Let $A B C$ be a triangle with $angle A = 90 degree$. Points $D$ and $E$ lie on sides $A C$ and $A B$, respectively, such that $angle A B D = angle D B C$ and $angle A C E = angle E C B$. Segments $B D$ and $C E$ meet at $I$. Determine whether or not it is possible for segments $A B, A C, B I, I D, C I, I E$ to all have integer lengths.
]

#proof[
  Actually, not even $A B, A C, B I, C I$ be all integer. Since
  $ B C ^2 &= B I ^2 + C I ^2 - 2 B I dot C I cos angle B I C \
  A B ^2 + A C ^2 - B I ^2 - C I ^2 &= sqrt(2) B I dot C I \
  sqrt(2) &= (A B ^2 + A C ^2 - B I ^2 - C I ^2) / (B I dot C I) $
  therefore, there's no way for $A B, A C, B I, C I$ be all integer.
]

#problem(
  desp: "Problem 5.22 (Iran Olympiad 1999)."
)[
  Let $I$ be the incenter of triangle ABC and let ray $A I$ meet the circumcircle of $A B C$ at $D$. Denote the feet of the perpendiculars from $I$ to lines $B D$ and $C D$ by $E$ and $F$, respectively. If $I E + I F = 1 / 2 A D$, calculate $angle B A C$.
]

#solution[
  WLOD Assume $R = 1$, get start from the condition $I E + I F = 1 / 2 A D$:
  $ I E + I F &= 1 / 2 A D \
  I D (sin C + sin B) &= 1 / 2 (sin (B + A / 2) + sin (C + A / 2)) \
  sin A / 2 (sin (C + B) / 2 sin (C - B) / 2) &= 1 / 4 sin (C - B) / 2 \
  2 sin A / 2 cos A / 2 &= 1 / 2 \
  sin A &= 1 / 2 \
  => angle A &= 30 degree "or" 150 degree $
  Hence the result.
]

#problem(
  desp: "Problem 5.23 (CGMO 2002/4)."
)[
  Circles $Gamma_1$ and $Gamma_2$ intersect at two points $B$ and $C$, and $B C$ is the diameter of $Gamma_1$. Construct a tangent line to circle $Gamma_1$ at $C$ intersecting $Gamma_2$ at another point $A$. Line $A B$ meets $Gamma_1$ again at $E$ and line $C E$ meets $Gamma_2$ again at $F$. Let $H$ be an arbitrary point on segment $A F$. Line $H E$ meets $Gamma_1$ again at $G$, and $B G$ meets $A C$ at $D$. Prove that
  $ (A H) / (H F) = (A C) / (C D) $
]

#proof[
  In fact, we have
  $ (A C) / (C D) &= (A B sin C B E) / (D B sin C B G) \
  &= (sin C D G sin C B E) / (sin C A E sin C B G) \
  &= (tan C B E) / (tan C B G) \
  &= (C E dot B G) / (G C dot B E) $
  $ (A H) / (H F) &= (E A sin B E G) / (E F sin C E G) \
  &= (C E sin B E G) / (B E sin C E G) \
  &= (C E dot B G) / (B E dot C G) $
  we are done.
]

#problem(
  desp: "Problem 5.24 (IMO 2007/4)."
)[
  In triangle $A B C$ the bisector of angle $B C A$ intersects the circumcircle again at $R$, the perpendicular bisector of $B C$ at $P$, and the perpendicular bisector of $A C$ at $Q$. The midpoint of $B C$ is $K$ and the midpoint of $A C$ is $L$. Prove that the triangles $R P K$ and $R Q L$ have the same area.
]

#proof[
  We will prove this question by using computational geometry, WLOG Assume $R = 1$ and start at $R C$:
  $ R C &= (R B dot A C + R A dot B C) / (A B) \
  &= (2 sin C / 2 (a + b)) / c \
  &= 2 sin C / 2 (a + b) / c \
  [R P K] &= 1 / 2 R P dot a / 2 sin C / 2 \
  &= 1 / 2 (2 sin C / 2 (a + b) / c - a / (2 cos C / 2)) a / 2 sin C / 2 \
  &= a / 8 tan C / 2 (a + b - a) \
  &= 1 / 8 a b tan C / 2 \
  [R Q L] &= 1 / 2 R Q dot b / 2 sin C / 2 \
  &= 1 / 2 (2 sin C / 2 (a + b) / c - b / (2 cos C / 2)) b / 2 sin C / 2 \
  &= b / 8 tan C / 2 (a + b - b) \
  &= 1 / 8 a b tan C / 2 $
  Hence the result.
]

#problem(
  desp: "Problem 5.25 (JMO 2013/5)."
)[
  Quadrilateral $X A B Y$ is inscribed in the semicircle $omega$ with diameter $X Y$. Segments $A Y$ and $B X$ meet at $P$. Point $Z$ is the foot of the perpendicular from $P$ to line $X Y$. Point $C$ lies on $omega$ such that line $X C$ is perpendicular to line $A Z$. Let $Q$ be the intersection of segments $A Y$ and $X C$. Prove that
  $ (B Y) / (X P) + (C Y) / (X Q) = (A Y) / (A X) $
]

#proof[
  Notice that $A Z parallel C Y$, then
  $ angle B X Y = angle P X Z = angle P A Z = angle C Y A = angle C X A $
  Let $angle B X Y = angle C X A = alpha, space angle B X A = angle C X Y = beta$, it suffices to show
  $ (B Y) / (X P) + (C Y) / (X Q) = 1 / (tan (pi / 2 - alpha - beta)) = tan (alpha + beta) $
  WLOG Assume $R = 1$, in fact, we have
  $ B Y &= 2 sin alpha \
  X P &= (A X) / (cos beta) = (2 cos (alpha + beta)) / (cos beta) \
  C Y &= 2 sin beta \
  X Q &= (A X) / (cos alpha) = (2 cos (alpha + beta)) / (cos alpha) $
  $ "LHS" = (sin alpha cos beta + sin beta cos alpha) / (cos (alpha + beta)) = (sin (alpha + beta)) / (cos (alpha + beta)) = tan (alpha + beta) = "RHS" $
  Hence the result.
]

#problem(
  desp: "Problem 5.26 (CGMO 2007/5)."
)[
  Point $D$ lies inside triangle $A B C$ such that $angle D A C = angle D C A = 30 degree$ and $angle D B A = 60 degree$. Point $E$ is the midpoint of segment $B C$. Point $F$ lies on segment $A C$ with $A F = 2 F C$. Prove that $D E perp E F$.
]

#proof[
  Define $M := "midpoint of" A C, space N := "midpoint of" D C$, obviously $D M perp A C$ and $ F N perp D C$, we have $D, N, F, M$ concyclic, with diameter $D F$, also $M E parallel A B$ and $E N parallel B D ==> angle D B A = angle N E M = 60 degree ==> D, E, N, F, M$ concyclic, because of $angle M D N = angle M E N = 60 degree$. Hence the result.
]

#problem(
  desp: "Problem 5.27 (ISL 2011/G1)."
)[
  Let $A B C$ be an acute triangle. Let $omega$ be a circle whose center $L$ lies on the side $B C$. Suppose that $omega$ is tangent to $A B$ at $B'$ and $A C$ at $C'$. Suppose also that the circumcenter $O$ of triangle $A B C$ lies on the shorter arc $B'C'$ of $omega$. Prove that the circumcircle of $A B C$ and $omega$ meet at two points.
]

#proof[
  It suffices to show $r = O L >= O M = cos A > 1 / 2 R$, with $M = "midpoint of" B C$, which mean $angle A < 60 degree$, in fact, we have
  $ angle B'O C' = pi - 1 / 2 angle B'L C = pi - 1 / 2 (pi - A) = pi / 2 - A / 2 $
  with $angle B' O C' > angle B O C = 2 A$, we get $A < 60 degree$, as needed.
]

#problem(
  desp: "Problem 5.28 (IMO 2001/1)."
)[
  Consider an acute-angled triangle $A B C$. Let $P$ be the foot of the altitude of triangle $A B C$ issuing from the vertex $A$, and let $O$ be the circumcenter of triangle $A B C$. Assume that $angle C >= angle B + 30 degree$. Prove that $angle A + angle C O P < 90 degree$.
]

#proof[
  Notice that it suffices to show $P C < P O <==> P C ^2 < P O ^2$
  $ P C ^2 < P O ^2 &<==> (b cos C) ^2 < cos ^2 A + (a / 2 - b cos C) ^2 \
  &<==> (b cos C) ^2 < 1 - a^2 / 4 + a^2 / 4 - a b cos C + (b cos C) ^2 \
  &<==> 4 sin A sin B cos C < 1 \
  &<==> 2 sin A (sin (B + C) - sin (C - B)) < 1 \ 
  &<==> 2 sin A (sin A - 1 / 2) < 2 (1 - 1 / 2) = 1 $
  Hence the result.
]

#problem(
  desp: "Problem 5.29 (IMO 2001/5)."
)[
  Let $A B C$ be a triangle. Let $A P$ bisect $angle B A C$ and let $B Q$ bisect $angle A B C$, with $P$ on $B C$ and $Q$ on $A C$. If $A B + B P = A Q + Q B$ and $angle B A C = 60 degree$, what are the angles of the triangle?
]

#proof[
  Let $angle A B C = 2 x$, since
  $ B P &= (sin 30 degree) / (sin (150 degree  - 2 x)) A B \
  A Q &= (sin x) / (sin (120 degree - x)) A B \
  B Q &= (sin 60 degree) / (sin (120 degree - x)) A B $
  we have
  $ 1 + (sin 30 degree) / (sin (150 degree  - 2 x)) = (sin x + sin 60 degree) / (sin (120 degree - x)) $
  Let $y = 1 / 2 x$, notice that
  $ sin (120 degree - 2y) &= sin (60 degree + 2y) = 2 sin (30 degree + y) cos (30 degree + y) \
  sin 2y + sin 60 degree &= 2 sin (30 degree + y) cos (30 degree - y) $
  therefore,
  $ 1 / (2 sin (150 degree  - 4 y)) = (cos (30 degree - y)) / (cos (30 degree + y)) - 1 = (2 sin 30 degree sin y) / (cos (30 degree + y)) $
  $ 2 sin y sin (150 degree - 4y) &= cos (30 degree + y) \
  2 (- 1 / 2) (cos (5 y + 30 degree) - cos (3 y + 30 degree)) &= cos (30 degree + y) \
  cos (y + 30 degree) + cos (5y + 30 degree) &= cos (3y + 30 degree) \
  2 cos (3y + 30 degree) cos 2y &= cos (3y + 30 degree) \
  cos (3y + 30 degree) (2 cos 2y - 1) &= 0 $
  Recall
  $ y = 1 / 2 x = 1 / 4 angle B < 1 / 4 (180 degree - angle A) = 30 degree $
  It's impossible for $cos 2y = 1 / 2$, then $cos (3y + 30 degree) = 0$, the only possible value for $y$ is $20 degree$, giving us $angle B = 40 degree "and" angle C = 80 degree$.
]

#problem(
  desp: "Problem 5.30 (IMO 2001/6)."
)[
  Let $a > b > c > d$ be positive integers and suppose that
  $ a c + b d = (b + d + a − c)(b + d − a + c) $
  Prove that $a b + c d$ is not prime.
]

#proof[
  Construct a quadrilateral $W X Y Z$, with $W X = a, X Y = b, Y Z = d, Z W = c$. Notice that the problem condition can be rewrite as $a^2 - a c + c^2 = b^2 + b d + d^2$, which can be consider as the length of $X Z$, finally shows $W X Y Z$ concyclic. Also since the strong form of Ptolemy's theorem
  $ X Z^2 = ((a d + b c)(a b + c d)) / (a c + b d) $
  Since $a > b > c > d$, we have $a b + c d > a c + b d > a d + b c$, assume $a b + c d$ isn't a prime then $(b^2 + b d + d^2)^2 = X Z^2 = ((a d + b c)(a b + c d)) / (a c + b d) in.not ZZ$, which is a contradiction. The result follows.
]

= Complex number

#problem(
  desp: "Problem 6.29."
)[
  Give a proof of the inscribed angle theorem using complex numbers.
]

#proof[
  Too easy, just do it yourself.
]

#problem(
  desp: "Lemma 6.30 (Complex Chord)."
)[
  Show that a point $P$ lies on a chord $A B$ of the unit circle if and only if $p + a b overline(p) = a + b$.
]

#proof[
  It's easy to spot that the foot from $P$ to $A B$ is itself, therefore
  $ p = 1 / 2 (p + a + b - a b overline(p)) $
  we have the result after simplify.
]

#problem(
  desp: "Problem 6.31."
)[
  Let $A B C D$ be a cyclic quadrilateral. Let $H_A, H_B, H_C, H_D$ denote the orthocenters of triangles $B C D, C D A, D A B, "and" A B C$, respectively. Prove that $A H_A, B H_B, C H_C, "and" D H_D$ concur.
]

#proof[
  Let $A = a, B = b, C = c, D = d$ lies on the unit circle, then we have
  $ H_A = b + c + d \
  H_B = a + c + d \
  H_C = a + b + d \
  H_D = a + b + c $
  Notice that for $P := (a + b + c + d) / 2$
  $ P &= 1 / 2 A + (1 - 1 / 2) H_A \
  &= 1 / 2 B + (1 - 1 / 2) H_B \
  &= 1 / 2 C + (1 - 1 / 2) H_C \
  &= 1 / 2 D + (1 - 1 / 2) H_D $
  which means P lies on $A H_A, B H_B, C H_C, "and" D H_D$ at the same time, hence the result.
]

#graph(
  caption: [Problem 6.31.],
  cetz.canvas({
    import cetz.draw: *

    let O = (0, 0)
    let c = get_circle_equation(O, 3)
    let A = point_on_circle(c, 70deg)
    let B = point_on_circle(c, 100deg)
    let C = point_on_circle(c, -135deg)
    let D = point_on_circle(c, -15deg)
    let HA = orthocenter(B, C, D)
    let HB = orthocenter(A, C, D)
    let HC = orthocenter(A, B, D)
    let HD = orthocenter(A, B, C)

    line(A, HA, stroke: normal(colors.black))
    line(B, HB, stroke: normal(colors.black))
    line(C, HC, stroke: normal(colors.black))
    line(D, HD, stroke: normal(colors.black))
    circle(O, radius: 3, stroke: normal(colors.black))
    point(A, $A$, "south", 0.15)
    point(B, $B$, "south", 0.15)
    point(C, $C$, "north-east", 0.1)
    point(D, $D$, "north-west", 0.1)
    point(HA, $H_A$, "north", 0.15)
    point(HB, $H_B$, "north", 0.15)
    point(HC, $H_C$, "west", 0.1)
    point(HD, $H_D$, "east", 0.1)
  })
)

#problem(
  desp: "Problem 6.32."
)[
  Let $A B C D$ be a quadrilateral circumscribed around a circle with center $I$. Prove that $I$ lies on the line joining the midpoints of $A C$ and $B D$.
]

#proof[
  Denote the circle (unit circle) tangent at $W, X, Y, Z$, which lie on $A B, B C, C D, D A$ respectively. Therefore, we have
  $ A = (2 z w) / (z + w) \
  B = (2 w x) / (w + x) \
  C = (2 x y) / (x + y) \
  D = (2 y z) / (y + z) \
  M = (A + C) / 2 = (w x y + w x z + w y z + x y z) / ((x + y)(z + w)) \
  N = (B + D) / 2 = (w x y + w x z + w y z + x y z) / ((w + x)(y + z)) $
  It suffices to show
  $ (M - I) / (N - I) = (M - 0) / (N - 0) = M / N = ((w + x)(y + z)) / ((x + y)(z + w)) in RR $
  Since $ overline((M / N)) &= ((1 / w + 1 / x)(1 / y + 1 / z)) / ((1 / x + 1 / y)(1 / z + 1 / w)) \
  &= ((x + w)(z + y)) / ((y + x)(w + z)) $
  Hence the result.
]

#problem(
  desp: "Problem 6.33 (Chinese TST 2011)."
)[
  Let $A B C$ be a triangle, and let $A', B', C'$ be points on its circumcircle, diametrically opposite $A, B, C$, respectively. Let $P$ be any point inside $A B C$ and let $D, E, F$ be the feet of the altitudes from $P$ onto $B C, C A, A B$, respectively. Let $X, Y, Z$ denote the reflections of $A', B', C'$ over $D, E, F$, respectively. Show that triangles $X Y Z$ and $A B C$ are similar to each other.
]

#proof[
  Assume $(A B C)$ is unit circle. Let $A = a, B = b, C = c, P = p$, then we have
  $ A' = -a, B' = -b, C' = -c \
  D = 1 / 2 (p + b + c - b c overline(p)) \
  E = 1 / 2 (p + c + a - c a overline(p)) \
  F = 1 / 2 (p + a + b - a b overline(p)) \
  X = p + a + b + c - b c overline(p) \
  Y = p + a + b + c - c a overline(p) \
  Z = p + a + b + c - a b overline(p) $
  It suffices to show
  $ (C - A) / (B - A) = (Z - X) / (Y - X) $
  Which is obvious.
]

#problem(
  desp: "Proposition 6.34 (Napoleon’s Theorem)."
)[
  Let ABC be a triangle and erect equilateral triangles on sides $B C, C A, A B$ outside of $A B C$ with centers $O_A, O_B, O_C$. Prove that $triangle O_A O_B O_C$ is equilateral and that its center coincides with the centroid of triangle $A B C$.
]

= Inversion

#problem(
  desp: "Problem 8.23."
)[
  Let $A B C$ be a right triangle with $angle C = 90 degree$ and let $X$ and $Y$ be points in the interiors of $C A$ and $C B$, respectively. Construct four circles passing through $C$, centered at $A, B, X, Y$. Prove that the four points lying on at exactly two of these four circles are concyclic.
]

#proof[
  Perform an inversion around $C$ with arbitrary radius.
  
  After inversion, obviously $dot.o A$ and $dot.o X$ will be a line perpendicular to segment $C B$, same for $dot.o B$ and $dot.o Y$. With $angle C = 90 degree$, we know that the quadrilateral from these four cline is a rectangle, which is concyclic, hence the result.
]

#problem(
  desp: "Problem 8.24."
)[
  Let $omega_1, omega_2, omega_3, omega_4$ be circles with consecutive pairs tangent at $A, B, C, D$, prove that quadrilateral $A B C D$ is cyclic.
]

#proof[
  Perform an inversion around $A$ with arbitrary radius. Denote the center of $omega_i^*$ as $O_i$, $i = 1, 2, 3, 4$.

  Under inversion, $omega_1$ and $omega_2$ become two straight line. WLOG Assume they are vertical. $omega_3$ and $omega_4$ keep as circle which fall between them with $omega_4$ and $omega_1$ tangent at $D$, $omega_3$ and $omega_4$ tangent at $C$, $omega_2$ and $omega_3$ tangent at $B$. It suffice to show $B, C, D$ collinear.

  Notice that it's easy to show $triangle D O_4 C tilde triangle B O_3 C$ since $O_4, C, O_3$ collinear, the result follow.
]

#problem(
  desp: "Problem 8.25."
)[
  Let $A, B, C$ be three collinear points and $P$ be a point not on this line. Prove that the circumcenters of $triangle P A B, triangle P B C, "and" triangle P C A$ lie on a circle passing through $P$.
]

#proof(
  desp: "Pure Geometry"
)[
  WLOG Assume $A, B, C$ lies in order. Notice that let $D$ be a arbitrary point lies on $triangle P A B$, define $E := A D inter (P A C), space F := B D inter C E$, with the property of complete quadrilateral, $F$ must lies on $(P B C)$, the result follows by the Miquel's point property. 
]

#proof(
  desp: "Inversion"
)[
  Perform an inversion around $P$ with $r = 1$. Denote $Z^*$ as the inversion of $Z$ and the center of $(P A B), (P B C), (P A C)$ as $O_1, O_2, O_3$, respectively.

  Under inversion, $(P A B), (P B C), (P A C)$ become line $A B, B C, C A$, respectively, with $P, A, B, C$ concyclic. Well-known that $A B$ perpendicular bisect $P O_1^*$, same holds for $P O_2^*$ and $P O_3^*$, notice that $O_1^* O_2^* O_3^*$ is the Steiner line of point $P$ with respect to $triangle A B C$, hence the result.
]

#problem(
  desp: "Problem 8.26 (BAMO 2008/6)."
)[
  A point $D$ lies inside triangle $A B C$. Let $A_1, B_1, C_1$ be the second intersection points of the lines $A D, B D, "and" C D$ with the circumcircles of $B D C, C D A, "and" A D B$, respectively. Prove that
  $ (A D) / (A A_1) + (B D) / (B B_1) + (C D) / (C C_1) = 1. $
]

#proof[
  Perform an inversion around $D$ with $r = 1$. Denote $Z^*$ as the inversion of $Z$.

  We obtain a triangle $A^* B^* C^*$，with $A_1^*, B_1^*, C_1^*$ lie on $B C, C A, A B$, respectively. Then we have
  $ (A D) / (A A_1) = (1 / (A^* D)) / (A D + D A_1) = 1 / (A^* D (1 / (A^* D) + 1/ (D A_1^*))) = (D A_1^*) / (D A_1^* + A^* D) = (D A_1^*) / (A^*A_1^*) $
  Same holds for $(B D) / (B B_1), (C D) / (C C_1)$, notice that the result is obvious, since all ratio can be expressed as areas.
]

#problem(
  desp: "Problem 8.27 (Iran Olympiad 1996)."
)[
  Consider a semicircle with center $O$ and diameter $A B$. $A$ line intersects line $A B$ at $M$ and the semicircle at $C$ and $D$ such that $M C > M D$ and $M B < M A$. Suppose $(A O C)$ and $(B O D)$ meet at a point $K$ other than $O$. Prove that $angle M K O = 90 degree$.
]

#proof[
  Perform an inversion around $O$ with $(A B C D)$. Denote $Z^*$ as the inversion of $Z$.

  We obtain that $K^* = A C inter B D, space M^* = (O C D) inter A B$. It suffices to show $K^* M^* perp A B$. Notice that $(O C D)$ is the nine-point circle of $triangle K^* A B$, hence the result.
]

#problem(
  desp: "Problem 8.28 (Shortlist 2003/G4)."
)[
  Let $Gamma_1, Gamma_2, Gamma_3, Gamma_4$ be distinct circles such that $Gamma_1, Gamma_3$ are externally tangent at $P$, and $Gamma_2, Gamma_4$ are externally tangent at the same point $P$. Suppose that $Gamma_1$ and $Gamma_2$, $Gamma_2$ and $Gamma_3$, $Gamma_3$ and $Gamma_4$, $Gamma_4$ and $Gamma_1$ meet at $A, B, C, D$, respectively, and that all these points are different from $P$. Prove that
  $ (A B dot B C) / (A D dot D C) = (P B ^2) / (P D ^2) $.
]

#proof[
  Perform an inversion around $P$ with $r = 1$. Denote $Z^*$ as the inversion of $Z$.

  From inversion, we obtain that $Gamma_1$ and $Gamma_3$ become vertical line, $Gamma_2$ and $Gamma_4$ become horizontal line, $A B C D$ form a rectangle.Back on to the question, in fact we have
  $ "LHS" = ((A^* B^* dot P A dot P B) (B^* C^* dot P B dot P C)) / ((A^* D^* dot P A dot P D) (D^* C^* dot P D dot P C)) = "RHS" $,
  and we are done.
]

#problem(
  desp: "Problem 8.29."
)[
  Let $A B C$ be a triangle with incenter $I$ and circumcenter $O$. Prove that line $I O$ passes through the centroid $G_1$ of the contact triangle.
]

#proof[
  Perform an inversion around $I$ with respect to the incircle of $triangle A B C$. Denote $Z^*$ as the inversion of $Z$.

  Notice that under inversion, $(A B C) |->$ the nine-point circle $(N_9)$ of contact triangle, which means $O, I, N_9$ collinear, also since $I, G, N_9$ colinear, we get the result.
]

#problem(
  desp: "Problem 8.30 (NIMO 2014)."
)[
  Let $A B C$ be a triangle and let $Q$ be a point such that $A B perp Q B$ and $A C perp Q C$. A circle with center $I$ is inscribed in $triangle A B C$, and is tangent to $B C, C A, "and" A B$ at points $D, E, "and" F$, respectively. If ray $Q I$ intersects $E F$ at $P$, prove that $D P perp E F$.
]

#graph(
  caption: [Problem 8.30 (NIMO 2014).],
  cetz.canvas({
    import cetz.draw: *

    let B = (0, 0)
    let A = (5, 5)
    let C = (7, 0)
    let O = circumcenter(A, B, C)
    let Q = reflection_point(O, A)
    let I = incenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let EF = get_line_equation(E, F)
    let QI = get_line_equation(Q, I)
    let c = get_circle_equation(O, length(O, Q))
    let (X, Q) = IP_lc(QI, c)
    let O1 = circumcenter(A, E, F)
    let P = foot(EF, D)

    point(A, $A$, "south", 0.15)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.15)
    point(E, $E$, "west", 0.15)
    point(F, $F$, "east", 0.15)
    point(I, $I$, "north", 0.15)
    point(Q, $Q$, "north-east", 0.1)
    point(P, $P$, "north-west", 0.15)
    point(X, $X$, "south-west", 0.1)
    circle(O, radius: length(O, Q)); circle(I, radius: length(I, D))
    circle(O1, radius: length(O1, A))
    line(A, B, C, A); line(Q, I, P, X); line(E, P, F); line(D, P)
  })
)

#proof[
  Perform an inversion around $I$ with respect to the incircle of $triangle A B C$. Denote $Z^*$ as the inversion of $Z$.

  From observe, $A, B, C, Q$ concyclic with diameter $A Q$. Expand $Q I$ intersect the circumcircle at $X$, since $angle A X I = angle A E I = angle A F I = 90 degree$, $A, F, I, E, X$ concyclic with diameter $A I$. Under inversion, $P = X^*$
  , since $(A B C) |->$ the nine-point circle $(N_9)$ of contact triangle, the result is obvious.
]

#problem(
  desp: "Problem 8.31 (EGMO 2013/5)."
)[
  Let $Omega$ be the circumcircle of the triangle $A B C$. The circle $omega$ is tangent to the sides $A C$ and $B C$, and it is internally tangent to the circle $Omega$ at the point $P$. $A$ line parallel to $A B$ intersecting the interior of triangle $A B C$ is tangent to $omega$ at $Q$. Prove that $angle A C P = angle Q C B$.
]

#proof[
  Perform an Force-Overlaid Inversion at $A$. Denote $Z^*$ as the inversion of $Z$.

  Define $Q' := "the" A"-excircle tangency point at segment" A B$, obviously $A, Q, Q'$ collinear. Under Force-Overlaid Inversion, well-known $P, Q$ switch their places, the result follows.
]

#problem(
  desp: "Problem 8.32 (Russian Olympiad 2009)."
)[
  In triangle $A B C$ with circumcircle $Omega$ , the internal angle bisector of $angle A$ intersects $B C$ at $D$ and $Omega$ again at $E$. The circle with diameter $D E$ meets $Omega$ again at F. Prove that $A F$ is a symmedian of triangle $A B C$.
]

#proof[
  Define $M := "midpoint of" B C$, it suffices to show under Force-Overlaid Inversion, $M, F$ are corresponding point.

  Notice that $A F, A M$ already isogonal, also $A F dot A M = A D dot A E$, hence the result.
]

#problem(
  desp: "Problem 8.33 (Shortlist 1997)."
)[
  Let $A_1 A_2 A_3$ be a non-isosceles triangle with incenter $I$. Let $C_i, i = 1, 2, 3$, be the smaller circle through $I$ tangent to $A_i A_(i + 1)$ and $A_i A_(i + 2)$ (indices taken mod 3). Let $B_i, i = 1, 2, 3$, be the second point of intersection of $C_(i + 1)$ and $C_(i + 2)$. Prove that the circumcenters of the triangles $A_1 B_1 I , A_2 B_2 I , A_3 B_3 I$ are collinear.
]

#proof[
  It suffices to show $(A_1 B_1 I) , (A_2 B_2 I) , (A_3 B_3 I)$ got two common point. Perform an inversion around $I$ with respect to the incircle of $triangle A_1 A_2 A_3$. Denote $Z^*$ as the inversion of $Z$. Let incircle of $triangle A_1 A_2 A_3$ tangent to $A_2 A_3, A_3 A_1, A_1 A_2$ at $D, E, F$ respectively.

  We got the following. A triangle $B_1^* B_2^* B_3^*$. Let $O_i, i = 1, 2, 3$, be the smaller circle through $I$ tangent to $B_i^* B_(i + 1)^*$ and $B_i^* B_(i + 2)^*$, also they both internally tangent to $(I)$ at $D, E, F$, respectively, with $I != A_i^* = O_(i + 1) inter O_(i + 2), i = 1, 2, 3$.

  Well-known $A_1^*$ is the midpoint of $E F$, same for $A_2^*, A_3^*$. From what we get, $O_1, O_2, O_3$ are congruent $==> E F parallel B_2^* B_3^*$, same applies on $D E, F D$. Summarize them we get $triangle B_1^* B_2^* B_3^*, triangle A_1^* A_2^* A_3^*$ are homothetic, hence the result.
]

#problem(
  desp: "Problem 8.34 (IMO 1993/2)."
)[
  Let $A, B, C, D$ be four points in the plane, with $C$ and $D$ on the same side of the line $A B$, such that $A C dot B D = A D dot B C$ and $angle A D B = 90 degree + angle A C B$. Find the ratio $(A B dot C D) / (A C dot B D)$, and prove that the circumcircles of the triangles $A C D$ and $B C D$ are orthogonal.
]

#proof[
  Perform an inversion around $A$ with $r = 1$. Denote $Z^*$ as the inversion of $Z$, $O_1, O_2$ be the circumcenter of $triangle A D C, triangle B D C$, respectively.

  transforming the condition...
  $ A C dot B D = A D dot B C \
  <==> 1 / (A C^*) (B^* D^*) / (A B^* dot A D^*) = 1 / (A D^*) (B^* C^*) / (A B^* dot A C^*) \
  <==> B^* D^* = B^* C^* $
  $ angle A D B = 90 degree + angle A C B \
  <==> angle A B^* D^* = 90 degree + angle A B^* C^* \
  <==> angle D^* B^* C^* = 90 degree $

  which means $triangle D^* B^* C^*$ is isosceles right-triangle, the result is now obvious
  $ (A B dot C D) / (A C dot B D) = (A C^* (C^* D^*) / (A C^* dot A D^*)) / (A B^* (B^* D^*) / (A B^* dot A D^*)) = (C^* D^*) / (B^* D^*) = sqrt(2) $

  Notice that $angle D A C + angle D B C = angle A D B - angle A C B = 90 degree$, which implies that $angle D C O_1 + angle D C O_2 = 180 degree$, hence the result.
]

#problem(
  desp: "Problem 8.35 (IMO 1996/2)."
)[
  Let $P$ be a point inside a triangle $A B C$ such that $angle A P B − angle A C B = angle A P C − angle A B C$. Let $D, E$ be the incenters of triangles $A P B, A P C$, respectively. Show that the lines $A P, B D, C E$ concur.
]

#proof[
  Perform an inversion around $A$ with $r = 1$. Denote $Z^*$ as the inversion of $Z$.

  transforming the condition...
  $ angle A P B − angle A C B = angle A P C − angle A B C \
  <==> angle A B^* P^* - angle A B^* C^* = angle A C^* P^* - angle A C^* B^* \
  <==> angle P^* B^* C^* = angle P^* C^* B^* \
  <==> P^* C^* = P^* B^* $

  it suffice to show
  $ (A B) / (B P) &= (A C) / (C P) \
  (A B^* (B^* P^*) / (A B^* dot A P^*)) = (A C^* (C^* P^*) / (A C^* dot A P^*)) \
  B^* P^* = C^* P^* $
  which is obvious.
]

#problem(
  desp: "Problem 8.36 (IMO 2015/3)."
)[
  Let $A B C$ be an acute triangle with $A B > A C$. Let $Gamma$ be its circumcircle, $H$ its orthocenter, and $F$ the foot of the altitude from $A$. Let $M$ be the midpoint of $B C$. Let $Q$ be the point on $Gamma$ such that $angle H Q A = 90 degree$ and let $K$ be the point on $Gamma$ such that $angle H K Q = 90 degree$. Assume that the points $A, B, C, K, "and" Q$ are all different and lie on $Gamma$ in this order. Prove that the circumcircles of triangles $K Q H$ and $F K M$ are tangent to each other.
]

#proof[
  Perform a negative inversion around $H$ with $r = sqrt(A H dot H F)$. Denote $Z^*$ as the inversion of $Z$.

  Notice that this inversion map $(A B C) |-> (N_9)$, well-known $M, H, Q$ collinear, also, $(K Q H) |-> ell, space (F K M) |-> (A K^* Q)$ s.t. $M in ell perp M H Q, space K^* = (N_9) inter ell$ , it suffices to show $ell$ tangent to $(A K^* Q)$ at $K^*$. Denote $O_1, O_2$ as the circumcenter of $(A H Q), (A K^* Q)$, respectively. Obviously, $A Q perp O_1 O_2$. Since $A Q parallel ell$, $O_1 O_2 perp ell$. Notice that $O_1 K^* perp ell$ as $O_1 M$ is the diameter of $(N_9)$, we have $O_2 K^* perp ell$, hence the result.
]

#problem(
  desp: "Problem 8.37 (ELMO Shortlist 2013)."
)[
  Let $omega_1$ and $omega_2$ be two orthogonal circles, and let the center of $omega_1$ be $O$. Diameter $A B$ of $omega_1$ is selected so that $B$ lies strictly inside $omega_2$. The two circles tangent to $omega_2$ through both $O$ and $A$ touch $omega_2$ at $F$ and $G$. Prove that quadrilateral $F O G B$ is cyclic.
]

#proof[
  Perform the first inversion around $O$ with respect to the $omega_1$. Denote $Z^*$ as the inversion of $Z$, $P$ be the circumcenter of $omega_2$.

  Notice that $A F^*, A G^*$ is tangent to $omega_2^*$ at $F^*, G^*$, respectively. It suffices to show $F^* B G^*$ collinear.

  Perform the second inversion around $P$ with respect to the $omega_2$. Denote $Z^*$ as the inversion of $Z$.

  It suffices to show $F^* P G^* B^*$ concyclic. Notice that they all lie on the circle with diameter $A P$, as result.
]

= Projective Geometry

#problem(
  desp: "Lemma 9.40 (Incircle Polars)."
)[
  Let $A B C$ be a triangle with contact triangle $D E F$ and incenter $I$. Lines $E F$ and $B C$ meet at $K$. Prove that $I K perp A D$.
]<Problem8.1>

#proof[
  Obvious.
]

#problem(
  desp: "Theorem 9.41 (Desargues’ Theorem)."
)[
  Let $A B C$ and $X Y Z$ be triangles in the projective plane. We say that the two triangles are perspective from a point if lines $A X, B Y, "and" C Z$ concur (possibly at infinity), and we say they are perspective from a line if the points $A B inter X Y, B C inter Y Z, C A inter Z X$ are collinear. Prove that these two conditions are equivalent.
]<Problem8.2>

#proof[
  Notice that, the problem is purely projective! It reduces the problem into a simple homothetic.
]

#problem(
  desp: "Problem 9.42 (USA TSTST 2012/4)."
)[
  In scalene triangle $A B C$, let the feet of the perpendiculars from $A$ to $B C$, $B$ to $C A$, $C$ to $A B$ be $A_1, B_1, C_1$, respectively. Denote by $A_2$ the intersection of lines $B C$ and $B_1 C_1$. Define $B_2$ and $C_2$ analogously. Let $D, E, F$ be the respective midpoints of sides $B C, C A, A B$. Show that the perpendiculars from $D$ to $A A_2$, $E$ to $B B_2$, and $F$ to $C C_2$ are concurrent.
]

#proof[
  We claim that the concurrent point is the orthocenter of $triangle A B C$. Denote as $H$.

  Let $M := D H inter (A B C)$, it suffices to show $A_2 = A M inter B_1 C_1 inter B C$, in fact, $A_2$ is the radical center of $(B C C_1 B_1), (A B C), (A B_1 C_1)$.
]

#problem(
  desp: "Problem 9.43 (Singapore TST)."
)[
  Let $omega$ and $O$ be the circumcircle and circumcenter of right triangle $A B C$ with $angle B = 90 degree$. Let $P$ be any point on the tangent to $omega$ at $A$ other than $A$, and suppose ray $P B$ intersects $omega$ again at $D$. Point $E$ lies on line $C D$ such that $A E parallel B C$. Prove that $P, O$, and $E$ are collinear.
]

#proof[
  Let $F := A E inter A B C$, applying Pascal's theorem solve this problem.
]

#problem(
  desp: "Problem 9.44 (Canada 1994/5)."
)[
  Let $A B C$ be an acute triangle. Let $A D$ be the altitude on $B C$, and let $H$ be any interior point on $A D$. Lines $B H$ and $C H$, when extended, intersect $A C, A B$ at $E$ and $F$ respectively. Prove that $angle E D H = angle F D H$.
]

#proof[
  Notice that, it suffices to show $(F, F C inter D E; H, C) = -1$, which is obvious.
]

#problem(
  desp: "Problem 9.45 (Bulgarian Olympiad 2001)."
)[
  Let $A B C$ be a triangle and let $k$ be a circle through $C$ tangent to $A B$ at $B$. Side $A C$ and the $C$-median of $triangle A B C$ intersect $k$ again at $D$ and $E$, respectively. Prove that if the intersecting point of the tangents to $k$ through $C$ and $E$ lies on the line $B D$ then $angle A B C = 90 degree$.
]

#proof[
  Notice that the condition means $D E B C$ is harmonic quadrilateral. Denote $M := "midpoint of" A B, X := "the intersecting point of the tangents to" k "through" C "and" E$. Since both $C X$ and $A B$ is tangent to $k$,
  $ -1 = (B, D; E, C) =^C (B, A; M, X) $
  which means $C X parallel A B$, implies that $C B$ is the diameter of $k$, hence the result.
]

#problem(
  desp: "Problem 9.46 (ELMO Shortlist 2012)."
)[
  Let $A B C$ be a triangle with incenter $I$. The foot of the perpendicular from $I$ to $B C$ is $D$, and the foot of the perpendicular from $I$ to $A D$ is $P$. Prove that $angle B P D = angle D P C$.
]

#proof[
  Define circle $(I)$ tangent to $A C, A B$ at $E, F$, respectively. It suffices to show $E F$, $I P$, $B C$ collinear. In fact, $A, E, F, I, P$ lie on the circle with diameter $A I$, also $B, I, P, C$ lie on the circle with diameter $I I_A$, applying the radical axis theorem solve the problem.
]

#problem(
  desp: "Problem 9.47 (IMO 2014/4)."
)[
  Let $P$ and $Q$ be on segment $B C$ of an acute triangle $A B C$ such that $angle P A B = angle B C A$ and $angle C A Q = angle A B C$. Let $M$ and $N$ be the points on $A P$ and $A Q$, respectively, such that $P$ is the midpoint of $A M$ and $Q$ is the midpoint of $A N$. Prove that the intersection of $B M$ and $C N$ is on the circumference of triangle $A B C$.
]

#proof[
  Notice that $B B parallel A P, C C parallel A Q$, since $angle Q A C = angle A B C = angle (A C, C C)$. Therefore, Denote $X := A M inter (A B C), X' := A N inter (A B C)$, we have $A B X C, A B X' C$ both harmonic quadrilateral, then $X = X'$, hence the result.
]

#problem(
  desp: "Problem 9.48 (Shortlist 2004/G8)."
)[
  Given a cyclic quadrilateral $A B C D$, let $M$ be the midpoint of the side $C D$, and let $N$ be a point on the circumcircle of triangle $A B M$. Assume that the point $N$ is different from the point $M$ and satisfies $(B N) / (A N) = (B M) / (A M)$. Prove that the points $E, F, N$ are collinear, where $E = A C inter B D$ and $F = B C inter D A$.
]

#proof[
  Let $T := F E inter C D, space S := A B inter C D$, we have $(D, C; T, S) = -1 ==> S D dot S C = S T dot S M = S A dot S B$, which implies $T$ lies on $(A B M)$.

  Notice that
  $ -1 = (A, B; F T inter A B) =^T (A, B, N, M) $
  hence the result.
]

#problem(
  desp: "Problem 9.49 (Sharygin 2013)."
)[
  The incircle of triangle $A B C$ touches $B C$, $C A$, and $A B$ at points $A', B', "and" C'$ respectively. The perpendicular from the incenter $I$ to the C-median meets the line $A' B'$ in point $K$. Prove that $C K parallel A B$.
]

#proof[
  Define $T := I K inter C M, space S := A' B' inter C M$, where $M$ is the midpoint of $A B$. Notice that it suffices to show $(A', B'; S, K) =^C (B, A; M, K) = -1$, since $C, A', I, T, B'$ all lie on the circle with diameter $C I$, we have $S T perp T K$, we also have $C S T$ bisects $angle A' T B'$, which implies $(A', B'; S, K) = -1$, as result.
]

#problem(
  desp: "Problem 9.50 (Shortlist 2004/G2)."
)[
  Let $Gamma$ be a circle and let $d$ be a line such that $Gamma$ and $d$ have no common points. Further, let $A B$ be a diameter of the circle $Gamma$; assume that this diameter $A B$ is perpendicular to the line $d$, and the point $B$ is nearer to the line $d$ than the point $A$. Let $C$ be an arbitrary point on the circle $Gamma$ , different from the points $A$ and $B$. Let $D$ be the point of intersection of the lines $A C$ and $d$. One of the two tangents from the point $D$ to the circle $Gamma$ touches this circle $Gamma$ at a point $E$; hereby, we assume that the points $B$ and $E$ lie in the same half-plane with respect to the line $A C$. Denote by $F$ the point of intersection of the lines $B E$ and $d$. Let the line $A F$ intersect the circle $Gamma$ at a point $G$, different from $A$. Prove that the reflection of the point $G$ in the line $A B$ lies on the line $C F$.
]

#proof[
  Notice that applying Pascal's theorem on $C A G E E B$, we get $B C inter G E$ is collinear with $F, D$, apply Pascal's theorem again on $C G' G E B B$, we have the result.
]

#problem(
  desp: "Problem 9.51 (USA January TST for IMO 2013)."
)[
  Let $A B C$ be an acute triangle. Circle $omega_1$, with diameter $A C$, intersects side $B C$ at $F$ (other than $C$). Circle $omega_2$, with diameter $B C$, intersects side $A C$ at $E$ (other than $C$). Ray $A F$ intersects $omega_2$ at $K$ and $M$ with $A K$ < $A M$. Ray $B E$ intersects $omega_1$ at $L$ and $N$ with $B L < B N$. Prove that lines $A B, M L, N K$ are concurrent.
]

#proof[
  #claim_p[
    $N, K, L, M$ are concyclic.
  ][
    Obviously, $H = K M inter L N$, which is orthocenter. Define $D$ lies on $A B$ s.t. $C D perp A B$. Notice that
    $ H K dot H M = C H dot H D = H L dot H N $
    as result.
  ]
  Notice that
  $A L ^2 = A N ^2 = A E dot A C = A K dot A M$, which means $A L$ is tangent to $(N K L M)$, same also applies on $B K$. Applying Pascal's theorem on $M K N L L M$ solve the problem.
]

#problem(
  desp: "Problem 9.52 (Brazilian Olympiad 2011/5)."
)[
  Let $A B C$ be an acute triangle with orthocenter $H$ and altitudes $B D, C E$. The circumcircle of $A D E$ cuts the circumcircle of $A B C$ at $F != A$. Prove that the angle bisectors of $angle B F C$ and $angle B H C$ concur at a point on $B C$.
]

#proof(
  desp: "Pure Geometry"
)[
  Define $M_1, M_2$ lie on $B C$ s.t. $F M_1, H M_2$ bisect $angle B F C, angle B H C$ respectively.

  Computing...
  $ (B M_1) / (C M_1) = (B F) / (C F) = (B E) / (C D) $
  $ (B M_2) / (C M_2) = (B H) / (C H) = (B E) / (C D) $
  as result.
]

#proof(
  desp: "Projective Geometry"
)[
  Denote $H'$ as the reflection of the orthocenter $H$. It suffices to show $F B H' C$ is the harmonic quadrilateral.
]

#problem(
  desp: "Problem 9.53 (ELMO Shortlist 2013)."
)[
  In $triangle A B C$, a point $D$ lies on line $B C$. The circumcircle of $A B D$ meets $A C$ at $F$ (other than $A$), and the circumcircle of $A D C$ meets $A B$ at $E$ (other than $A$). Prove that as $D$ varies, the circumcircle of $A E F$ always passes through a fixed point other than $A$, and that this point lies on the median from $A$ to $B C$.
]

#proof[
  Notice that perform an Force-Overlaid Inversion at $A$. Denote $Z^*$ as the inversion of $Z$, we have $C^* = B, B^* = C$
  
  $D^*$ become an interior point lies on $(A B C)$, we have $E^* = A B inter C D^*, F^* = A C inter B D^*$. It suffices to show $E^* F^*$ pass through a fixed point while lies on $A$-symmedian.

  Notice that applying Pascal's theorem on $C C D^* B B A$, we have $X := C C inter B B$ collinear w  ith $E^*, F^*$, since $A X$ is $A$-symmedian, as result.
]

#problem(
  desp: "Problem 9.54 (APMO 2008/3)."
)[
  Let $Gamma$ be the circumcircle of a triangle $A B C$. A circle passing through points $A$ and $C$ meets the sides $B C$ and $B A$ at $D$ and $E$, respectively. The lines $A D$ and $C E$ meet $Gamma$ again at $G$ and $H$, respectively. The tangent lines to $Gamma$ at $A$ and $C$ meet the line $D E$ at $L$ and $M$, respectively. Prove that the lines $L H$ and $M G$ meet at $Gamma$.
]

#proof[
  We define $T := D E inter A C, space X := B T inter (A B C)$, we'll show that $X$ is the point which satisfied this problem.

  Notice that applying Pascal' theorem on
  
  - $X G A C C B ==> D M T$ collinear.
  - $X H C A A B ==> E L T$ collinear.

  Since $D E T$ already collinear, we have $D, E, L, M, T$ collinear, as result.
]

#problem(
  desp: "Theorem 9.55 (Brianchon’s Theorem)."
)[
  Let $A B C D E F$ be a hexagon circumscribed about a circle $omega$. Prove that $A D, B E, C F$ are concurrent.
]

#proof[
  We will use the convention in which the points will be denoted by capital latin letters, and their respective polars with the corresponding lowercase letters.
  
  Denote by $M_i, i = 1, 2, dots, 6$, the points of tangency of $A_i A_(i + 1)$ with $k$. Obviously, $a_i = M_(i - 1) M_i$.
  
  Let $b_j = A_j A_(j + 3), j = 1, 2, 3$. Then $B_j = a_j inter a_(j + 3) = M_(j - 1) M_j inter M_(j + 3) M_(j + 4)$. We have to prove that there exists a point $P$ such that $P in b_1, b_2, b_3$, or analogously, that there is a line $p$ such that $B_1, B_2, B_3 in p$. In other words we have to prove that the points $B_1 B_2 B_3$ are collinear. However this immediately follows from the Pascal's theorem applied to $M_1 M_3 M_5 M_4 M_6 M_2$.
]

#problem(
  desp: "Problem 9.56 (ELMO Shortlist 2014)."
)[
  Suppose $A B C D$ is a cyclic quadrilateral inscribed in the circle $omega$. Let $E = A B inter C D "and" F = A D inter B C$. Let $omega_1, omega_2$ be the circumcircles of triangles $A E F, C E F$, respectively. Let $G$ and $H$ be the intersections of $omega "and" omega_1, omega "and" omega_2$, respectively, with $G != A$ and $H != C$. Show that $A C, B D, "and" G H$ are concurrent.
]

#proof[
  Denote $K$ be the radical center of these three circle, $O$ be the circumcenter of circle $(A B C)$. Define $P := A C inter B D, space P' := A C inter G H, space X := A A inter C C, space S := A H inter G C$

  At first, applying Pascal's Theorem on

  - $A A B C C D ==> E F X$ collinear
  - $A A G C C H ==> X S K$ collinear

  Then we have $E, F, K, X, S$ collinear
  
  Applying Brocard's theorem on $A B C D$ and $A G C H$, we have $O P perp E F, O P' perp K S$. Since $P, P'$ both $in A C$. Implies that, $P = P'$, hence the result.
]

#problem(
  desp: "Problem 9.57 (ELMO Shortlist 2014)."
)[
  Let $A B C D$ be a cyclic quadrilateral inscribed in circle $omega$. The tangent to $omega$ at $A$ intersects lines $C D$ and $B C$ at $E$ and $F$. Lines $B E$ and $D F$ meet $omega$ again $G$ and $I$, and $H = B E inter A D, J = D F inter A B$. Prove that $G I, H J$, and the $B$-symmedian of $triangle A B C$ are concurrent.
]

#proof[
  It suffices to show $A A, C C, G I, J H$ concurrent. Define $K := A A inter G I, space K' := C C inter G I$

  Applying Pascal's theorem on
  
  - $A B G I D A ==> J H K$ collinear
  - $B G I D C C ==> E F K'$ collinear

  Therefore, we have $A A, G I, J H$ concurrent, then $C C, G I, A A$ concurrent, hence the result.
]

#problem(
  desp: "Problem 9.58 (Shortlist 2005/G6)."
)[
  Let $A B C$ be a triangle, and $M$ the midpoint of its side $B C$. Let $gamma$ be the incircle of triangle $A B C$. The median $A M$ of triangle $A B C$ intersects the incircle $gamma$ at two points $K$ and $L$. Let the lines passing through $K$ and $L$, parallel to $B C$, intersect the incircle $gamma$ again in two points $X$ and $Y$. Let the lines $A X$ and $A Y$ intersect $B C$ again at the points $P$ and $Q$. Prove that $B P = C Q$.
]

#proof[
  Letting $E$ and $F$ denote the tangency points of the incircle. We have $E F, X Y, K L$ concurrent at $Z$.

  Notice that
  $ -1 = (A, Z; K, L) =^(P_infinity) (P_infinity, S; Y, X) =^A (P_infinity, M; Q, P) $
  hence the result.
]

= Complete Quadrilateral

#problem(
  desp: "Problem 10.17 (NIMO 2014)."
)[
  Let $A B C$ be an acute triangle with orthocenter $H$ and let $M$ be the midpoint of $B C$. Denote by $omega_B$ the circle passing through $B, H, "and" M$, and denote by $omega_C$ the circle passing through $C, H, "and" M$. Lines $A B$ and $A C$ meet $omega_B$ and $omega_C$ again at $P$ and $Q$, respectively. Rays $P H$ and $Q H$ meet $omega_C$ and $omega_B$ again at $R$ and $S$, respectively. Show that $triangle B R S$ and $triangle C R S$ have the same area.
]

#proof[
  Notice that it suffices to show $R, M, S$ collinear. Since $angle H B C = angle H S R$ by spiral similarity, obviously, $angle H B M = angle H S M$, done.
]

#problem(
  desp: "Problem 10.18 (USAMO 2013/1)."
)[
  In triangle $A B C$, points $P, Q, R$ lie on sides $B C, C A, A B$, respectively. Let $omega_A, omega_B, omega_C$ denote the circumcircles of triangles $A Q R, B R P, C P Q$, respectively. Given the fact that segment $A P$ intersects $omega_A, omega_B, omega_C$ again at $X, Y, Z$ respectively, prove that $(Y X) / (X Z) = (B P) / (P C)$.
]

#proof[
  Denote $M$ be the Miquel Point of $triangle A B C$. Notice that $triangle M Y Z tilde triangle M B C$. It suffices to show $angle Z M X = angle C Q P$. In fact,
  $ angle Z M X = angle M X Q + angle M Q X + angle M Z Q + angle M Q Z = angle Q A X + angle Q P X = angle C Q P $
]

#problem(
  desp: "Problem 10.19 (Shortlist 1995/G8)."
)[
  Suppose that $A B C D$ is a cyclic quadrilateral. Let $E = A C inter B D "and" F = A B inter C D$. Prove that $F$ lies on the line joining the orthocenters of triangles $E A D$ and $E B C$.
]

#proof[
  Denote $H_1, H_2$ be the orthocenter of $triangle E A D, triangle E B C$, respectively. Notice that both $H_1, H_2$ lie on the radical axis of two circle with diameter $A B, C D$, obviously $F$ lies on the radical axis also.
]

#problem(
  desp: "Problem 10.20 (USA TST 2007/1)."
)[
  Circles $omega_1$ and $omega_2$ meet at $P$ and $Q$. Segments $A C$ and $B D$ are chords of $omega_1$ and $omega_2$ respectively, such that segment $A B$ and ray $C D$ meet at $P$. Ray $B D$ and segment $A C$ meet at $X$. Point $Y$ lies on $omega_1$ such that $P Y parallel B D$. Point $Z$ lies on $omega_2$ such that $P Z parallel A C$. Prove that points $Q, X, Y, Z$ are collinear.
]

#proof[
  Denote $ell parallel B D$, s.t. $P in ell$. Redefine $Y := Q X inter ell$. It suffices to show $Y$ lies on $(A P Q C)$. In fact
  $Q$ is the Miquel Point of the complete quadrilateral $A X D P C B$, we also have $C X D Q, A B Q X$ concyclic. Therefore,
  
  $ angle.arc Q Y P = angle.arc Q X D = angle.arc Q C D = angle.arc Q C P $
  $ angle.arc Q Z P = angle.arc Q Z A = angle.arc Q B A = angle.arc Q B P $

  hence the result.
]

#problem(
  desp: "Problem 10.21 (USAMO 2013/6)."
)[
  Let $A B C$ be a triangle. Find all points $P$ on segment $B C$ satisfying the following property: If $X$ and $Y$ are the intersections of line $P A$ with the common external tangent lines of the circumcircles of triangles $P A B$ and $P A C$, then
  $ ((P A) / (X Y))^2 + (P B dot P C) / (A B dot A C) = 1 $
]

#proof[
  Denote $O_B, O_C$ as the circumcenter of circle $(A P B), (A P C)$. Assume $X$ is closer to $A$ than $P$. By the spiral similarity we have $triangle A O_B O_C tilde triangle A B C$, we will perform the calculation convenient by letting $A O_C = b', A O_B = c', O_B O_C = a', A M = h$, $B', C'$ be the tangency points of $X$, also define $M := O_B O_C inter A P$. Notice that $X B' ^2 = X C' ^2 = X M ^2 - h^2$
  
  Try to calculate $((P A) / (X Y)) ^2$
  
  $ ((P A) / (X Y)) ^2 &= ((A M) / (X M)) ^2 \
  &= (h^2) / (h^2 + X B' ^2) \
  &= 1 - (X B' ^2) / (h^2 + X B' ^2) \
  &= 1 - (B' C'^2) / ((2h)^2 + B' C'^2) \
  &= 1 - (a'^2 - (b' - c')^2) / ((4 / a [A O_B O_C])^2 + a'^2 - (b' - c')^2) \
  &= 1 - (a'^2(a'^2 - (b' - c')^2)) / ((a' + b' + c')(a' + b' - c')(a' - b' + c')(- a' + b' + c') + a'^2(a'^2 - (b' - c')^2)) \
  &= 1 - (a'^2) / ((a' + b' + c')(- a' + b' + c') + a'^2) \
  &= 1 - (a' / (b' + c'))^2 \
  &= 1 - (a / (b + c))^2 $

  WLOG Assume $P B = x a, P C = (1 - x) a$

  $ 1 - (a / (b + c))^2 + (x(1 - x)a^2) / (b c) &= 1 \
  (x(1 - x)a^2) / (b c) &= (a / (b + c))^2 \
  x(1 - x) &= (b c) / (b + c)^2 = (b / (b + c)) (c / (b + c)) $

  hence the result.
]

#problem(
  desp: "Problem 10.22 (USA TST 2007/5)."
)[
  Acute triangle $A B C$ is inscribed in circle $omega$. The tangent lines to $omega$ at $B$ and $C$ meet at $T$. Point $S$ lies on ray $B C$ such that $A S perp A T$. Points $B_1$ and $C_1$ lie on ray $S T$ (with $C_1$ in between $B_1$ and $S$) such that $B_1 T = B T = C_1 T$ . Prove that triangles $A B C$ and $A B_1 C_1$ are similar.
]

#proof[
  #claim_p[
    $A$ is the Miquel point of $B B_1 C_1 C$.
  ][
    Define $K := B B_1 inter C C_1$. Notice that
    $ angle B K C = angle B_1 K C_1 = pi - angle C C_1 T - angle B B_1 T \
    = pi - (pi - angle C T C_1) / 2 - (pi - angle B T B_1)/ 2 = pi - (pi + angle B T C) / 2 = pi - (pi - angle A B C) = angle A B C $
    which mean $K B C A$ are concyclic. Since $B B_1 C_1 C$ are also concyclic with circumcenter $T$, combine with $A S perp A T$, determine that $A$ is the Miquel point of $B B_1 C_1 C$.
  ]
  The result is now obvious.
]

#problem(
  desp: "Problem 10.23 (IMO 2005/2)."
)[
  Let $A B C D$ be a fixed convex quadrilateral with $B C = D A$ and $B C parallel.not D A$. Let two variable points $E$ and $F$ lie of the sides $B C$ and $D A$, respectively, and satisfy $B E = D F$. The lines $A C$ and $B D$ meet at $P$, the lines $B D$ and $E F$ meet at $Q$, the lines $E F$ and $A C$ meet at $R$. Prove that the circumcircles of the triangles $P Q R$, as $E$ and $F$ vary, have a common point other than $P$.
]

#proof[
  I claim that the desired point is $M$, which is the Miquel point of $A D B C$.

  Notice that $M$ is also the Miquel point of $A F E C$, which implies $F A R M$ are concyclic. It reduces that $M$ is also the Miquel point of $F A P Q$, solving this problem.
]

#problem(
  desp: "Problem 10.24 (USAMO 2006/6)."
)[
  Let $A B C D$ be a quadrilateral, and let $E$ and $F$ be points on sides $A D$ and $B C$, respectively, such that $(A E) / (E D) = (B F) / (F C)$. Ray $F E$ meets rays $B A$ and $C D$ at $S$ and $T$, respectively. Prove that the circumcircles of triangles $S A E, S B F, T C F$, and $T D E$ pass through a common point.
]

#proof[
  Define $M := (S A E) inter (S B F), M' = (T C F) inter (T D E), X := A D inter B C $. Notice that $M = (X A B) inter (X E F), M' = (X E F) inter (X D C)$, with condition $(A E) / (E D) = (B F) / (F C)$, implies that $M = M'$.
]

#problem(
  desp: "Problem 10.25 (Balkan Olympiad 2009/2)."
)[
  Let $M N$ be a line parallel to the side $B C$ of a triangle $A B C$, with $M$ on the side $A B$ and $N$ on the side $A C$. The lines $B N$ and $C M$ meet at point $P$. The circumcircles of triangles $B M P$ and $C N P$ intersect at a point $Q != P$. Prove that $angle B A Q = angle C A P$.
]

#proof[
  Notice that $Q$ is the Miquel point of $A M P N$. It suffice to show
  
  $ (sin angle B A Q) / (sin angle C A Q) &= (sin angle C A P) / (sin angle B A P) \
  (sin angle P N Q) / (sin angle P M Q) &= sqrt((C P) / (M P) (A M) / (A C) dot (P N) / (P B) (A B) / (A N)) \
  (P M sin angle N C P) / (P N sin angle M B P) &= (A B) / (A C) \
  (P M dot A M (sin angle A) / (M C)) / (P N dot A N (sin angle A) / (N B)) &= (A B) / (A C) \
  (A M) / (A N) &= (A B) / (A C) $
  which is obvious.
]

#problem(
  desp: "Problem 10.26 (USA TSTST 2012/7)."
)[
  Triangle $A B C$ is inscribed in circle $Omega$ . The interior angle bisector of angle $A$ intersects side $B C$ and $Omega$ at $D$ and $L$ (other than $A$), respectively. Let $M$ be the midpoint of $B C$. The circumcircle of triangle $A D M$ intersects sides $A B$ and $A C$ again at $Q$ and $P$ (other than $A$), respectively. Let $N$ be the midpoint of $P Q$, and let $H$ be the foot of the perpendicular from $L$ to line $N D$. Prove that line $M L$ is tangent to the circumcircle of triangle $H M N$.
]

#proof[
  Define $S := (A D M) inter (A B C)$. Obviously $S, M, L$ are collinear. Notice that $S D$ is the diameter of $(A D M)$, therefore, $S, D, N, H$ collinear, which also implies $H$ lies on $(A B C)$. Now, $N M parallel D L$ is trivial, (according to the spiral similarity of the Miquel point $S$), hence the result.
]

#problem(
  desp: "Problem 10.27 (USA TSTST 2012/2)."
)[
  Let $A B C D$ be a quadrilateral with $A C = B D$. Diagonals $A C$ and $B D$ meet at $P$. Let $omega_1$ and $O_1$ denote the circumcircle and the circumcenter of triangle $A B P$. Let $omega_2$ and $O_2$ denote the circumcircle and circumcenter of triangle $C D P$. Segment $B C$ meets $omega_1$ and $omega_2$ again at $S$ and $T$ (other than $B$ and $C$), respectively. Let $M$ and $N$ be the midpoints of minor arcs $S P$ (not including $B$) and $T P$ (not including $C$). Prove that $M N parallel O_1 O_2$.
]

#proof[
  Denote $Q$ be the second intersection of $omega_1, omega_2$ Notice that $triangle Q A C tilde.equiv triangle Q B D$, which implies that both $triangle Q A B, triangle Q C D$ are isosceles triangle. Therefore
  $ angle B P Q = angle D C Q = angle C D Q = angle C P Q $
  also $angle P B M = angle C B M, angle P C N = angle B C N$, which show that $B M, C N, P Q$ are concurrent at $I$, the incenter of $triangle P B C$, which implies that $B M N C$ concyclic. Well known $P Q perp M N$, the result follows.
]

#problem(
  desp: "Problem 10.28 (USA TST 2009/2)."
)[
  Let $A B C$ be an acute triangle. Point $D$ lies on side $B C$. Let $O_B, O_C$ be the circumcenters of triangles $A B D$ and $A C D$, respectively. Suppose that the points $B, C, O_B, O_C$ lie on a circle centered at $X$. Let $H$ be the orthocenter of triangle $A B C$. Prove that $angle D A X = angle D A H$.
]

#proof[
  Notice that $A$ is the Miquel point of quadrilateral $B O_B O_C C$. Define $E := B O_B inter C O_C, F := O_B O_C inter B C$. Obviously, $A X perp E F, A D perp O_B O_C, A H perp B C$. Since
  $ angle D A X = angle A F O_B \
  angle D A H = angle O_B F B $
  $angle A F O_B = angle O_B F B$ since $A O_B = B O_B$.
]

#problem(
  desp: "Problem 10.29 (Shortlist 2009/G4)."
)[
  Given a cyclic quadrilateral $A B C D$, let the diagonals $A C$ and $B D$ meet at $E$ and the lines $A D$ and $B C$ meet at $F$. The midpoints of $A B$ and $C D$ are $G$ and $H$, respectively. Show that $E F$ is tangent at $E$ to the circle through the points $E, G, "and" H$.
]

#proof[
  Define $M$ as the midpoint of $F E$, $X := F E inter A B, Y := F E inter C D, I := A B inter C D$, well known that $M, G, H$ collinear, it suffices to show $M E ^2 = M G dot M H$, since
  $ (F, E; X, Y) = (B, A; X, G) = (C, D; Y, G) = -1 $
  Therefore,
  $ M E ^2 = M G dot M H  &<=> M X dot M Y = M G dot M H \
  &<=> X, Y, H, G "concyclic" \
  &<=> I X dot I G = I Y dot I H \
  &<=> I A dot I B = I C dot I D $
  which is trivial.
]

#problem(
  desp: "Problem 10.30 (Shortlist 2006/G9)."
)[
  Points $A_1, B_1, C_1$ are chosen on the sides $B C, C A, A B$ of a triangle $A B C$ respectively. The circumcircles of triangles $A B_1 C_1, B C_1 A_1, C A_1 B_1$ intersect the circumcircle of triangle $A B C$ again at points $A_2, B_2, C_2$ respectively ($A_2 != A, B_2 != B, C_2 != C$). Points $A_3, B_3, C_3$ are symmetric to $A_1, B_1, C_1$ with respect to the midpoints of the sides $B C, C A, A B$ respectively. Prove that the triangles $A_2 B_2 C_2$ and $A_3 B_3 C_3$ are similar.
]

#proof[
  Well known $triangle A_2 C_1 B_1 tilde triangle A_2 B C$, we have $ (A_2 C_1) / (A_2 B_1) = (B C_1) / (C B_1) = (A C_3) / (A B_3) $
  Therefore, $triangle A_2 C_1 B_1 tilde triangle A C_3 B_3$, same applies on $triangle B_2 A_1 C_1 tilde triangle B A_3 C_3, triangle C_2 B_1 A_1 tilde triangle C B_3 A_3$. We have
  $ angle.arc B_3 A_3 C_3 &= pi - angle.arc C A_3 B_3 - angle.arc C_3 A_3 B \
  &= pi - angle.arc C_2 A_1 B_1 - angle.arc C_1 A_1 B_2 \
  &= pi - angle.arc C_2 C A - angle.arc A B B_2 \
  &= pi - angle.arc C_2 C B_2 \
  &= pi + angle.arc B_2 A_2 C_2 \
  &= angle.arc B_2 A_2 C_2 $
  same applies on other three angles, hence the result.
]

#problem(
  desp: "Problem 10.31 (Shortlist 2005/G5)."
)[
  Let $triangle A B C$ be an acute-angled triangle with $A B = A C$. Let $H$ be the orthocenter of triangle $A B C$, and let $M$ be the midpoint of the side $B C$. Let $D$ be a point on the side $A B$ and $E$ a point on the side $A C$ such that $A E = A D$ and the points $D, H, E$ are on the same line. Prove that the line $H M$ is perpendicular to the common chord of the circumcircles of $triangle A B C "and" triangle A D E$.
]

#proof[
  Define $F := "ray" M H inter (A B C), A_1 := "ray" H M inter (A B C)$. It suffices to show $A F D E$ are concyclic $<==> triangle F B D tilde triangle F C E$. In fact, we have.
  $ (F B) / (F C) = (sin angle F A_1 B) / (sin angle F A_1 C) = (A_1 C) / (A_1 B) \
  (B D) / (E C) = (H B) / (H C) $
  well known $H B A_1 C$ is parallelogram, since $triangle B D H tilde triangle C E H$, hence the result.
]

= Evan Chen Personal favorite

#problem(
  desp: "Problem 11.1 (Canada 2000/4)."
)[
  Let $A B C D$ be a convex quadrilateral with $angle C B D = 2 angle A D B, angle A B D = 2 angle C D B "and" A B = C B$. Prove that $A D = C D$.
]

#proof[
  Let $angle C D B = alpha, angle A D B = beta "then" angle A B D = 2 alpha, angle C B D = 2 beta$, from the law of the sine:
  $ (sin beta) / (A B) &= (sin (pi - (2 alpha + beta))) / (D B) \
  (sin alpha) / (C B) &= (sin (pi - (2 beta + alpha))) / (D B) $
  since $A B = C B$, we conclude that
  $ cos (3 alpha + beta) = cos (3 beta + alpha) $
  with $alpha + beta < pi / 2$, we see that $alpha = beta$ is the only solution that satisfy the equation. Then, easily $triangle A B D tilde.equiv triangle C B D$, hence we are done.
]

#problem(
  desp: "Problem 11.2 (EGMO 2012/1)."
)[
  Let $A B C$ be a triangle with circumcenter $O$. The points $D, E, F$ lie in the interiors of the sides $B C, C A, A B$ respectively, such that $D E$ is perpendicular to $C O$ and $D F$ is perpendicular to $B O$. Let $K$ be the circumcenter of triangle $A F E$. Prove that the lines $D K$ and $B C$ are perpendicular.
]

#proof[
  Notice that
  $ angle C D E = pi / 2 - angle O C D = pi / 2 - (pi / 2 - A) = A \
  angle B D F = pi / 2 - angle O B D = pi / 2 - (pi / 2 - A) = A $
  which shows $(A F D C), (A E D B)$ are concyclic. Therefore
  $ angle F K E = 2 A $
  also since $angle F D E = pi - angle C D E - angle B D F = pi - 2 A$, we have $(D E K F)$ concyclic. we are done since $F K = E K$.
]

#problem(
  desp: "Problem 11.3 (ELMO 2013/4)."
)[
  Triangle $A B C$ is inscribed in circle $omega$. A circle with chord $B C$ intersects segments $A B$ and $A C$ again at $S$ and $R$, respectively. Segments $B R$ and $C S$ meet at $L$, and rays $L R$ and $L S$ intersect $omega$ at $D$ and $E$, respectively. The internal angle bisector of $angle B D E$ meets line $E R$ at $K$. Prove that if $B E = B R$, then $angle E L K = 1 / 2 angle B C D$.
]

#proof[
  Well-known $A$ is the midpoint of arc $E D$, $S R parallel D E$.
  #claim_p[
    $B E = B R = B C$
  ][
    Since $B E = B R$, we have $A B$ is the perpendicular bisector of segmant $E R$, therefore,
    $ angle B C E = angle B C S = angle B R S = angle B E S $
    hence the result.
  ]
  #claim_p[
    $K$ is the incenter of $triangle D L E$
  ][
    It suffices to show $R E$ is the angle bisector of $angle L E D$. In fact
    $ angle R E D = angle E R S = angle R E S $
    as required.
  ]
  Therefore $angle E L K = 1 / 2 angle E L D = 1 / 2 angle B L C$, it suffices to show $angle B L C = angle B C D$. In fact
  $ angle B C L = angle B C E = angle B D C $
  the result is now obvious.
]

#problem(
  desp: "Problem 11.4 (Sharygin 2012)."
)[
  Let $B M$ be the median of right-angled triangle $A B C$ with $angle B = 90 degree$. The incircle of triangle $A B M$ touches sides $A B$ and $A M$ in points $A_1$ and $A_2$; points $C_1, C_2$ are defined similarly. Prove that lines $A_1 A_2$ and $C_1 C_2$ meet on the bisector of angle $A B C$.
]

#proof[
  Define $D$, s.t. $A D$ is the angle bisector of $angle A B C$, $X_A := A_1 A_2 inter A D, X_C := C_1 C_2 inter A D$. Notice that $A_1$ is the midpoint of $A B$, $C_1$ is the midpoint of $C B$.
  Applying the Menelaus' theorem:
  $ (A D) / (D A_2) (A_2 X_A) / (X_A A_1) (A_1 B) / (B A) &= 1 \
  (A_2 X_A) / (X_A A_1) &= 2 ((c b) / (c + a) - c / 2) / ((c b) / (c + a)) \
  (A_2 X_A) / (X_A A_1) &= ((2 c b) - c(a + c)) / (c b) \
  (A_2 X_A) / (X_A A_1) &= (2 b - a - c) / (b) \ $
  $ (C D) / (D C_2) (C_2 X_C) / (X_C C_1) (C_1 B) / (B C) &= 1 \
  (C_2 X_C) / (X_C C_1) &= 2 ((a b) / (c + a) - a / 2) / ((a b) / (c + a)) \
  (C_2 X_C) / (X_C C_1) &= ((2 a b) - a(a + c)) / (a b) \
  (C_2 X_C) / (X_C C_1) &= (2 b - a - c) / (b) $
  that completes the proof.
]

#problem(
  desp: "Problem 11.5 (USAMTS)."
)[
  In quadrilateral $A B C D, angle D A B = angle A B C = 110 degree, angle B C D = 35◦, angle C D A = 105 degree$, and $A C$ bisects $angle D A B$. Find $angle A B D$.
]

#proof[
  Consider $T := (A B D) inter A C$, we have $angle A T B = 70 degree = 2 angle D C B$, also since $A T$ bisects $angle D A B ==> D T = B T$ which implies that $T$ is the circumcenter of $(C B D)$. Let $angle A B D = alpha$, notice that
  $ angle C T D = 2 angle C B D = 2 (110 degree - alpha) \
  angle C T D = 180 degree - angle A T D = 180 degree - alpha $
  conclude that $angle A B D = alpha = 40 degree $
]

#problem(
  desp: "Problem 11.6 (MOP 2012)."
)[
  Let $A B C$ be an acute triangle with circumcircle $omega$ and altitudes $A D, B E, C F$. Circle $gamma$ is the image of $omega$ when reflected across $A B$. Ray $E F$ meets $omega$ at $P$, and ray $D F$ meets $gamma$ at $Q$. Prove that the points $B, P, Q$ are collinear.
]

#proof[
  Well-known that $H$ also lies on $gamma$
]

#problem(
  desp: "Problem 11.7 (Sharygin 2013)."
)[
  Chords $B C$ and $D E$ of circle $omega$ meet at point $A$. The line through $D$ parallel to $B C$ meets $omega$ again at $F$, and $F A$ meets $omega$ again at $T$. Let $M$ denote the intersection of $E T$ and $B C$, and let $N$ be the reflection of $A$ over $M$. Show that the circumcircle of $triangle D E N$ passes through the midpoint of $B C$.
]

#proof[
  Redefine $K :=$ midpoint of $B C$, let $G$ be the reflection of $A$ over $K$, obviously, $D F G A$ is a isosceles trapezoid. Notice that
  $ angle.arc M E D = angle.arc T E D = angle.arc T F D = angle.arc A F D = angle.arc A G D = angle.arc M G D $
  which implies $M, D, G, E$ concyclic, since
  $ A N dot A K = 2 A M dot A K = A M dot A G = A D dot A E $
  hence the result.
]

#proof[
  Perform an inversion around $B$ with $r = sqrt(B H dot B E) = sqrt(B F dot B A) = sqrt(B D dot B C)$, denote $Z^*$ as the inversion of $Z$. Notice that $Q = P^*, P = Q^*$, hence the result.
]

#problem(
  desp: "Problem 11.8 (ELMO 2012/1)."
)[
  In acute triangle $A B C$, let $D, E, F$ denote the feet of the altitudes from $A, B, C$, respectively, and let $omega$ be the circumcircle of $triangle A E F$. Let $omega_1$ and $omega_2$ be the circles through $D$ tangent to $omega$ at $E$ and $F$, respectively. Show that $omega_1$ and $omega_2$ meet at a point $P$ on line $B C$ other than D.
]

#proof[
  We claim that the second intersection of $omega_1$ and $omega_2$ is $E F inter B C =: X$, well-known both the tangent line of $(A E F)$ through $E$ and $F$ pass through $M$, which is the midpoint of $B C$. It suffices to show $angle.arc M F D = angle.arc F X D, angle.arc M E D = angle.arc E X D$. In fact,
  $ angle.arc M F D &= angle.arc M F B + angle.arc B F D \
  &= angle.arc A B C + angle.arc A C B \
  &= angle.arc (E F, B C) \
  angle.arc M E D &= angle.arc M E C + angle.arc C E D \
  &= angle.arc A C B + angle.arc A B C \
  &= angle.arc (E F, B C) $
  that completes the proof.
]

#problem(
  desp: "Problem 11.9 (Sharygin 2013)."
)[
  In trapezoid $A B C D$, $angle A = angle D = 90 degree$. Let $M$ and $N$ be the midpoints of diagonals $A C$ and $B D$, respectively. Line $B C$ meets $(A B N)$ and $(C D M)$ again at $Q$ and $R$. If $K$ is the midpoint of $M N$, show that $K Q = K R$.
]

#proof[
  Define $L := N M inter B C$, let $P$ as the midpoint of $Q R$. Let $A B = 2 a, C D = 2 b, B C = 2 c$. WLOG Assume $a < b$ Since
  $ L R = (L M ^2) / (L C) = (a ^2) / (c), space L Q = (L N ^ 2) / (L M) = (b ^2) / (c) $
  $ P L = 1 / 2 (L R + L Q) - L R = 1 / 2 (L Q - L R) = 1 / (2c) (b^2 - a^2) $
  $ K L = 1 / 2 (L M + L N) = 1 / 2 (a + b) $
  Notice that
  $ (K L) / (P L) = ((a + b) c) / (b^2 - a^2) = c / (b - a) = cos angle B C D = cos angle P L K $
  which implies $K P perp Q R$, the result is now obvious.
]

#problem(
  desp: "Problem 11.10 (Bulgarian Olympiad 2012)."
)[
  Let $A B C$ be a triangle with circumcircle $Omega$ and let $P$ be a variable point in its interior. The rays $P A, P B, P C$ meet $Omega$ again at $A_1, B_1, C_1$. Let $A_2$ denote the reflection of $A_1$ over BC, and define $B_2$ and $C_2$ similarly. Prove that the circumcircle of triangle $A_2 B_2 C_2$ passes through a fixed point independent of $P$.
]

#proof[
  Construct parallelograms $X C A B, Y A B C, "and" Z B C A$, obviously, $(B H A_2 C Z),$$ (A H C_2 B Y), (C H B_2 A X)$. By Ceva’s theorem in trigonometric form on triangle $A B C$ and point $P$, we know that.
  $ (sin angle B A P) / (sin angle P A C) (sin angle C B P) / (sin angle P B A) (sin angle A C P) / (sin angle P C B) = 1 $
  But $angle P A C = angle A_1 A C = angle C X A_2$, since minor arcs $A_1 C "and" A_2 C$ are identical. So the above rewrites as
  $ (sin angle B X A_2) / (sin angle C X A_2) (sin angle C Y B_2) / (sin angle A Y B_2) (sin angle A Z C_2) / (sin angle B Z C_2) = 1 $
  So rays $X A_2, Y B_2, Z C_2$ concur at some point, say $Q$. Let $H$ be the orthocenter of triangle $A B C$. We claim that $H$ is the fixed point, and that in fact, the three points lie on a circle with diameter $H Q$. Indeed, note that $A_2$ lies on the reflection of ($A B C$) over $B C$, which is a circle with diameter $H Q$, whence
  $ angle.arc H A_2 X = angle.arc H A_2 Q = 90 degree $
  as desired.
]

#problem(
  desp: "Problem 11.11 (Sharygin 2013)."
)[
  Points $A_1, B_1, C_1, A_2, B_2, C_2$ lie inside a triangle $A B C$ so that $A_1$ is on $A B_1$, $B_1$ is on $B C_1$, $C_1$ is on $C A_1$, $A_2$ is on $A C_2$, $B_2$ is on $B A_2$, $C_2$ is on $C B_2$. Suppose the angles $B A A_1, C B B_1, A C C_1, C A A_2, A B B_2, B C C_2$ are equal. Prove that $triangle A_1 B_1 C_1 "and" triangle A_2 B_2 C_2$ are congruent.
]

#proof[
  Obviously, $triangle A_2 B_2 C_2 tilde triangle A_1 B_1 C_1$, it suffices to show $A_1 B_1 = A_2 B_2$, let $theta = angle B A A_1 = angle C B B_1 = angle A C C_1 = angle C A A_2 = angle A B B_2 = angle B C C_2$. WLOG Assume $R = 1$.
  $ A_1 B_1 = A B_1 - A A_1 = c sin(B - theta) / (sin B) - b (sin theta) / (sin A) = (2 sin C sin(B - theta)) / (sin B) - (2 sin B sin theta) / (sin A) \
  A_2 B_2 = B B_2 - B A_2 = c sin(A - theta) / (sin A) - a (sin theta) / (sin B) = (2 sin C sin(A - theta)) / (sin A) - (2 sin A sin theta) / (sin B) $
  $ A_1 B_1 &= A_2 B_2 \
  <=> (2 sin C sin(B - theta)) / (sin B) - (2 sin B sin theta) / (sin A) &= (2 sin C sin(A - theta)) / (sin A) - (2 sin A sin theta) / (sin B) \
  <=> sin A sin C sin(B - theta) - sin ^2 B sin theta &= sin B sin C sin(A - theta) - sin ^2 A sin theta \
  <=> sin C (sin A sin(B - theta) - sin B sin(A - theta)) &= sin theta (sin ^2 B - sin ^2 A) \
  <=> sin C (sin B cos A - sin A cos B) &= sin ^2 B - sin ^2 A \
  <=> sin(A + B) sin(B - A) &= sin ^2 B - sin ^2 A $
  which is trivial.
]

#problem(
  desp: "Problem 11.12 (Sharygin 2013)."
)[
  Let $A B C$ be a triangle, and let $A D$ denote the bisector of $angle A$ (with $D$ on $B C$). Points $M$ and $N$ are the projections of $B$ and $C$ respectively to $A D$. The circle with diameter $M N$ intersects $B C$ at points $X$ and $Y$ . Prove that $angle B A X = angle C A Y$ .
]

#proof[
  It suffices to show
  $ (sin angle B A X) / (sin angle C A X) = (sin angle C A Y) / (sin angle B A Y) $
  which is equivalent to
  $ (B X dot B Y) / (C X dot C Y) = ((A B) / (A C)) ^2 $
  Since $B M, C N$ is tangent to the circle mentioned in the question,
  $ "LHS" = ((B M) / (C N)) ^2 = ((A B sin A / 2) / (A C sin A / 2))^2 = "RHS" $
  hence the result.
]


= Note and configuration

== Angle Chasing

#proposition(
  desp: "Triangle Sum"
)[
  The sum of the angles in a triangle is $180 degree$.
]

#theorem(
  desp: "Inscribed Angle Theorem"
)[
  If $angle A C B$ is inscribed in a circle, then it subtends an arc with measure $2 angle A C B$.
]

#theorem(
  desp: "Cyclic Quadrilaterals"
)[
  Let $A B C D$ be a convex quadrilateral. Then the following are equivalent.
  
  + $A B C D$ is cyclic.
  + $angle A B C + angle C D A = 180 degree$.
  + $angle A B D = angle A C D$.
]

#lemma(
  desp: "The Orthic Triangle"
)[
  Suppose $triangle D E F$ is the orthic triangle of acute $triangle A B C$ with orthocenter $H$. Then
  + Points $A, E, F, H$ lie on a circle with diameter $A H$.
  + Points $B, E, F, C$ lie on a circle with diameter $B C$.
  + $H$ is the incenter of $triangle D E F$.
]

#graph(
  caption: [The Orthic Triangle],
  cetz.canvas({
    import cetz.draw: *

    let A = (1, 4)
    let B = (0, 0)
    let C = (5, 0)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, A)
    let E = foot(CA, B)
    let F = foot(AB, C)
    let H = orthocenter(A, B, C)
    let M = midpoint(B, C)
    let N = midpoint(A, H)
    

    circle(M, radius: length(M, B), stroke: broken(colors.brown), fill: colors.brownt)
    circle(N, radius: length(N, A), stroke: broken(colors.brown), fill: colors.brownt)
    line(A, B, C, A, stroke: normal(colors.red))
    line(B, H, E, stroke: normal(colors.red))
    line(C, H, F, stroke: normal(colors.red))
    line(A, H, D, stroke: normal(colors.red))
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "south-west", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "east", 0.1)
    point(H, $H$, "south-east", 0.1)
  })
)

#lemma(
  desp: "Reflecting the Orthocenter"
)[
  Let $H$ be the orthocenter of $triangle A B C$. Let $X$ be the reflection of $H$ over $B C$ and $Y$ the reflection over the midpoint of $B C$. We have

  + $X$ and $Y$ both lie on ($A B C$).
  + $A Y$ is the diameter of ($A B C$).
]

#graph(
  caption: [Reflecting the Orthocenter],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 6)
    let B = (0, 0)
    let C = (6, 0)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, A)
    let E = foot(CA, B)
    let F = foot(AB, C)
    let H = orthocenter(A, B, C)
    let O = circumcenter(A, B, C)
    let M = midpoint(B, C)
    let X = reflection_point(D, H)
    let Y = reflection_point(M, H)

    circle(O, radius: length(O, A), stroke: broken(colors.blue))
    line(A, B, C, A, stroke: normal(colors.purple))
    line(B, H, E, stroke: normal(colors.magenta))
    line(C, H, F, stroke: normal(colors.magenta))
    line(A, H, D, X, stroke: normal(colors.magenta))
    line(A, O, Y, M, H, stroke: broken(colors.green))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(H, $H$, "south-east", 0.1)
    point(X, $X$, "north-east", 0.1)
    point(Y, $Y$, "north-west", 0.1)
    point(D, $$, "north-east", 0.1)
    point(M, $$, "north-west", 0.1)
    point(O, $O$, "east", 0.1)
  })
)

#lemma(
  desp: "The Incenter/Excenter Lemma"
)[
  Let $A B C$ be a triangle with incenter $I$. Ray $A I$ meets ($A B C$) again at $L$. Let $I A$ be the reflection of $I$ over $S$. Then,
  
  + The points $I, B, C, "and" I A$ lie on a circle with diameter $I I_A$ and center $S$. In particular, $S I = S B = S C = S I_A$.
  + Rays $B I_A$ and $C I_A$ bisect the exterior angles of $triangle A B C$.
]

#graph(
  caption: [The Incenter/Excenter Lemma],
  cetz.canvas({
    import cetz.draw: *

    let B = (1.5, 5)
    let A = (0, 0)
    let C = (5, 0)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let O = circumcenter(A, B, C)
    let c = get_circle_equation(O, length(O, A))
    let IA = excenter(A, B, C)
    let I = incenter(A, B, C)
    let IIA = get_line_equation(I, IA)
    let (S, _) = IP_lc(IIA, c)

    circle(O, radius: length(O, S), stroke: normal(colors.blue))
    circle(S, radius: length(S, I), stroke: broken(colors.brown), fill: colors.brownt)
    line(A, I, S, IA, stroke: normal(colors.red))
    line(B, S, C, stroke: normal(colors.red))
    line(A, B, C, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(I, B, IA, C, I, stroke: normal(colors.orange), fill: colors.oranget)
    point(A, $A$, "north-east", 0.1)
    point(B, $B$, "south-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(IA, $I_A$, "south-west", 0.1)
    point(I, $I$, "south", 0.15)
    point(S, $S$, "south", 0.15)
    
  })
)

#theorem(
  desp: "Cyclic Quadrilaterals with Directed Angles"
)[
  Points $A, B, X, Y$ lie on a circle if and only if $angle.arc A X B = angle.arc A Y B$.
]

#proposition(
  desp: "Directed Angles"
)[
  For any distinct point $A, B, C, P$ in the plane, we have the following rules:

  / Oblivion: $angle.arc A P A = 0$.
  / Anti-Reflexivity: $angle.arc A B C = − angle.arc C B A$.
  / Replacement: $angle.arc P B A = angle.arc P B C$ if and only if $A, B, C$ are collinear. Equivalently, if $C$ lies on line $B A$, then the $A$ in $angle.arc P B A$ may be replaced by $C$.
  / Right Angles: If $A P perp B P$, then $angle A P B = angle.arc B                 P A = 90 degree$.
  / Directed Angle Addition: $angle.arc A P B + angle.arc B P C = angle.arc A P C$.
  / Triangle Sum: $angle.arc A B C + angle.arc B C A + angle.arc C A B = 0$.
  / Isosceles Triangles: $A B = A C$ if and only if $angle.arc A C B = angle.arc C B A$.
  / Inscribed Angle Theorem: If ($A B C$) has center P, then $angle.arc A P B = 2 angle.arc A C B$.
  / Parallel Lines: If $A B parallel C D$, then $angle.arc A B C + angle.arc B C D = 0$.
]

#lemma(
  desp: "Miquel Point of a Triangle"
)[
  Points $D, E, F$ lie on lines $B C, C A, "and" A B$ of $triangle A B C$, respectively. Then there exists a point lying on all three circles $(A E F), (B F D), (C D E)$.
]

#graph(
  caption: [Miquel Point of a Triangle],
  cetz.canvas({
    import cetz.draw: *
    
    let A = (5, 5)
    let B = (0, 0)
    let C = (6, 0)
    let D = midpoint(C, midpoint(B, C))
    let E = midpoint(A, midpoint(A, C))
    let F = midpoint(A, B)
    let O1 = circumcenter(A, E, F)
    let O2 = circumcenter(B, F, D)
    let O3 = circumcenter(C, D, E)
    let c1 = get_circle_equation(O1, length(O1, A))
    let c2 = get_circle_equation(O2, length(O2, B))
    let (M, _) = IP_cc(c1, c2)

    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north-east", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "north", 0.15)
    point(M, $M$, "north-east", 0.1)
    circle(O1, radius: length(O1, A), stroke: broken(colors.cyan), fill: colors.cyant)
    circle(O2, radius: length(O2, B), stroke: broken(colors.cyan), fill: colors.cyant)
    circle(O3, radius: length(O3, C), stroke: broken(colors.cyan), fill: colors.cyant)
    line(A, F, B, D, C, E, A, stroke: normal(colors.green), fill: colors.greent)
  })
)

#proposition(
  desp: "Tangent Criterion"
)[
  Suppose $triangle A B C$ is inscribed in a circle with center $O$. Let $P$ be a point in the plane. Then the following are equivalent:

  + $P A$ is tangent to ($A B C$).
  + $O A perp A P$.
  + $angle.arc P A B = angle.arc A C B$.
]

#lemma[
  Let $A B C$ be an acute triangle inscribed in circle $Omega$ . Let $X$ be the midpoint of the arc $B C$ not containing $A$ and define $Y, Z$ similarly. Then the orthocenter of $X Y Z$ is the incenter $I$ of $A B C$. (See @Problem1.2.7)
]

#lemma(
  desp: "Three Tangents"
)[
  Let $A B C$ be an acute triangle. Let $B E$ and $C F$ be altitudes of triangle $A B C$, and denote by $M$ the midpoint of $B C$. Then $M E, M F,$ and the line through $A$ parallel to $B C$ are all tangents to $(A E F)$. (See @Problem1.2.9)
]

#lemma(
  desp: "Right Angles on Incircle Chord"
)[
  The incircle of $A B C$ is tangent to $B C$, $C A$, $A B$ at $D, E, F$ respectively. Let $M$ and $N$ be the midpoints of $B C$ and $A C$, respectively. Than $M N, B I, E F$ are concurrent, let $K$ be the point of concurrency. Than $B K perp C K$. (See @Problem1.2.10)
]

#theorem(
  desp: "Simson Line"
)[
  Let $A B C$ be a triangle and $P$ be any point on ($A B C$). Let $X, Y, Z$ be the feet of the perpendiculars from $P$ onto lines $B C, C A$, and $A B$. Than points $X, Y, Z$ are collinear. (See @Problem1.2.13)
]

== Circles

#proposition(
  desp: "Similar Triangles"
)[
  The following are equivalent for triangles ABC and XYZ.
  
  + $triangle A B C tilde triangle X Y Z$.
  + $(A A) space angle A = angle X "and" angle B = angle Y$ .
  + $(S A S) space angle B = angle Y , "and" A B : X Y = B C : Y Z$.
  + $(S S S) space A B : X Y = B C : Y Z = C A : Z X$.
]

#theorem(
  desp: "Power of a Point"
)[
  Consider a circle $omega$ and an arbitrary point $P$.
  
  + The quantity $P o w(P, omega)$ is positive, zero, or negative according to whether $P$ is outside, on, or inside $omega$, respectively.
  + If $ell$ is a line through $P$ intersecting $omega$ at two distinct points $X$ and $Y$ , then $ P X · P Y = |"Pow"_omega (P)| $
  + If $P$ is outside $omega$ and $P A$ is a tangent to $omega$ at a point $A$ on $omega$, then $ P A ^2 = "Pow"_omega (P) $
]

#theorem(
  desp: "Converse of the Power of a Point"
)[
  Let $A, B, X, Y$ be four distinct points in the plane and let lines $A B$ and $X Y$ intersect at $P$. Suppose that either $P$ lies in both of the segments $A B$ and $X Y$, or in neither segment. If $P A dot P B = P X dot P Y$, then $A, B, X, Y$ are concyclic.
]

#theorem(
  desp: "Radical Axis"
)[
  Let $omega_1$ and $omega_2$ be circles with distinct centers $O_1$ and $O_2$. The radical axis of $omega_1$ and $omega_2$ is a straight line perpendicular to $O_1 O_2$. In particular, if $omega_1$ and $omega_2$ intersect at two points $A$ and $B$, then the radical axis is line $A B$.

  In general, consider three circles with distinct centers $O_1, O_2, O_3$. The pairwise radical axes will concur at a single point K, the radical canter, or the three radical axes will be pairwise parallel (or even the same line), this case can only occur if $O_1, O_2, O_3$ are collinear.
]

#theorem(
  desp: "Radical Center of Intersecting Circles"
)[
  Let $omega_1$ and $omega_2$ be two circles with centers $O_1$ and $O_2$. Select points $A$ and $B$ on $omega_1$ and points $C$ and $D$ on $omega_2$. Then the following are equivalent:
  
  + $A, B, C, D$ lie on a circle with center $O_3$ not on line $O_1 O_2$.
  + Lines $A B$ and $C D$ intersect on the radical axis of $omega_1$ and $omega_2$.
]

#graph(
  caption: [Radical Center],
  cetz.canvas({
    import cetz.draw: *
    
    let O1 = (0, 0)
    let O2 = (3, -1)
    let O3 = (2, 2)
    let P = (3, 1)
    let c1 = get_circle_equation(O1, length(O1, P))
    let c2 = get_circle_equation(O2, length(O2, P))
    let c3 = get_circle_equation(O3, length(O3, P) + 1)
    let (_, Q) = IP_cc(c1, c2)
    let (A, B) = IP_cc(c1, c3)
    let (C, D) = IP_cc(c2, c3)

    point(P, $P$, "south-west", 0.1)
    point(Q, $Q$, "north", 0.15)
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-west", 0.1)
    point(C, $C$, "north-east", 0.1)
    point(D, $D$, "west", 0.15)
    line(P, Q, stroke: normal(blue))
    line(A, B, stroke: normal(blue))
    line(C, D, stroke: normal(blue))
    circle(name: "omega1", O1, radius: length(O1, P), stroke: broken(colors.cyan), fill: colors.cyant)
    circle(name: "omega2", O2, radius: length(O2, P), stroke: broken(colors.cyan), fill: colors.cyant)
    circle(name: "omega3", O3, radius: length(O3, P) + 1, stroke: broken(colors.cyan), fill: colors.cyant)
    content("omega1.west", [$omega_1$], anchor: "east", padding: 0.2)
    content("omega2.east", [$omega_2$], anchor: "west", padding: 0.2)
    content("omega3.north", [$omega_3$], anchor: "south", padding: 0.2)
  })
)

#lemma[
  Let $A B C$ be a triangle and consider a point $P$ in its interior. Suppose that $B C$ is tangent to the circumcircles of triangles $A B P$ and $A C P$. Prove that ray $A P$ bisects $B C$.
]

#lemma(
  desp: "Finding Coaxial Circles"
)[
  Three distinct circles $Omega_1, Omega_2, Omega_3$ pass through a point $X$. Then their centers are collinear if and only if they share a second common point. Both conditions are equivalent to being coaxial.
]

#lemma(
  desp: "Tangents to the Incircle"
)[
  If $D E F$ is the contact triangle of $triangle A B C$, then $A E = A F = s − a$. Similarly, $B F = B D = s − b$ and $C D = C E = s − c$.
]

#lemma(
  desp: "Tangents to the Excircle"
)[
  If $A B_1$ and $A C_1$ are the tangents to the $A$-excircle, then $A B_1 = A C_1 = s$.
]

#lemma(
  desp: "Length of Exradius"
)[
  Prove that the $A$-exradius has length
  $ r_a = s / (s − a) r $
]

#lemma[
  Let $A B C$ be a triangle. Suppose its incircle and $A$-excircle are tangent to $B C$ at $X$ and $D$, respectively. Show that $B X = C D$ and $B D = C X$.
]

#lemma(
  desp: "Euler’s Theorem"
)[
  Let $A B C$ be a triangle. Let $R$ and $r$ denote its circumradius and inradius, respectively. Let $O$ and $I$ denote its circumcenter and incenter. Then $O I ^2 = R(R − 2r)$. In particular, $R >= 2r$.
]

#lemma[
  Let $A B C$ be a triangle with $I_A, I_B,$ and $I_C$ as excenters. Than triangle $I_A I_B I_C$ has orthocenter $I$ and that triangle $A B C$ is its orthic triangle. (See @Problem2.1)
]

#lemma(
  desp: "The Pitot Theorem"
)[
  Let $A B C D$ be a quadrilateral. If a circle can be inscribed in it, Than $A B + C D = B C + D A$. (See @Problem2.2)
]

== Length and ratios

#theorem(
  desp: "The Extended Law of Sines"
)[
  In a triangle $A B C$ with circumradius $R$, we have
  $ a / (sin A) = b / (sin B) = c / (sin C) = 2R $
]

#theorem(
  desp: "Angle Bisector Theorem"
)[
  Let $A B C$ be a triangle and $D$ a point on $B C$ so that $A D$ is the internal angle bisector of $angle B A C$. Show that
  $ (A B) / (A C) = (D B) / (D C) $
]

#theorem(
  desp: "Ceva’s Theorem"
)[
  Let $A X, B Y, C Z$ be cevians of a triangle $A B C$. They concur if and only if
  $ (B X) / (X C) dot (C Y) / (Y A) dot (A Z) / (Z B) = 1 $
]

#theorem(
  desp: "Trigonometric Form of Ceva’s Theorem"
)[
  Let $A X, B Y, C Z$ be cevians of a triangle $A B C$. They concur if and only if
  $ (sin angle B A X sin angle C B Y sin angle A C Z) / (sin angle X A C sin angle Y B A sin angle Z C B) = 1 $ 
]

#theorem(
  desp: "Menelaus’s Theorem"
)[
  Let $X, Y, Z$ be points on lines $B C, C A, A B$ in a triangle $A B C$, distinct from its vertices. Then $X, Y, Z$ are collinear if and only if
  $ (B X) / (X C) dot (C Y) / (Y A) dot (A Z) / (Z B) = −1 $
  where the lengths are directed.
]

#theorem(
  desp: "Ceva’s Theorem with Directed Lengths"
)[
  Let $A B C$ be a triangle and $X, Y, Z$ be points on lines $B C, C A, A B$ distinct from its vertices. Then lines $A X, B Y, C Z$ are concurrent if and only if
  $ (A Z) / (Z B) dot (B X) / (X C) dot (C Y) / (Y A) = 1 $
  where the ratios are directed.
]

#lemma(
  desp: "Centroid Division"
)[
  The centroid of a triangle divides the median into a 2:1 ratio.
]

#lemma(
  desp: "Homothetic Triangles"
)[
  Let $A B C$ and $X Y Z$ be non-congruent triangles such that $A B parallel X Y, B C parallel Y Z, "and" C A parallel Z X$. Then lines $A X, B Y, C Z$ concur at some point $O$, and $O$ is a center of a homothety mapping $triangle A B C$ to $triangle X Y Z$.
]

#lemma(
  desp: "Nine-Point Circle"
)[
  Let $A B C$ be a triangle with circumcenter $O$ and orthocenter $H$, and denote by $N_9$ the midpoint of $O H$. Then the midpoints of $A B, B C, C A, A H, B H, C H$, as well as the feet of the altitudes of $triangle A B C$, lie on a circle centered at $N_9$. Moreover, the radius of this circle is half the radius of ($A B C$).

  We also have a homothety $h$ mapping $(A B C) |-> (N_9)$ at $H$ and with scale factor. Therefore, $O$ get mapped to midpoint of $O H$, say $N_9$.
]

#graph(
  caption: [Nine-Point Circle],
  cetz.canvas({
    import cetz.draw: *

    let A = (6, 7)
    let B = (0, 0)
    let C = (9, 0)
    let Am = midpoint(B, C)
    let Bm = midpoint(C, A)
    let Cm = midpoint(A, B)
    let AB = get_line_equation(A, B)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let D = foot(BC, A)
    let E = foot(CA, B)
    let F = foot(AB, C)
    let H = orthocenter(A, B, C)
    let Amm = midpoint(H, A)
    let Bmm = midpoint(H, B)
    let Cmm = midpoint(H, C)
    let O = circumcenter(A, B, C)
    let N9 = circumcenter(D, E, F)

    line(A, B, C, A, stroke: normal(colors.red))
    circle(O, radius: length(O, A), stroke: normal(colors.green), fill: colors.cyant)
    circle(N9, radius: length(N9, Am), stroke: normal(colors.blue), fill: colors.bluet)
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(H, $H$, "north-west", 0.1)
    point(O, $O$, "north-west", 0.1)
    point(N9, $N_9$, "north-west", 0.1)
    point(Am, $$, "north", 0.1)
    point(Bm, $$, "north", 0.1)
    point(Cm, $$, "north", 0.1)
    point(D, $$, "north", 0.1)
    point(E, $$, "north", 0.1)
    point(F, $$, "north", 0.1)
    point(Amm, $$, "north", 0.1)
    point(Bmm, $$, "north", 0.1)
    point(Cmm, $$, "north", 0.1)
  })
)

#lemma(
  desp: "Euler Line"
)[
  In triangle $A B C$, prove that $O, G, H$ (with their usual meanings) are collinear and that $G$ divides $O H$ in a $2 : 1$ ratio.
]

#graph(
  caption: [Nine-Point Circle],
  cetz.canvas({
    import cetz.draw: *

    let A = (5, 5)
    let B = (0, 0)
    let C = (6, 0)
    let H = orthocenter(A, B, C)
    let O = circumcenter(A, B, C)
    let G = centroid(A, B, C)

    line(A, B, C, A, stroke: normal(colors.red))
    line(O, G, H, stroke: normal(colors.magenta))
    circle(O, radius: length(O, A), stroke: normal(colors.green), fill: colors.cyant)
    point(A, $A$, "south-west", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(H, $H$, "north", 0.1)
    point(O, $O$, "north", 0.1)
    point(G, $G$, "north", 0.1)
  })
)

#lemma[
  In cyclic quadrilateral $A B C D$, points $X$ and $Y$ are the orthocenters of $triangle A B C$ and $triangle B C D$. Than $A X Y D$ is a parallelogram. (See @Problem3.2)
]

#theorem(
  desp: "Monge's theorem"
)[
  Consider disjoint circles $omega_1, omega_2, omega_3$ in the plane, no two congruent. For each pair of circles, we construct the intersection of their common external tangents. Than these three intersections are collinear. (See @Problem3.7)
]

#theorem(
  desp: "Cevian Nest"
)[
  Let $A X, B Y, C Z$ be concurrent cevians of $A B C$. Let $X D, Y E, Z F$ be concurrent cevians in triangle $X Y Z$. Than rays $A D, B E, C F$ concur. (See @Problem3.8)
]

== Assorted Configurations

#lemma(
  desp: "Simson Line Bisection"
)[
  Let $A B C$ be a triangle with orthocenter $H$. If $P$ is a point on ($A B C$) then its Simson line bisects $P H$.
]

#graph(
  caption: [Lemma 1.48 (Simson Line).],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 4)
    let B = (0, 0)
    let C = (6, 0)
    let O = circumcenter(A, B, C)
    let H = orthocenter(A, B, C)
    let c = get_circle_equation(O, length(O, B))
    let P = point_on_circle(c, 60deg)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let X = foot(BC, P)
    let Y = foot(CA, P)
    let Z = foot(AB, P)

    circle(O, radius: length(O, A), stroke: normal(colors.green), fill: colors.greent)
    line(A, B, C, A, stroke: normal(colors.cyan), fill: colors.cyant)
    line(X, Y, Z, stroke: normal(colors.magenta))
    line(P, X, stroke: normal(colors.blue))
    line(P, Y, stroke: normal(colors.blue))
    line(P, Z, stroke: normal(colors.blue))
    line(P, H, stroke: normal(colors.red))
    line(A, Z, stroke: normal(colors.cyan))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(H, $H$, "north", 0.15)
    point(P, $P$, "south-west", 0.1)
    point(X, $X$, "north", 0.15)
    point(Y, $Y$, "north-east", 0.1)
    point(Z, $Z$, "south-east", 0.1)
  })
)

#lemma(
  desp: "Duality of Orthocenters and Excenters"
)[
  If $I_A, I_B, I_C$ are the excenters of $triangle A B C$, then triangle $A B C$ is the orthic triangle of $triangle I_A I_B I_C$, and the orthocenter is $I$.
]

#lemma(
  desp: "The Diameter of the Incircle"
)[
  Let $A B C$ be a triangle whose incircle is tangent to $B C$ at $D$. If $D E$ is a diameter of the incircle and ray $A E$ meets $B C$ at $X$, then $B D = C X$ and $X$ is the tangency point of the $A$-excircle to $B C$.
]

#lemma(
  desp: "The Diameter of the Excircle"
)[
  Let $A B C$ be a triangle whose incircle is tangent to $B C$ at $D$, $A$-excircle is tangent to $B C$ at $X$. If $X Y$ is a diameter of the incircle, then $D$ lies on $A Y$.
]

#lemma(
  desp: "Midpoint of Altitudes"
)[
  Let $A B C$ be a triangle with incenter $I$ and $A$-excenter $I_A$, and let $D$ and $X$ be the associated tangency points on $B C$. Then lines $D I_A$ and $X I$ concur at the midpoint of the altitude from $A$.
]

#lemma(
  desp: "An Incircle Concurrency"
)[
  Let $A B C$ be a triangle with incenter $I$ and contact triangle $D E F$. If $M$ is the midpoint of $B C$, then $E F$, $A M$ and ray $D I$ concur.
]

#graph(
  caption: [Incenter and Excenter configuration],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 5)
    let B = (0, 0)
    let C = (5, 0)
    let I = incenter(A, B, C)
    let IA = excenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, I)
    let X = foot(BC, IA)
    let P = foot(AB, IA)
    let Q = foot(CA, IA)
    let K = foot(BC, A)
    let M = midpoint(K, A)
    let E = reflection_point(I, D)
    let Y = reflection_point(IA, X)

    line(A, B, C, A, stroke: normal(colors.red))
    line(A, M, K, stroke: normal(colors.brown))
    line(B, P, stroke: normal(colors.red))
    line(C, Q, stroke: normal(colors.red))
    line(A, E, X, stroke: broken(colors.green))
    line(A, D, Y, stroke: broken(colors.green))
    line(M, I, X, stroke: broken(colors.green))
    line(M, D, IA, stroke: broken(colors.green))
    circle(I, radius: length(I, D), stroke: normal(colors.blue), fill: colors.cyant)
    circle(IA, radius: length(IA, X), stroke: normal(colors.blue), fill: colors.cyant)
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "east", 0.1)
    point(C, $C$, "west", 0.1)
    point(D, $D$, "south-east", 0.1)
    point(K, $K$, "north-east", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(X, $X$, "north-west", 0.1)
    point(Y, $Y$, "north-west", 0.1)
    point(I, $I$, "south-west", 0.1)
    point(IA, $I_A$, "north-west", 0.1)
    point(M, $M$, "east", 0.1)
  })
)

#graph(
  caption: [An Incircle Concurrency],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 5)
    let B = (0, 0)
    let C = (6, 0)
    let I = incenter(A, B, C)
    let BC = get_line_equation(B, C)
    let CA = get_line_equation(C, A)
    let AB = get_line_equation(A, B)
    let D = foot(BC, I)
    let E = foot(CA, I)
    let F = foot(AB, I)
    let EF = get_line_equation(E, F)
    let M = midpoint(B, C)
    let AM = get_line_equation(A, M)
    let X = IP_ll(AM, EF)

    circle(I, radius: length(I, D), stroke: normal(colors.blue))
    line(A, B, C, A, stroke: normal(colors.green), fill: colors.greent)
    line(E, F, stroke: normal(colors.cyan))
    line(X, I, D, stroke: normal(colors.cyan))
    line(A, X, M, stroke: normal(colors.cyan))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(D, $D$, "north", 0.1)
    point(M, $M$, "north", 0.1)
    point(E, $E$, "south-west", 0.1)
    point(F, $F$, "south-east", 0.1)
    point(I, $I$, "east", 0.1)
    point(X, $X$, "south-west", 0.1)
  })
)

#lemma(
  desp: "Isogonal Conjugates"
)[
  Let $A B C$ be a triangle and $P$ any point not collinear with any of the sides. There exists a unique point $P^∗$ satisfying the relations
  $ angle.arc B A P = angle.arc P^∗ A C, quad angle.arc C B P = angle.arc P^∗ B A, quad angle.arc A C P = angle.arc P^∗ C B. $ 
]

#theorem(
  desp: "Isogonal Ratios"
)[
  Let D and E be points on BC so that AD and AE are isogonal. Then
  $ (B D) / (D C) · (B E) / (E C) = ((A B) / (A C))^2 . $
]

#lemma(
  desp: "Constructing the Symmedian"
)[
  Let $X$ be the intersection of the tangents to ($A B C$) at $B$ and $C$. Then line $A X$ is a symmedian.
]

#lemma(
  desp: "Properties of the Symmedian"
)[
  Let $A B C$ be a triangle, and let the tangents to its circumcircle at $B$ and $C$ meet at point $X$. Let $A X$ meet ($A B C$) again at $K$ and $B C$ at $D$. Then $A D$ is the $A$-symmedian and
  
  + $K A$ is a $K$-symmedian of $triangle K B C$.
  + $triangle A B K "and" triangle A M C$ are directly similar.
  + We have $ (B D) / (D C) = ((A C) / (A B))^2. $
  + We have $ (A B) / (B K) = (A C) / (C K). $
  + ($B C X$) passes through the midpoint of $A K$.
  + $B C$ is the $B$-symmedian of $triangle B A K$, and the $C$-symmedian of $triangle C A K$.
  + $B C$ is the interior angle bisector of $angle A M K$, and $M X$ is the exterior angle bisector.
]

#graph(
  caption: [Properties of the Symmedian],
  cetz.canvas({
    import cetz.draw: *

    let A = (1.5, 5)
    let B = (0, 0)
    let C = (6, 0)
    let O = circumcenter(A, B, C)
    let M = midpoint(B, C)
    let OB = get_line_equation(O, B)
    let BB = perpendicular_lp(OB, B)
    let OC = get_line_equation(O, C)
    let CC = perpendicular_lp(OC, C)
    let X = IP_ll(BB, CC)
    let AX = get_line_equation(A, X)
    let c = get_circle_equation(O, length(O, A))
    let BC = get_line_equation(B, C)
    let D = IP_ll(BC, AX)
    let (K, _) = IP_lc(AX, c)

    circle(O, radius: length(O, A), stroke: normal(colors.red))
    line(A, B, C, A, stroke: normal(colors.blue))
    line(B, K, C, stroke: normal(colors.blue))
    line(B, X, C, stroke: normal(colors.orange))
    line(A, D, K, X, stroke: normal(colors.orange))
    point(A, $A$, "south-east", 0.1)
    point(B, $B$, "north-east", 0.1)
    point(C, $C$, "north-west", 0.1)
    point(O, $O$, "north", 0.1)
    point(D, $D$, "north-east", 0.1)
    point(M, $M$, "north", 0.1)
    point(K, $K$, "north-east", 0.1)
    point(X, $X$, "north-west", 0.1)
  })
)

#lemma(
  desp: "Symmedians in Cyclic Quadrilaterals"
)[
  Let $A B C D$ be a cyclic quadrilateral. The following are equivalent.
  
  + $A B · C D = B C · D A.$
  + $A C$ is an $A$-symmedian of $triangle D A B$.
  + $A C$ is a $C$-symmedian of $triangle B C D$.
  + $B D$ is a $B$-symmedian of $triangle A B C$.
  + $B D$ is a $D$-symmedian of $triangle C D A$.
]

#lemma(
  desp: "Circles Inscribed in Segments"
)[
  Let $A B$ be a chord of a circle $Omega$. Let $omega$ be a circle tangent to chord $A B$ at $K$ and internally tangent to $omega$ at $T$. Then ray $T K$ passes through the midpoint $M$ of the arc $A B$ not containing $T$ . Moreover, $M A ^2 = M B ^2$ is the power of $M$ with respect to $omega$.
]

#lemma(
  desp: "Curvilinear Incircle Chords"
)[
  Let $A B C$ be a triangle and $D$ be a point on $A B$. Suppose a circle $omega$ is tangent to $C D$ at $L$, $A B$ at $K$, and also to ($A B C$). Then the incenter of $A B C$ lies on line $L K$.
]

#lemma(
  desp: "Mixtilinear Incircles"
)[
  Let $A B C$ be a triangle and let its $A$-mixtilinear circle be tangent to $A B, A C$, and ($A B C$) at $K, L$, and $T$, respectively. Denote by $D$ and $E$ the contact points of the incircle and $A$-excircle on $B C$, respectively.
  
  + The midpoint $I$ of $K L$ is the incenter of $triangle A B C$.
  + Lines $T K$ and $T L$ pass through the midpoints of arcs $A B$ and $A C$ not containing $T$ .
  + Line $T I$ passes through the midpoint of arc $B C$ containing $A$.
  + The angles $angle B A T "and" angle C A E$ are equal.
  + The angles $angle B T A "and" angle C T D$ are equal.
  + Quadrilaterals $B K I T "and" C L I T$ are concyclic.
]

== Computational Geometry

== Complex Numbers

== Barycentric Coordinates

I don't recommend people using the technique above to solve the problem, I will leave this for the reader who have interested in it.

== Inversion

#lemma(
  desp: "Inversion and Tangents"
)[
  Let $A$ be a point inside $omega$, other than $O$, and $A^∗$ be its inverse. Then the tangents from $A^∗$ to $omega$ are collinear with $A$.
]

#theorem(
  desp: "Inversion and Angles"
)[
  If $A^∗$ and $B^∗$ are the inverses of $A$ and $B$ under inversion centered at $O$, then $angle.arc O A B = − angle.arc O B^∗ A^∗$.
]

#proposition[
  A line passing through $O$ inverts to itself.
]

#proposition[
  The inverse of a line $ell$ not passing through $O$ is a circle $gamma$ passing through $O$. Furthermore, the line through $O$ perpendicular to $ell$ passes through the center of $gamma$.
]

#proposition[
  Let $gamma$ be a circle not passing through $O$. Then $gamma^∗$ is also a circle and does not contain $O$.
]

#theorem(
  desp: "Images of Clines"
)[
  A cline inverts to a cline. Specifically, in an inversion through a circle with center $O$,
  + A line through $O$ inverts to itself.
  + A circle through $O$ inverts to a line (not through $O$), and _vice versa_. The diameter of this circle containing $O$ is perpendicular to the line.
  + A circle not through $O$ inverts to another circle not through $O$. The centers of these circles are collinear with $O$.
]

== Projective Geometry

#theorem(
  desp: "Cross-Ratio Under Perspectivity"
)[
  Suppose that $P(A, B; X, Y)$ is a pencil of lines. If $A, B, X, Y$ are collinear then
  $ P(A, B; X, Y ) = (A, B; X, Y). $
]

#theorem(
  desp: "Cross Ratios on Cyclic Quadrilaterals"
)[
  Let $A, B, X, Y$ be concyclic. If $P$ is any point on its circumcircle, then $P(A, B; X, Y)$ does not depend on $P$. Moreover,
  $ P(A, B; X, Y) = plus.minus (X A) / (X B) div (Y A) / (Y B) $
  where the sign is positive if $A B$ and $X Y$ do not intersect, and negative otherwise.
]

#lemma(
  desp: "Midpoints and Parallel Lines"
)[
  Given points $A$ and $B$, let $M$ be the midpoint of $A B$ and $P_infinity$ the point at infinity of line $A B$. Then $(A, B; M, P_infinity)$ is a harmonic bundle.
]

#lemma(
  desp: "Harmonic Quadrilaterals"
)[
  Let $omega$ be a circle and let $P$ be a point outside it. Let $P X$ and $P Y$ be tangents to $omega$. Take a line through $P$ intersecting $omega$ again at $A$ and $B$. Then
  + $A X B Y$ is a harmonic quadrilateral.
  + If $Q = A B inter X Y$, then $(A, B; Q, P)$ is a harmonic bundle.
]

#proposition(
  desp: "Inversion Induces Harmonic Bundles"
)[
  Let $P$ be a point on line $A B$, and let $P^*$ denote the image of $P$ after inverting around the circle with diameter $A B$. Then $(A, B; P, P^*)$ is harmonic.
]

#lemma(
  desp: "Cevians Induces Harmonic Bundles"
)[
  Let $A B C$ be a triangle with concurrent cevians $A D, B E, C F$ (possibly on the extensions of the sides). Line $E F$ meets $B C$ at $X$ (possibly at a point at infinity). Then $(X, D; B, C)$ is a harmonic bundle.
]

#lemma(
  desp: "Complete Quadrilaterals Induces Harmonic Bundles"
)[
  Let $A B C D$ be a quadrilateral whose diagonals meet at $K$. Lines $A D$ and $B C$ meet at $L$, and line $K L$ meets $A B$ and $C D$ at $M$ and $N$. Then $(K, L; M, N)$ is a harmonic bundle.
]

#lemma(
  desp: "Midpoint Lengths"
)[
  Points $A, X, B, P$ lie on a line in that order, and $(A, B; X, P) = −1$. Let $M$ be the midpoint of $A B$. Show that $M X · M P = (1 / 2 A B)^2$ and $P X · P M = P A · P B$.
]

#lemma(
  desp: "Right Angles and Bisectors"
)[
  Let $X, A, Y, B$ be collinear points in that order and let $C$ be any point not on this line. Then any two of the following conditions implies the third condition.
  
  + $(A, B; X, Y)$ is a harmonic bundle.
  + $angle X C Y = 90 degree$.
  + $C Y$ bisects $angle A C B$.
]

#theorem(
  desp: "Apollonian Circles"
)[
  Let $A B$ be a segment and $k != 1$ be a positive real. The locus of points $C$ satisfying $ (C B) / (C A) = k$ is a circle whose diameter lies on AB.
]

#lemma(
  desp: "Harmonic Bundles on the Bisector"
)[
  Let $A B C$ be a triangle with incenter $I$ and $A$-excenter $I_A$. Prove that $ (I, I_A; A, A I inter B C) = −1. $
]

#theorem(
  desp: "La Hire’s Theorem"
)[
  A point $X$ lies on the polar of a point $Y$ if and only if $Y$ lies on the polar of $X$.
]

#proposition[
  Let $A B$ be a chord of a circle $omega$ and select points $P$ and $Q$ on line $A B$. Then $(A, B; P, Q) = −1$ if and only if $P$ lies on the polar of $Q$.
]

#theorem(
  desp: "Brocard’s Theorem"
)[
  Let $A B C D$ be an arbitrary cyclic quadrilateral inscribed in a circle with center $O$, and set $P = A B inter C D, Q = B C inter D A, "and" R = A C inter B D$. Then $P, Q, R$ are the poles of $Q R, R P, P Q$, respectively. In particular, $O$ is the orthocenter of triangle $P Q R$.
]

#lemma(
  desp: "Self-Polar Orthogonality"
)[
  Let $omega$ be a circle and suppose $P$ and $Q$ are points such that $P$ lies on the pole of $Q$ (and hence $Q$ lies on the pole of $P$). Prove that the circle $gamma$ with diameter $P Q$ is orthogonal to $omega$.
]

#theorem(
  desp: "Pascal’s Theorem"
)[
  Let $A B C D E F$ be a cyclic hexagon, possibly self-intersecting. Then the points $A B inter D E, B C inter E F, "and" C D inter F A$ are collinear.
]

#theorem(
  desp: "Projective Transformations"
)[
  Each of the following is achievable with a unique projective transformation.
  
  + Taking four points $A, B, C, D$ (no three collinear) to any other four points $W, X, Y, Z$ (no three collinear).
  + Taking a circle to itself and a point $P$ inside the circle to any other point $Q$ inside the circle.
  + Taking a circle to itself and any given line outside the circle into the line at infinity.
  Furthermore, projective transformations preserve the cross ratio of any four collinear points. Moreover, if four concyclic points are sent to four concyclic points, then the cross ratio of the quadrilaterals are the same.
]

#theorem(
  desp: "Butterfly Theorem"
)[
  Let $A B, C D, P Q$ be chords of a circle concurrent at $M$. Put $X = P Q inter A D "and" Y = P Q inter B C$. If $M P = M Q$ then $M X = M Y$.
]

#lemma(
  desp: "Incircle Polars"
)[
  Let $A B C$ be a triangle with contact triangle $D E F$ and incenter $I$ . Lines $E F$ and $B C$ meet at $K$. Than $I K perp A D$. (See @Problem8.1)
]

#theorem(
  desp: "Desargues’ Theorem"
)[
  Let $A B C$ and $X Y Z$ be triangles in the projective plane. We say that the two triangles are perspective from a point if lines $A X, B Y$, and $C Z$ concur (possibly at infinity), and we say they are perspective from a line if the points $A B inter X Y, B C inter Y Z, C A inter Z X$ are collinear. Prove that these two conditions are equivalent.
]

== Complete Quadrilateral

#lemma(
  desp: "Spiral Centers"
)[
  Let $A B$ and $C D$ be segments, and suppose $X = A C inter B D$. If ($A B X$) and ($C D X$) intersect again at $O$, then $O$ is the center of the unique spiral similarity taking $A B$ into $C D$.
]

#proposition[
  The center of the spiral similarity taking $A B$ to $C D$ is also the center of the spiral similarity taking $A C$ to $B D$.
]

#theorem(
  desp: "Miquel’s Theorem"
)[
  The four circles $(P A B), (P D C), (Q A D), (Q B C)$ concur at the Miquel point $M$. Furthermore, $M$ is the center of the spiral similarity sending $A B$ to $D C$ and $B C$ to $A D$. (In particular, $triangle M A B tilde triangle M D C "and" triangle M B C tilde triangle M A D$.)
]

#theorem(
  desp: "Gauss-Bodenmiller Theorem"
)[
  The circles with diameters $A C, B D, P Q$ are coaxial. Their radical axis is a line passing through each of the four orthocenters of the triangles $P A B, P C D, Q A D, Q B C$.
]

#lemma(
  desp: "Altitudes from the Miquel Point"
)[
  The feet of the perpendiculars from $M$ to lines $A B, B C, C D, D A$ are collinear. Furthermore, the line though these four points is perpendicular to the Gauss line.
]

#theorem(
  desp: "Miquel Point of a Cyclic Quadrilateral"
)[
  Let $A B C D$ be a cyclic quadrilateral inscribed in circle $omega$ with diagonals meeting at $R$. Then the Miquel point of $M$ get the following property:
  
  + It is the common point of the six circles $(O A C), (O B D), (P A D), (P B C), (Q A B), $$ (Q C D)$.
  + It is the center of a spiral similarity taking $A B$ to $C D$, as well as the spiral similarity taking $B C$ to $D A$.
  + It is the inverse of $R = A C inter B D$ with respect to an inversion around $(A B C D)$. By Brocard’s theorem, $M$ is the foot of $O$ onto $P Q$.
]