#import "utils/utils.typ": *
#import "utils/init.typ": *

#show: init.with(
  doc:(
    title: "Notes to MONT",
    author: "ShadowTheDP"
  ),
  mathenv-counter-depth: 2
)

= Preliminaries

This PDF give all solution of the book _Modern Olympiad Number Theory V2_ written by *Aditya Khurmi*.

== The description of mathenv

Take an example:

#definition( 
  desp: "something" 
)[ 
  the main body 
] 

$stretch(=)^"    type name   "|stretch(=)^" num "|stretch(=)^"source in the book"|stretch(=)^"    the main body    "$ 

At the very first of this example, is the type name of this example, followed by the serial number of the example, the string inside the brackets is usually the source in the book _MONT_, the string after the "." is the main body of this mathenv.

== Notation

Common notations used in Number Theory:

- $ZZ$: The set of integers.
- $NN$: The set of natural numbers (positive integers).
- $a | b$: $a$ divides $b$.
- $gcd(a, b)$: The greatest common divisor of $a$ and $b$.
- $lcm[a, b]$: The least common multiple of $a$ and $b$.
- $n!$: Factorial of $n$.
- $phi(n)$: Euler's totient function.
- $tau(n)$: Number of divisors of $n$.
- $sigma(n)$: Sum of divisors of $n$.

= Divisibility

#problem(
  desp: "Problem 1.12.1."
)[
  Show that any composite number $n$ has a prime factor $<= sqrt(n)$.
]

#problem(
  desp: "Problem 1.12.2 (IMO 1959/1)."
)[
  Prove that for any natural number $n$, the fraction
  $ (21n + 4) / (14n + 3) $
  is irreducible.
]

#problem(
  desp: "Problem 1.12.3."
)[
  Let $x, y, a, b, c$ be integers.
  1. Prove that $2x + 3y$ is divisible by 17 if and only if $9x + 5y$ is divisible by 17.
  2. If $4a + 5b - 3c$ is divisible by 19, prove that $6a - 2b + 5c$ is also divisible by 19.
]

#problem(
  desp: "Problem 1.12.4."
)[
  Define the $n$-th Fermat number $F_n$ by $F_n = 2^(2^n) + 1$. Show that $F_m, F_n$ are coprime for any $m, n$.
]

#problem(
  desp: "Problem 1.12.5."
)[
  Prove that for each positive integer $n$, there is a positive integer $m$ such that each term of the infinite sequence $m+1, m^m+1, m^(m^m)+1, dots$ is divisible by $n$.
]

#problem(
  desp: "Problem 1.12.6 (Romania Mathematical Olympiad)."
)[
  Let $a, b$ be positive integers such that there exists a prime $p$ with the property $lcm(a, a + p) = lcm(b, b + p)$. Prove that $a = b$.
]

#problem(
  desp: "Problem 1.12.7 (St. Petersburg 1996)."
)[
  Find all positive integers $n$ such that
  $ 3^(n-1) + 5^(n-1) | 3^n + 5^n. $
]

#problem(
  desp: "Problem 1.12.8 (Russia 2001 grade 11 Day 2/2)."
)[
  Let $a, b$ be distinct naturals such that $a b (a + b)$ is divisible by $a^2 + a b + b^2$. Show that $|a - b| > root(3, a b)$.
]

#problem(
  desp: "Problem 1.12.9 (Germany)."
)[
  Let $m$ and $n$ be two positive integers relatively prime to each other. Prove that for every positive integer $k$, the following statements are equivalent:
  1. $n + m$ is a divisor of $n^2 + k m^2$;
  2. $n + m$ is a divisor of $k + 1$.
]

#problem(
  desp: "Problem 1.12.10 (Japan 2020 Junior Finals P3)."
)[
  Find all tuples of positive integers $(a, b, c)$ such that
  $ lcm(a, b, c) = (a b + b c + c a) / 4. $
]

#problem(
  desp: "Problem 1.12.11 (Iran MO 2017 Round 2/1)."
)[
  Prove the following:
  1. There doesn’t exist a sequence $a_1, a_2, a_3, dots$ of positive integers such that for all $i < j$, we have $gcd(a_i + j, a_j + i) = 1$.
  2. Let $p$ be an odd prime number. Prove that there exists a sequence $a_1, a_2, a_3, dots$ of positive integers such that for all $i < j$, $p mid(|) gcd(a_i + j, a_j + i)$.
]

#problem(
  desp: "Problem 1.12.12 (All Russian Olympiad 2017 Day1 Grade 10 P5)."
)[
  Suppose $n$ is a composite positive integer. Let $1 < a_1 < a_2 < dots < a_k < n$ be all the divisors of $n$. It is known, that $a_1 + 1, dots, a_k + 1$ are all divisors for some $m$ (except $1, m$). Find all such $n$.
]

#problem(
  desp: "Problem 1.12.13 (IMO 2002/4)."
)[
  Let $n >= 2$ be a positive integer, with divisors $1 = d_1 < d_2 < dots < d_k = n$. Prove that $d_1 d_2 + d_2 d_3 + dots + d_(k-1) d_k$ is always less than $n^2$, and determine when it is a divisor of $n^2$.
]

#problem(
  desp: "Problem 1.12.14 (Russia 2001 Grade 10 Day 2/4)."
)[
  Find all odd positive integers $n > 1$ such that if $a$ and $b$ are relatively prime divisors of $n$, then $a + b - 1$ divides $n$.
]

#problem(
  desp: "Problem 1.12.15 (INMO 2019/3)."
)[
  Let $m, n$ be distinct positive integers. Prove that
  $ gcd(m, n) + gcd(m + 1, n + 1) + gcd(m + 2, n + 2) <= 2 |m - n| + 1. $
  Further, determine when equality holds.
]

#problem(
  desp: "Problem 1.12.16 (USAMO 2007/1)."
)[
  Let $n$ be a positive integer. Define a sequence by setting $a_1 = n$ and for each $k > 1$, letting $a_k$ to be the unique integer in the range $0 <= a_k <= k - 1$ for which $a_1 + a_2 + dots + a_k$ is divisible by $k$. Prove that for any $n$, the sequence $a_1, a_2, dots$ eventually becomes constant.
]

#problem(
  desp: "Problem 1.12.17 (USAMO 2007/5)."
)[
  Prove that for every nonnegative integer $n$, the number $7^(7^n) + 1$ is the product of at least $2n + 3$ (not necessarily distinct) primes.
]

#problem(
  desp: "Problem 1.12.18 (ELMO 2017/1)."
)[
  Let $a_1, a_2, dots, a_n$ be positive integers with product $P$, where $n$ is an odd positive integer. Prove that
  $ gcd(a_1^n + P, a_2^n + P, dots, a_n^n + P) <= 2 dot gcd(a_1, a_2, dots, a_n)^n. $
]

#problem(
  desp: "Problem 1.12.19 (IMO 2001/6)."
)[
  Let $a > b > c > d$ be positive integers and suppose that
  $ a c + b d = (b + d + a - c) (b + d - a + c). $
  Prove that $a b + c d$ is not prime.
]

#problem(
  desp: "Problem 1.12.20 (AwesomeMath 2019 Admission Test A)."
)[
  Show that $2019^2018 + 2020$ has at least 3 prime factors.
]

#problem(
  desp: "Problem 1.12.21."
)[
  Prove that 1280000401 is composite.
]

= Modular Arithmetic Basics

#problem(
  desp: "Problem 2.14.1."
)[
  How many prime numbers $p$ are there such that $29^p + 1$ is a multiple of $p$?
]

#problem(
  desp: "Problem 2.14.2 (Useful Result)."
)[
  Let $p$ be a prime and $0 <= k <= p - 1$ be an integer. Prove that
  $ binom(p - 1, k) equiv (-1)^k (mod p). $
]

#problem(
  desp: "Problem 2.14.3 (IMO 1979/1)."
)[
  Let $a$ and $b$ be natural numbers such that
  $ a/b = 1 - 1/2 + 1/3 - 1/4 + dots - 1/1318 + 1/1319. $
  Prove that $a$ is divisible by 1979. (Note: 1979 is a prime)
]

#problem(
  desp: "Problem 2.14.4 (RMO 2016 P62)."
)[
  Let ${a_1, a_2, a_3, dots}$ be a strictly increasing sequence of positive integers in an arithmetic progression. Prove that there is an infinite subsequence of the given sequence whose terms are in a geometric progression.
]

#problem(
  desp: "Problem 2.14.5."
)[
  Let $f(x)$ be a polynomial with integer coefficients. Show that there does not exist a $N$ such that $f(x)$ is a prime for all $x >= N$. In other words, $f(x)$ is not eventually always a prime.
]

#problem(
  desp: "Problem 2.14.6 (IMO 2005/4)."
)[
  Determine all positive integers relatively prime to all the terms of the infinite sequence
  $ a_n = 2^n + 3^n + 6^n - 1, n >= 1. $
]

#problem(
  desp: "Problem 2.14.7 (IMO 1986/1)."
)[
  Let $d$ be any positive integer not equal to 2, 5, or 13. Show that one can find distinct $a$ and $b$ in the set ${2, 5, 13, d}$ such that $a b - 1$ is not a perfect square.
]

#problem(
  desp: "Problem 2.14.8."
)[
  Let $a$ and $b$ be two relatively prime positive integers, and consider the arithmetic progression $a, a + b, a + 2b, a + 3b, dots$
  1. (G. Polya) Prove that there are infinitely many terms in the arithmetic progression that have the same prime divisors.
  2. Prove that there are infinitely many pairwise relatively prime terms in the arithmetic progression.
]

#problem(
  desp: "Problem 2.14.9."
)[
  Prove that
  1. every positive integer has at least as many divisors of the form $4k + 1$ as divisors of the form $4k + 3$;
  2. there exist infinitely many positive integers which have as many divisors of the form $4k + 1$ as divisors of the form $4k + 3$;
  3. there exist infinitely many positive integers which have more divisors of the form $4k + 1$ than divisors of the form $4k + 3$.
]

#problem(
  desp: "Problem 2.14.10 (IberoAmerican 2005/3)."
)[
  Let $p > 3$ be a prime. Prove that if
  $ sum_(i = 1)^(p - 1) 1 / i^p = m / n $
  with $gcd(m, n) = 1$, then $p^3 | m$.
]

#problem(
  desp: "Problem 2.14.11 (Sierpinski)."
)[
  Prove that for any positive integer $s$, there is a positive integer $n$ whose sum of digits is $s$ and $s | n$.
]

#problem(
  desp: "Problem 2.14.12 (IMO Shortlist 2001 N4)."
)[
  Let $p >= 5$ be a prime number. Prove that there exists an integer $a$ with $1 <= a <= p - 2$ such that neither $a^(p - 1) - 1$ nor $(a + 1)^(p - 1) - 1$ is divisible by $p^2$.
]

#problem(
  desp: "Problem 2.14.13 (USAMO 2018/4)."
)[
  Let $p$ be a prime, and let $a_1, dots, a_p$ be integers. Show that there exists an integer $k$ such that the numbers
  $ a_1 + k, a_2 + 2k, dots, a_p + p k $
  produce at least $1/2 p$ distinct remainders upon division by $p$.
]

#problem(
  desp: "Problem 2.14.14 (Balkan 2016/3)."
)[
  Find all monic polynomials $f$ with integer coefficients satisfying the following condition: there exists a positive integer $N$ such that $p$ divides $2(f(p)!) + 1$ for every prime $p > N$ for which $f(p)$ is a positive integer.
]

#problem(
  desp: "Problem 2.14.15 (Iran 3rd round 2017 Numbers theory final exam P1)."
)[
  Let $x$ and $y$ be integers and let $p$ be a prime number. Suppose that there exist relatively prime positive integers $m$ and $n$ such that
  $ x^m equiv y^n (mod p) $
  Prove that there exists an unique integer $z$ modulo $p$ such that
  $ x equiv z^n (mod p) quad "and" quad y equiv z^m (mod p). $
]

#problem(
  desp: "Problem 2.14.16 (IMO Shortlist 2015 N3)."
)[
  Let $m$ and $n$ be positive integers such that $m > n$. Define
  $ x_k = (m + k) / (n + k) $
  for $k = 1, 2, dots, n + 1$. Prove that if all the numbers $x_1, x_2, dots, x_(n+1)$ are integers, then $x_1 x_2 dots x_(n+1) - 1$ is divisible by an odd prime.
]

#problem(
  desp: "Problem 2.14.17 (ELMO 2019/5)."
)[
  Let $S$ be a nonempty set of positive integers such that, for any (not necessarily distinct) integers $a$ and $b$ in $S$, the number $a b + 1$ is also in $S$. Show that the set of primes that do not divide any element of $S$ is finite.
]

#problem(
  desp: "Problem 2.14.18."
)[
  Let $a, b in bb(N)$ and $p$ be a prime. Prove that
  $ binom(p a, p b) equiv binom(a, b) (mod p). $
]

#problem(
  desp: "Problem 2.14.19."
)[
  Find a formula for the number of entries in the $n$-th row of Pascal’s triangle that are not divisible by $p$, in terms of the base-$p$ expansion of $n$.
]

#problem(
  desp: "Problem 2.14.20 (ELMO 2009/6)."
)[
  Let $p$ be an odd prime and $x$ be an integer such that $p | x^3 - 1$ but $p cancel(|) x - 1$. Prove that
  $ p | (p - 1)! (x - x^2/2 + x^3/3 - dots - x^(p-1)/(p-1)). $
]

#problem(
  desp: "Problem 2.14.21 (IMO Shortlist 2011 N7)."
)[
  Let $p$ be an odd prime number. For every integer $a$, define the number
  $ S_a = a/1 + a^2/2 + dots + a^(p-1)/(p-1). $
  Let $m, n in bb(Z)$, such that
  $ S_3 + S_4 - 3S_2 = m/n. $
  Prove that $p$ divides $m$.
]

= Arithmetic Functions

#problem(
  desp: "Problem 3.7.1."
)[
  Find all $n in bb(N)$ such that $floor(sqrt(n))$ divides $n$.
]

#problem(
  desp: "Problem 3.7.2."
)[
  Let $a, b, n$ be positive integers with $gcd(a, n) = 1$. Prove that
  $ sum_k { (a k + b) / n } = (n - 1) / 2, $
  where $k$ runs through a complete system of residues modulo $n$.
]

#problem(
  desp: "Problem 3.7.3."
)[
  Let $f(x)$ be defined for all rationals $x in [0, 1]$. If
  $ F(n) = sum_{k=1}^n f(k/n), quad G(n) = sum_{k=1, (k,n)=1}^n f(k/n), $
  then prove that $G = zeta * F$, where $zeta(n)$ is the sum of the primitive $n$ th roots of unity.
]

#problem(
  desp: "Problem 3.7.4."
)[
  Show that for all positive integers $n$,
  $ floor(sqrt(n) + sqrt(n + 1)) = floor(sqrt(4 n + 1)) = floor(sqrt(4 n + 2)) = floor(sqrt(4 n + 3)). $
]

#problem(
  desp: "Problem 3.7.5."
)[
  Prove that for any $n in bb(N)$,
  $ sigma(n) / d(n) >= sqrt(n). $
]

#problem(
  desp: "Problem 3.7.6 (IMO 1968/6)."
)[
  Prove that for any positive integer $n$,
  $ floor((n + 1) / 2) + floor((n + 2) / 4) + floor((n + 4) / 8) + floor((n + 8) / 16) + dots = n. $
]

#problem(
  desp: "Problem 3.7.7 (INMO 2014)."
)[
  Let $n$ be a natural number. Prove that
  $ floor(n / 1) + floor(n / 2) + dots + floor(n / n) + floor(sqrt(n)) $
  is even.
]

#problem(
  desp: "Problem 3.7.8."
)[
  Prove that for any integer $n >= 1$,
  $ sum_{m | n} (d(m))^3 = (sum_{m | n} d(m))^2. $
]

#problem(
  desp: "Problem 3.7.9 (Belarus 1999)."
)[
  For $n >= 2$,
  $ sigma(n) < n sqrt(2 d(n)). $
]

#problem(
  desp: "Problem 3.7.10 (1998 Irish Mathematical Olympiad)."
)[
  Find all positive integers $d$ that have exactly 16 positive integral divisors $d_1, d_2, dots, d_{16}$ such that $1 = d_1 < d_2 < dots < d_{16} = d$, $d_6 = 18$ and $d_9 - d_8 = 17$.
]

#problem(
  desp: "Problem 3.7.11 (IMO 1991/2)."
)[
  Let $n > 6$ be an integer and $a_1, a_2, dots, a_k$ be all the natural numbers less than $n$ and relatively prime to $n$. If
  $ a_2 - a_1 = a_3 - a_2 = dots = a_k - a_k-1 > 0, $
  prove that $n$ must be either a prime number or a power of 2.
]

#problem(
  desp: "Problem 3.7.12 (IMO Shortlist 2016 C2)."
)[
  Find all positive integers $n$ for which all positive divisors of $n$ can be put into the cells of a rectangular table under the following constraints: each cell contains a distinct divisor; the sums of all rows are equal; and the sums of all columns are equal.
]

#problem(
  desp: "Problem 3.7.13 (St. Petersburg City Mathematical Olympiad 1998)."
)[
  Prove that the sequence $d(n^2 + 1)$ does not become monotonic from any given point onwards.
]

#problem(
  desp: "Problem 3.7.14 (IMO 1998/3)."
)[
  Determine all positive integers $k$ such that
  $ d(n^2) / d(n) = k $
  for some $n in bb(N)$.
]

#problem(
  desp: "Problem 3.7.15 (IMO Shortlist 2004 N2)."
)[
  The function $f$ from the set $bb(N)$ of positive integers into itself is defined by the equality
  $ f(n) = sum_{k=1}^n gcd(k, n), quad n in bb(N). $
  1. Prove that $f(m n) = f(m) f(n)$ for every two relatively prime $m, n in bb(N)$.
  2. Prove that for each $a in bb(N)$ the equation $f(x) = a x$ has a solution.
  3. Find all $a in bb(N)$ such that the equation $f(x) = a x$ has a unique solution.
]

#problem(
  desp: "Problem 3.7.16 (IMO Shortlist 2011 N1)."
)[
  For any integer $d > 0$, let $f(d)$ be the smallest possible integer that has exactly $d$ positive divisors. Prove that for every integer $k >= 0$ the number $f(2^k)$ divides $f(2^{k+1})$.
]

#problem(
  desp: "Problem 3.7.17 (ELMO 2017/4)."
)[
  An integer $n > 2$ is called tasty if for every ordered pair of positive integers $(a, b)$ with $a + b = n$, at least one of $a/b$ and $b/a$ is a terminating decimal. Do there exist infinitely many tasty integers?
]

#problem(
  desp: "Problem 3.7.18 (USA TSTST 2016/4)."
)[
  Suppose that $n$ and $k$ are positive integers such that
  $ 1 = underbrace(phi(phi(dots phi(n) dots)), k " times"). $
  Prove that $n <= 3^k$.
]

#problem(
  desp: "Problem 3.7.19 (IMO Shortlist 2016 N2)."
)[
  Let $d(n)$ be the number of positive divisors of $n$. Let $d_1(n)$ be the number of positive divisors of $n$ which have remainders 1 when divided by 3. Find all positive integral values of the fraction $d(10 n) / d_1(10 n)$.
]

#problem(
  desp: "Problem 3.7.20 (China Mathematical Olympiad 2017/5)."
)[
  Let $D_n$ be the set of divisors of $n$. Find all natural $n$ such that it is possible to split $D_n$ into two disjoint sets $A$ and $G$, both containing at least three elements each, such that the elements in $A$ form an arithmetic progression while the elements in $G$ form a geometric progression.
]

#problem(
  desp: "Problem 3.7.21 (China 2015 TST 3/6)."
)[
  For all natural numbers $n$, define $f(n) = d(n!) - d((n - 1)!)$. Prove that there exist infinitely many composite $n$, such that for all naturals $m < n$, we have $f(m) < f(n)$.
]

= Diophantine Equations

#problem(
  desp: "Problem 4.9.1."
)[
  Solve in positive integers the equation
  $ x^2 y + y^2 z + z^2 x = 3 x y z. $
]

#problem(
  desp: "Problem 4.9.2."
)[
  Find all triples of positive integers $(x, y, z)$ such that
  $ x^3 + y^3 + z^3 - 3 x y z = p, $
  where $p$ is a prime.
]

#problem(
  desp: "Problem 4.9.3 (USAMTS 2017-18 Round 3 P2)."
)[
  Let $q$ be a real number. Suppose there are three distinct positive integers $a, b, c$ such that $q + a, q + b, q + c$ is a geometric progression. Show that $q$ is rational.
]

#problem(
  desp: "Problem 4.9.4 (IMO 2006/4)."
)[
  Determine all pairs $(x, y)$ of integers such that
  $ 1 + 2^x + 2^{2 x + 1} = y^2. $
]

#problem(
  desp: "Problem 4.9.5 (INMO 2017/6)."
)[
  Let $n >= 1$ be an integer and consider the sum
  $ x = sum_{k >= 0} binom(n, 2 k) 2^{n - 2 k} 3^k. $
  Show that $2 x - 1, 2 x, 2 x + 1$ form the sides of a triangle whose area and inradius are also integers.
]

#problem(
  desp: "Problem 4.9.6 (Indian Mathematical Olympiad 1988)."
)[
  Find all $(x, y, n) in bb(N)^3$ such that $gcd(x, n + 1) = 1$ and $x^n + 1 = y^{n+1}$.
]

#problem(
  desp: "Problem 4.9.7 (USAMO 1987)."
)[
  Solve the following equation in nonzero integers $x, y$:
  $ (x^2 + y)(x + y^2) = (x - y)^3. $
]

#problem(
  desp: "Problem 4.9.8."
)[
  Find all positive integers $m$ and $n$ for which
  $ 1! + 2! + 3! + dots + n! = m^2. $
]

#problem(
  desp: "Problem 4.9.9 (EGMO 2013/4)."
)[
  Find all positive integers $a$ and $b$ for which there are three consecutive integers at which the polynomial
  $ P(n) = (n^5 + a) / b $
  takes integer values.
]

#problem(
  desp: "Problem 4.9.10 (Leo Moser)."
)[
  Show that the Diophantine equation
  $ 1/x_1 + 1/x_2 + dots + 1/x_n + 1/(x_1 x_2 dots x_n) = 1 $
  has at least one solution for every positive integer $n$.
]

#problem(
  desp: "Problem 4.9.11 (IMO 2013 Problem 1)."
)[
  Assume that $k$ and $n$ are two positive integers. Prove that there exist positive integers $m_1, dots, m_k$ such that
  $ 1 + (2^k - 1) / n = (1 + 1/m_1) dots (1 + 1/m_k). $
]

#problem(
  desp: "Problem 4.9.12."
)[
  Show that the equation
  $ a^2 + b^2 + c^2 + d^2 = a b c d $
  has infinitely many solutions in positive integers $a, b, c, d$.
]

#problem(
  desp: "Problem 4.9.13 (USAMO 2015/1)."
)[
  Solve in integers the equation
  $ x^2 + x y + y^2 = ((x + y) / 3 + 1)^3. $
]

#problem(
  desp: "Problem 4.9.14 (IMO Shortlist 2012 N2)."
)[
  Find all triples $(x, y, z)$ of positive integers such that $x <= y <= z$ and
  $ x^3 (y^3 + z^3) = 2012 (x y z + 2). $
]

#problem(
  desp: "Problem 4.9.15 (Vietnam 2002)."
)[
  Find all positive integers $n$ for which the equation
  $ a + b + c + d = n sqrt(a b c d) $
  has a solution in positive integers $a, b, c and d$.
]

#problem(
  desp: "Problem 4.9.16 (HMMT 2017 A8)."
)[
  Suppose $a$ and $b$ are positive integers such that
  $ c = ((a + b) (a + b + 1)) / (a b) $
  is an integer. Find all possible values of $c$.
]

#problem(
  desp: "Problem 4.9.17 (IMO 2008 N1)."
)[
  Let $n$ be a positive integer and let $p$ be a prime number. Prove that if $a, b, c$ are integers (not necessarily positive) satisfying the equations
  $ a^n + p b = b^n + p c = c^n + p a $
  then $a = b = c$.
]

#problem(
  desp: "Problem 4.9.18 (IMO Shortlist 2017 N6)."
)[
  Find the smallest positive integer $n$ or show no such $n$ exists, with the following property: there are infinitely many distinct $n$-tuples of positive rational numbers $(a_1, a_2, dots, a_n)$ such that both
  $ a_1 + a_2 + dots + a_n quad "and" quad 1/a_1 + 1/a_2 + dots + 1/a_n $
  are integers.
]

#problem(
  desp: "Problem 4.9.19 (IMO Shortlist 2019 N8)."
)[
  Let $a$ and $b$ be two positive integers. Prove that the integer
  $ a^2 + ceil((4 a^2) / b) $
  is not a square.
]

#problem(
  desp: "Problem 4.9.20 (China TST 3 2018 Day 3/2)."
)[
  Find all pairs of positive integers $(x, y)$ such that $(x y + 1) (x y + x + 2)$ be a perfect square.
]

= Modular Arithmetic Advanced

#problem(
  desp: "Problem 5.9.1."
)[
  Find all $n$ such that $3^n + 1$ is divisible by $n^2$.
]

#problem(
  desp: "Problem 5.9.2."
)[
  Show that any odd prime factor $q$ of $p^p - 1$ is $equiv 1 (mod p)$.
]

#problem(
  desp: "Problem 5.9.3 (Fermat)."
)[
  Let $p > 3$ be a prime. Prove that any positive divisor of $(2^p + 1)/3$ is of the form $2 k p + 1$.
]

#problem(
  desp: "Problem 5.9.4 (IMO Shortlist 2006 N2)."
)[
  For $x in (0, 1)$ let $y in (0, 1)$ be the number whose $n$-th digit after the decimal point is the $2^n$-th digit after the decimal point of $x$. Show that if $x$ is rational then so is $y$.
]

#problem(
  desp: "Problem 5.9.5."
)[
  Suppose that $k >= 2$ and $n_1, n_2, dots, n_k >= 1$ be natural numbers having the property
  $ n_2 | 2^{n_1} - 1, n_3 | 2^{n_2} - 1, dots, n_k | 2^{n_{k-1}} - 1, n_1 | 2^{n_k} - 1. $
  Show that $n_1 = n_2 = dots = n_k = 1$.
]

#problem(
  desp: "Problem 5.9.6 (Iran 3rd round 2017 Numbers theory final exam P1)."
)[
  Let $x$ and $y$ be integers and let $p$ be a prime number. Suppose that there exist relatively prime positive integers $m$ and $n$ such that
  $ x^m equiv y^n (mod p) $
  Prove that there exists an unique integer $z$ modulo $p$ such that
  $ x equiv z^n (mod p) quad "and" quad y equiv z^m (mod p). $
]

#problem(
  desp: "Problem 5.9.7 (China TST 2006)."
)[
  Find all positive integers $a$ and $n$ such that
  $ ((a + 1)^n - a^n) / n $
  is an integer.
]

#problem(
  desp: "Problem 5.9.8."
)[
  Let $g$ be a Fibonacci primitive root (mod $p$), i.e., $g$ is a primitive root (mod $p$) satisfying $g^2 equiv g + 1 (mod p)$. Prove that:
  1. $g - 1$ is also a primitive root (mod $p$).
  2. If $p equiv 3 (mod 4)$, then $g - 2$ is also a primitive root (mod $p$).
]

#problem(
  desp: "Problem 5.9.9 (PUTNAM 1976 B6)."
)[
  Prove that if $n$ is an integer such that $sigma(n) = 2 n + 1$, then $n$ is the square of an odd integer.
]

#problem(
  desp: "Problem 5.9.10 (China 2009)."
)[
  Find all prime numbers $p, q$ such that $p q | 5^p + 5^q$.
]

#problem(
  desp: "Problem 5.9.11."
)[
  Suppose that $p > 3$ is prime. Prove that the products of the primitive roots of $p$ between 1 and $p - 1$ is congruent to 1 modulo $p$.
]

#problem(
  desp: "Problem 5.9.12 (Bulgaria National Olympiad)."
)[
  Find all positive integers $m$ and $n$ such that
  $ (2^{2^m} + 1) (2^{2^n} + 1) $
  is divisible by $m n$.
]

#problem(
  desp: "Problem 5.9.13."
)[
  Determine all the pairs $(p, n)$ of a prime number $p$ and a positive integer $n$ for which
  $ (n^p + 1) / (p^n + 1) in bb(Z). $
]

#problem(
  desp: "Problem 5.9.14 (Iran MO 3rd round 2016 finals Number Theory P1)."
)[
  Let $p$ and $q$ be prime numbers ($q$ is odd). Prove that there exists an integer $x$ such that
  $ q | (x + 1)^p - x^p $
  if and only if $q equiv 1 (mod p)$.
]

#problem(
  desp: "Problem 5.9.15 (China TST 4 2018 Day 2 Q4)."
)[
  Let $p$ be a prime and $k$ be a positive integer. Set $S$ contains all positive integers $a$ satisfying $1 <= a <= p - 1$, and there exists positive integer $x$ such that $x^k equiv a (mod p)$. Suppose that $3 <= |S| <= p - 2$. Prove that the elements of $S$, when arranged in increasing order, does not form an arithmetic progression.
]

#problem(
  desp: "Problem 5.9.16 (IMO Shortlist 1998 N5)."
)[
  Determine all positive integers $n$ for which there exists an integer $m$ such that $2^n - 1$ is a divisor of $m^2 + 9$.
]

#problem(
  desp: "Problem 5.9.17 (USA TST for EGMO 2019, Problem 3)."
)[
  Let $n$ be a positive integer such that the number
  $ (1^k + 2^k + dots + n^k) / n $
  is an integer for any $k in {1, 2, dots, 99}$. Prove that $n$ has no divisors between 2 and 100, inclusive.
]

#problem(
  desp: "Problem 5.9.18 (IMO Shortlist 2014 N6)."
)[
  Let $a_1 < a_2 < dots < a_n$ be pairwise coprime positive integers with $a_1$ being prime and $a_1 >= n + 2$. On the segment $I = [0, a_1 a_2 dots a_n]$ of the real line, mark all integers that are divisible by at least one of the numbers $a_1, dots, a_n$. These points split $I$ into a number of smaller segments. Prove that the sum of the squares of the lengths of these segments is divisible by $a_1$.
]

#problem(
  desp: "Problem 5.9.19."
)[
  Show that if $f = g$ in $bb(F)_p [X]$, then $f = g$ in $bb(F)_p$ holds too.
]

#problem(
  desp: "Problem 5.9.20."
)[
  Prove Wilson's Theorem by comparing coefficients.
]

#problem(
  desp: "Problem 5.9.21."
)[
  Using Newton's sum identities, prove the result in Example 5.5.1.
]

= p-adic Valuation

#problem(
  desp: "Problem 6.7.1."
)[
  Show that if $n >= 6$ is composite, then $n$ divides $(n - 1)!$.
]

#problem(
  desp: "Problem 6.7.2."
)[
  Let $p$ be an odd prime. For any $t >= 1$, define $S_t = sum_{k=1}^{p-1} k^{p^t}$. Then prove that $v_p(S_t) >= t + 1$. In particular, $p^2 | 1^p + 2^p + dots + p^p$.
]

#problem(
  desp: "Problem 6.7.3."
)[
  Show that $binom(2 n, n) | lcm(1, 2, dots, 2 n)$ for all positive integers $n$.
]

#problem(
  desp: "Problem 6.7.4 (USAMO 1975/1)."
)[
  Prove that $floor(5 x) + floor(5 y) >= floor(3 x + y) + floor(3 y + x)$ where $x, y >= 0$. Using this or otherwise, prove that $((5 m)! (5 n)!) / (m! n! (3 m + n)! (3 n + m)!)$ is integral for all positive integers $m$ and $n$.
]

#problem(
  desp: "Problem 6.7.5."
)[
  Prove that for all integers $n >= 1$, $C_n = 1/(n + 1) binom(2 n, n) in bb(Z)$.
]

#problem(
  desp: "Problem 6.7.6."
)[
  Find all positive integers $n$ such that $3^n - 1$ is divisible by $2^n$.
]

#problem(
  desp: "Problem 6.7.7 (Austria National Competition Final Round)."
)[
  Let $a, b$, and $c$ be integers such that $(a b)/c + (a c)/b + (b c)/a$ is an integer. Prove that each of the numbers $(a b)/c, (a c)/b$, and $(b c)/a$ is an integer.
]

#problem(
  desp: "Problem 6.7.8."
)[
  Prove that if the odd prime $p$ divides $a^b - 1$, where $a$ and $b$ are positive integers, then $p$ appears to the same power in the prime factorization of $b(a^d - 1)$, where $d = gcd(b, p - 1)$.
]

#problem(
  desp: "Problem 6.7.9 (PUTNAM)."
)[
  Show that for each positive integer $n$, $n! = product_{i=1}^n lcm{1, 2, dots, floor(n/i)}$.
]

#problem(
  desp: "Problem 6.7.10."
)[
  1. Prove that the $n$ th Harmonic number $bb(H)_n = 1 + 1/2 + dots + 1/n$ is not an integer for $n > 1$.
  2. Prove that $1 + 1/3 + dots + 1/(2 n - 1)$ is not an integer.
]

#problem(
  desp: "Problem 6.7.11 (IMO 1990/3)."
)[
  Find all natural $n$ such that $(2^n + 1) / n^2$ is an integer.
]

#problem(
  desp: "Problem 6.7.12 (IMO 1999/4)."
)[
  Find all pairs of positive integers $(x, p)$ such that $p$ is prime, $x <= 2 p$, and $x^{p-1} | (p - 1)^x + 1$.
]

#problem(
  desp: "Problem 6.7.13 (Taiwan TST 2018 Round 2 Quiz 3/1)."
)[
  Given a square-free positive integer $n$. Show that there do not exist coprime positive integers $x, y$ such that $x^n + y^n$ is a multiple of $(x + y)^3$.
]

#problem(
  desp: "Problem 6.7.14 (China TST 1 2019/4)."
)[
  Call a sequence of positive integers ${a_n}$ good if for any distinct positive integers $m, n$, $gcd(m, n) | a_m^2 + a_n^2$ and $gcd(a_m, a_n) | m^2 + n^2$. Does there exists a $k$ such that there are exactly 2019 $k$-good positive integers?
]

#problem(
  desp: "Problem 6.7.15 (Indian TST 2018 Day 2/1)."
)[
  For a natural number $k > 1$, define $S_k$ to be the set of all triplets $(n, a, b)$ of natural numbers, with $n$ odd and $gcd(a, b) = 1$, such that $a + b = k$ and $n$ divides $a^n + b^n$. Find all values of $k$ for which $S_k$ is finite.
]

#problem(
  desp: "Problem 6.7.16 (Gabriel Dospinescu)."
)[
  Let $a, b$ be two distinct positive rational numbers such that for infinitely many integers $n$, $a^n - b^n$ is an integer. Prove that $a, b$ are also integers.
]

#problem(
  desp: "Problem 6.7.17 (Iran 3rd round 2017 Number theory first exam P1)."
)[
  Let $n$ be a positive integer. Consider prime numbers $p_1, dots, p_k$. Let $a_1, dots, a_m$ be all positive integers less than $n$ such that are not divisible by $p_i$ for all $1 <= i <= k$. Prove that if $m >= 2$ then $1/a_1 + dots + 1/a_m$ is not an integer.
]

#problem(
  desp: "Problem 6.7.18 (China TST 2 2016/4)."
)[
  Set positive integer $m = 2^k t$, where $t$ is odd. Let $f(m) = t^{1-k}$. Prove that for any positive integer $n$ and any positive odd number $a <= n$, $f(1) f(2) dots f(m)$ is a multiple of $a$.
]

#problem(
  desp: "Problem 6.7.19 (IMO Shortlist 2014 N5)."
)[
  Find all primes $p$ and positive integers $(x, y)$ such that $x^{p-1} + y$ and $y^{p-1} + x$ are powers of $p$.
]

#problem(
  desp: "Problem 6.7.20 (Tuymaada Olympiad)."
)[
  Prove that the equation $1/10^n = 1/n_1! + 1/n_2! + dots + 1/n_k!$ does not have integer solutions such that $1 <= n_1 < dots < n_k$.
]

#problem(
  desp: "Problem 6.7.21 (USAMO 2009/6)."
)[
  Let $s_1, s_2, s_3, dots$ be an infinite, nonconstant sequence of rational numbers. Suppose $t_1, t_2, t_3, dots$ is also an infinite, nonconstant sequence of rational numbers with the property that $(s_i - s_j) (t_i - t_j)$ is an integer for all $i$ and $j$. Prove that there exists a rational number $r$ such that $(s_i - s_j) r$ and $(t_i - t_j) / r$ are integers for all $i$ and $j$.
]

#problem(
  desp: "Problem 6.7.22 (India TST 2019 Day 1/2)."
)[
  Show that there do no exist natural numbers $a_1, a_2, dots, a_(2018)$ such that all $(a_1)^(2018) + a_2, (a_2)^(2018) + a_3, dots, (a_(2018))^(2018) + a_1$ are powers of 5.
]

#problem(
  desp: "Problem 6.7.23 (USA TSTST 2014/6)."
)[
  Suppose we have distinct positive integers $a, b, c, d$, and an odd prime $p$ not dividing any of them, and an integer $M$ such that if one considers the infinite sequence $c a^n - d b^n$ and looks at the highest power of $p$ that divides each of them, these powers are not all zero, and are all at most $M$. Prove that there exists some $T$ such that whenever $p$ divides an element of this sequence, the maximum power of $p$ that divides that element is exactly $p^T$.
]

#problem(
  desp: "Problem 6.7.24 (ELMO Shortlist 2017)."
)[
  Does there exist pairwise distinct positive integers $a_1, a_2, a_3, dots$ and integer $C > 1$ such that for every $k >= 1$, $a_(k+1)^k$ divides $C^k a_1 a_2 dots a_k$?
]

#problem(
  desp: "Problem 6.7.25 (USA TSTST 2019 Day 3/1)."
)[
  Let $f : bb(Z) arrow.r {1, 2, dots, 10^(100)}$ be a function satisfying $gcd(f(x), f(y)) = gcd(f(x), x - y)$ for all integers $x$ and $y$. Show that there exist positive integers $m$ and $n$ such that $f(x) = gcd(m + x, n)$ for all integers $x$.
]

#problem(
  desp: "Problem 6.7.26 (IMO Shortlist 1997, Q14)."
)[
  Let $b, m, n$ be positive integers such that $b > 1$ and $m != n$. Prove that if $b^m - 1$ and $b^n - 1$ have the same prime divisors, then $b + 1$ is a power of 2.
]

#problem(
  desp: "Problem 6.7.27."
)[
  Let $a in bb(N)$. Prove that the set ${ (p - 1) / "ord"_p(a) : gcd(p, a) = 1, p " prime" }$ is unbounded.
]

#problem(
  desp: "Problem 6.7.28 (USA TSTST 2018/8)."
)[
  For which positive integers $b > 2$ do there exist infinitely many positive integers $n$ such that $n^2$ divides $b^n + 1$?
]

= Integer Polynomials

#problem(
  desp: "Problem 7.7.1 (USAMO 1975/3)."
)[
  If $P(k) = k / (k + 1)$ for $k = 0, 1, 2, dots, n$, determine $P(n + 1)$ where $P$ denotes a polynomial of degree $n$.
]

#problem(
  desp: "Problem 7.7.2 (AoPS)."
)[
  Let $a_1, a_2, dots, a_n$ be $n$ distinct positive integers. Let $p_i = P'(a_i)$, where $P(x) = product_{i=1}^n (x - a_i)$. Prove that $sum_{i=1}^n (Q(a_i)) / p_i$ is an integer for all polynomials $Q$ with integer coefficients.
]

#problem(
  desp: "Problem 7.7.3 (AoPS)."
)[
  Find all polynomials $P$ with integer coefficients such that for any reals $a, b$, $P(a + b)$ is an integer if and only if $P(a) + P(b)$ is an integer.
]

#problem(
  desp: "Problem 7.7.4 (IMO Shortlist 2005 N3)."
)[
  Let $a, b, c, d, e and f$ be positive integers. Suppose that the sum $S = a + b + c + d + e + f$ divides both $a b c + d e f$ and $a b + b c + c a - d e - e f - f d$. Prove that $S$ is composite.
]

#problem(
  desp: "Problem 7.7.5 (IMO 2006/5)."
)[
  Let $P(x)$ be a polynomial of degree $n > 1$ with integer coefficients and let $k$ be a positive integer. Consider the polynomial $Q(x) = P(P(dots P(x) dots))$, where $P$ occurs $k$ times. Prove that there are at most $n$ integers $t$ such that $Q(t) = t$.
]

#problem(
  desp: "Problem 7.7.6."
)[
  Find all polynomials $P in bb(R)[X]$ such that $P(a) + P(b)$ is rational whenever $a + b$ is rational for any $a, b in bb(R)$.
]

#problem(
  desp: "Problem 7.7.7 (ELMO 2016/4)."
)[
  Big Bird has a polynomial $P$ with integer coefficients such that $n$ divides $P(2^n)$ for every positive integer $n$. Prove that Big Bird's polynomial must be the zero polynomial.
]

#problem(
  desp: "Problem 7.7.8 (ELMO 2019/1)."
)[
  Let $P(x)$ be a polynomial with integer coefficients such that $P(0) = 1$, and let $c > 1$ be an integer. Define $x_0 = 0$ and $x_{i+1} = P(x_i)$ for all integers $i >= 0$. Show that there are infinitely many positive integers $n$ such that $gcd(x_n, n + c) = 1$.
]

#problem(
  desp: "Problem 7.7.9 (USAMO 1995/4)."
)[
  Suppose $q_0, q_1, q_2, dots$ is an infinite sequence of integers satisfying:
  1. $m - n$ divides $q_m - q_n$, for $m > n >= 0$.
  2. there is a polynomial $P$, such that $|q_n| < P(n)$ for all $n$.
  Prove that there is a polynomial $Q$ such that $q_n = Q(n)$ for all $n$.
]

#problem(
  desp: "Problem 7.7.10 (Iran MO 3rd round 2016 finals Number Theory P2)."
)[
  We call a function $g$ special if $g(x) = a^{f(x)}$ where $a$ is a positive integer and $f$ is polynomial with integer coefficients such that $f(n) > 0$ for all positive integers $n$. A function is called an exponential polynomial if it is obtained from the product or sum of special functions. Prove that there does not exist a non-zero exponential polynomial $f(x)$ and a nonconstant polynomial $P(x)$ with integer coefficients such that $P(n) | f(n)$ for all positive integers $n$.
]

#problem(
  desp: "Problem 7.7.11 (USA TSTST 2018/1)."
)[
  Find all functions $theta : bb(Z)[x] arrow.r bb(Z)$ such that for any polynomials $p, q in bb(Z)[x]$,
  1. $theta(p + 1) = theta(p) + 1$, and
  2. If $theta(p) != 0$ then $theta(p)$ divides $theta(p q)$.
]

#problem(
  desp: "Problem 7.7.12 (IMO Shortlist 2002 N6)."
)[
  Find all pairs of positive integers $m, n >= 3$ for which there exist infinitely many positive integers $a$ such that $(a^m + a - 1) / (a^n + a^2 - 1)$ is itself an integer.
]

#problem(
  desp: "Problem 7.7.13 (Problems from The Book)."
)[
  Find all polynomials $f$ with integer coefficient such that $f(n) | n^{n-1} - 1$ for all sufficiently large $n$.
]

#problem(
  desp: "Problem 7.7.14 (USAMO 2006/3)."
)[
  For integral $m$, let $p(m)$ be the greatest prime divisor of $m$. Find all polynomials $f$ with integer coefficients such that the sequence ${ p(f(n^2)) - 2 n }_{n >= 0}$ is bounded above.
]

#problem(
  desp: "Problem 7.7.15 (USA TST 2020/5)."
)[
  Find all integers $n >= 2$ for which there exists an integer $m$ and a polynomial $P(x)$ with integer coefficients satisfying:
  1. $m > 1$ and $gcd(m, n) = 1$;
  2. the numbers $P(0), P^2(0), dots, P^(m-1)(0)$ are not divisible by $n$;
  3. $P^m(0)$ is divisible by $n$.
]

#problem(
  desp: "Problem 7.7.16 (IMO Shortlist 2011 N6)."
)[
  Let $P(x)$ and $Q(x)$ be two polynomials with integer coefficients, such that no nonconstant polynomial with rational coefficients divides both $P(x)$ and $Q(x)$. Suppose that for every positive integer $n$ the integers $P(n)$ and $Q(n)$ are positive, and $2^{Q(n)} - 1$ divides $3^{P(n)} - 1$. Prove that $Q(x)$ is a constant polynomial.
]

#problem(
  desp: "Problem 7.7.17 (2020 Korean MO winter camp Test 1 P3)."
)[
  Find all integer coefficient polynomials $Q$ such that:
  - $Q(n) >= 1$ for all $n in bb(Z)_+$;
  - $Q(m n)$ and $Q(m) Q(n)$ have the same number of prime divisors for all $m, n in bb(Z)_+$.
]

= Quadratic Residues

#problem(
  desp: "Problem 8.1.1."
)[
  Prove that the sum of quadratic residues mod $p$ is congruent to 0, if $p > 3$.
]

#problem(
  desp: "Problem 8.1.2."
)[
  Show that the product of quadratic residues mod $p$ is $-1$ if $p equiv 1 (mod 4)$, and $+1$ otherwise.
]

#problem(
  desp: "Problem 8.2.1."
)[
  Give an example of two nonresidues that don’t multiply to give a residue mod 12. Hence conclude that Lemma 8.2.1 doesn’t always hold in no-prime moduli.
]

#problem(
  desp: "Problem 8.2.2."
)[
  Prove that any quadratic residue can’t be a primitive root modulo $p$.
]

#problem(
  desp: "Problem 8.2.3."
)[
  Prove Lemma 8.2.2.
]

#problem(
  desp: "Problem 8.2.4."
)[
  Use Euler’s Criterion to prove that the Legendre’s symbol is completely multiplicative.
]

#problem(
  desp: "Problem 8.2.5."
)[
  Show that for any prime $p$,
  $ ((-1) / p) = (-1)^((p - 1) / 2). $
]

#problem(
  desp: "Problem 8.3.1."
)[
  If $a$ is a quadratic nonresidue of each of the odd primes $p$ and $q$, is $x^2 equiv a (mod p q)$ solvable?
]

#problem(
  desp: "Problem 8.4.1."
)[
  Show that
  $ sum_(n=1)^p ((n^2 + a) / p) = (p - 1) $
  if $p | a$.
]

#problem(
  desp: "Problem 8.4.2."
)[
  Use Corollary 8.4.1 and a suitable transformation to prove:
  Let $a, b, c$ be integers and let $p$ be an odd prime with $p mid(|) a$. Then
  $ sum_(n=1)^p ((a n^2 + b n + c) / p) = (p - 1) (a / p) quad "if" p | b^2 - 4 a c. $
  $ sum_(n=1)^p ((a n^2 + b n + c) / p) = -(a / p) quad "otherwise". $
]

#problem(
  desp: "Problem 8.5.2."
)[
  Prove Theorem 8.5.1.
]

#problem(
  desp: "Problem 8.5.3."
)[
  Show that the number of solutions to $x^2 - y^2 equiv a (mod p)$ for $x, y in bb(F)_p$ is $p - 1$. This represent the number of points on the hyperbola $x^2 - y^2 = a$ in $bb(F)_p$.
]

#problem(
  desp: "Problem 8.7.1."
)[
  For a given prime $p > 3$, define $cal(S) = {0^3, 1^3, 2^3, dots (p - 1)^3}$. Then prove that $cal(S)$ is a complete residue class mod $p$ if and only if $p equiv 2 (mod 3)$.
]

#problem(
  desp: "Problem 8.7.2 (Iran third round number theory exam 2015/3)."
)[
  Let $p > 5$ be a prime number and $A = {b_1, b_2, dots, b_((p - 1) / 2)}$ be the set of all quadratic residues modulo $p$, excluding zero. Prove that there doesn’t exist any natural $a, c$ satisfying $(a c, p) = 1$ such that set $B = {a b_1 + c, a b_2 + c, dots, a b_((p - 1) / 2) + c}$ and set $A$ are disjoint modulo $p$.
]

#problem(
  desp: "Problem 8.7.3 (Indian TST)."
)[
  Suppose that $p$ is an odd prime and that $A$ and $B$ are two different non-empty subsets of ${1, 2, dots, p - 1}$ for which
  1. $A union B = {1, 2, dots, p - 1}$;
  2. If $a, b$ are both in $A$ or both in $B$, then $a b (mod p) in A$;
  3. If $a in A, b in B$, then $a b (mod p) in B$.
  Find all such subsets $A$ and $B$.
]

#problem(
  desp: "Problem 8.7.4."
)[
  A prime $p$ is called a Sophie-Germain prime if $2 p + 1$ is also a prime. Show that if $p equiv 1 (mod 4)$, then 2 is a primitive root mod $2 p + 1$.
]

#problem(
  desp: "Problem 8.7.5 (Iranian Third round Number theory exam 2015/5)."
)[
  $p > 5$ is a prime number. Prove that one of the following numbers is in form of $x^2 + y^2$.
  $ p + 1, 2 p + 1, 3 p + 1, dots, (p - 3) p + 1. $
]

#problem(
  desp: "Problem 8.7.6 (IMO Shortlist 1991)."
)[
  Let $p > 3$ be a prime and let $a, b, c$ be integers with $a != 0$. Suppose that $a x^2 + b x + c$ is a perfect square for $2 p - 1$ consecutive integers $x$. Prove that $p$ divides $b^2 - 4 a c$.
]

#problem(
  desp: "Problem 8.7.7 (Vietnam TST 2005/5 Part a)."
)[
  Let $p$ be a prime number of the form $4 k + 1$. Show that
  $ sum_(i = 1)^(p - 1) (floor((2 i^2) / p) - 2 floor((i^2) / p)) = (p - 1) / 2. $
]

#problem(
  desp: "Problem 8.7.8 (RMM 2013/1)."
)[
  For a positive integer $a$, define a sequence of integers $x_1, x_2, dots$ by letting $x_1 = a$ and $x_(n+1) = 2 x_n + 1$ for $n >= 1$. Let $y_n = 2^(x_n) - 1$. Determine the largest possible $k$ such that, for some positive integer $a$, the numbers $y_1, dots, y_k$ are all prime.
]

#problem(
  desp: "Problem 8.7.9 (Romania TST 2008)."
)[
  Let $a$ and $b$ be positive integers such that $2^a - 1$ divides $3^b - 1$. Prove that either $a = 1$ or $b$ is even.
]

#problem(
  desp: "Problem 8.7.10 (Gabriel Dospinescu)."
)[
  Prove that for any positive integer $n$, the number $2^(3^n) + 1$ has at least $n$ prime divisors of the form $8 k + 3$.
]

#problem(
  desp: "Problem 8.7.11 (IMO 1996/4)."
)[
  The positive integers $a$ and $b$ are such that the numbers $15 a + 16 b$ and $16 a - 15 b$ are both squares of positive integers. What is the least possible value that can be taken on by the smaller of these two squares?
]

#problem(
  desp: "Problem 8.7.12."
)[
  Let $p$ be a prime number of the form $4 k + 1$. Prove that
  $ sum_(j = 1)^((p - 1) / 4) floor(sqrt(j p)) = (p^2 - 1) / 12. $
]

#problem(
  desp: "Problem 8.7.13 (AMM)."
)[
  Find all positive integers $n$ such that $2^n - 1 | 3^n - 1$.
]

#problem(
  desp: "Problem 8.7.14 (Taiwan 1997)."
)[
  Let $n$ be a positive integer and let $k = 2^(2^n) + 1$. Show that $k$ is a prime if and only if $k$ divides $3^((k - 1) / 2) + 1$.
]

#problem(
  desp: "Problem 8.7.15 (ELMO 2011/5)."
)[
  Let $p > 13$ be a prime of the form $2 q + 1$, where $q$ is prime. Find the number of ordered pairs of integers $(m, n)$ such that $0 <= m < n < p - 1$ and
  $ 3^m + (-12)^m equiv 3^n + (-12)^n (mod p). $
]

#problem(
  desp: "Problem 8.7.16 (Iran TST 2020/6)."
)[
  $p$ is an odd prime number and $n = (p - 1) / 2$. Find all $n$-tuples $(x_1, x_2, dots, x_n) in bb(F)_p^n$ such that
  $ sum_(i = 1)^n x_i equiv sum_(i = 1)^n x_i^2 equiv dots equiv sum_(i = 1)^n x_i^n (mod p). $
]

#problem(
  desp: "Problem 8.7.17 (USA TST 2014/2)."
)[
  Let $a_1, a_2, a_3, dots$ be a sequence of integers, with the property that every consecutive group of $a_i$’s averages to a perfect square. More precisely, for every positive integers $n$ and $k$, the quantity
  $ (a_n + a_(n+1) + dots + a_(n+k-1)) / k $
  is always the square of an integer. Prove that the sequence must be constant (all $a_i$ are equal to the same perfect square).
]

#problem(
  desp: "Problem 8.7.18 (USOMO 2020/3)."
)[
  Denote by $A$ the set of all integers $a$ such that $1 <= a < p$, and both $a$ and $4 - a$ are quadratic nonresidues. Calculate the remainder when the product of the elements of $A$ is divided by $p$.
]

= Constructions

#problem(
  desp: "Problem 9.3.1."
)[
  Let $n in {-1, -2, -3}$. If $n$ is a quadratic residue modulo a prime $p$, then there are integers $a, b$ such that $p = a^2 - n b^2$.
]

#problem(
  desp: "Problem 9.6.1."
)[
  The integers $a$ and $b$ have the property that for every nonnegative integer $n$ the number of $2^n a + b$ is the square of an integer. Show that $a = 0$.
]

#problem(
  desp: "Problem 9.6.2 (USAMO 2011/4)."
)[
  Consider the assertion that for each positive integer $n >= 2$, the remainder upon dividing $2^(2^n)$ by $2^n - 1$ is a power of 4. Either prove the assertion or find (with proof) a counterexample.
]

#problem(
  desp: "Problem 9.6.3 (USAMO 2017/1)."
)[
  Prove that there are infinitely many distinct pairs $(a, b)$ of relatively prime integers $a > 1$ and $b > 1$ such that $a^b + b^a$ is divisible by $a + b$.
]

#problem(
  desp: "Problem 9.6.4 (IMO 1989/5)."
)[
  Prove that for each positive integer $n$ there exist $n$ consecutive positive integers none of which is an integral power of a prime number.
]

#problem(
  desp: "Problem 9.6.5 (USA TSTST 2018 Problem 4)."
)[
  For an integer $n > 0$, denote by $cal(F)(n)$ the set of integers $m > 0$ for which the polynomial $p(x) = x^2 + m x + n$ has an integer root.
  1. Let $S$ denote the set of integers $n > 0$ for which $cal(F)(n)$ contains two consecutive integers. Show that $S$ is infinite but $sum_(n in S) 1 / n <= 1$.
  2. Prove that there are infinitely many positive integers $n$ such that $cal(F)(n)$ contains three consecutive integers.
]

#problem(
  desp: "Problem 9.6.6 (USAJMO 2016/2)."
)[
  Prove that there exists a positive integer $n < 10^6$ such that $5^n$ has six consecutive zeros in its decimal representation.
]

#problem(
  desp: "Problem 9.6.7 (AoPS Mock Olympiad “SORY” P2)."
)[
  Determine whether there exists an infinite set $S$ of positive integers such that for every real number $t in (0, 1/2)$, we have $|x - m y| > t y$ for every pair of different elements $x, y$ of $S$ and every positive integer $m$.
]

#problem(
  desp: "Problem 9.6.8 (RMM 2011/1)."
)[
  Prove that there exist two functions $f, g : bb(R) arrow.r bb(R)$, such that $f compose g$ is strictly decreasing and $g compose f$ is strictly increasing.
]

#problem(
  desp: "Problem 9.6.9."
)[
  Prove that the equation $a^2 + b^2 = c^2 + 3$ has infinitely many integer solutions $(a, b, c)$.
]

#problem(
  desp: "Problem 9.6.10 (APMO 2009/4)."
)[
  Prove that for any positive integer $k$, there exists an arithmetic sequence $a_1 / b_1, a_2 / b_2, dots, a_k / b_k$ of rational numbers, where $a_i, b_i$ are relatively prime positive integers for each $i = 1, 2, dots, k$ such that the positive integers $a_1, b_1, a_2, b_2, dots, a_k, b_k$ are all distinct.
]

#problem(
  desp: "Problem 9.6.11 (Bulgarian Olympiad)."
)[
  Let $f in bb(Z)[X]$ be a non-constant polynomial and let $n, k$ be positive integers. Prove that there exists a positive integer $a$ such that each of the numbers $f(a), f(a + 1), dots, f(a + n - 1)$ has at least $k$ distinct prime divisors.
]

#problem(
  desp: "Problem 9.6.12 (China TST 2006 Day 6/2)."
)[
  Prove that for any given positive integer $n$ and $m$, there is always a positive integer $k$ so that $2^k - n$ has at least $m$ different prime divisors.
]

#problem(
  desp: "Problem 9.6.13."
)[
  Prove that if a number is a quadratic residue modulo all but finitely many primes, then it is a square.
]

#problem(
  desp: "Problem 9.6.14 (USAMO 2008/1)."
)[
  Prove that for each positive integer $n$, there are pairwise relatively prime integers $k_0, k_1, dots, k_n$, all strictly greater than 1, such that $k_0 k_1 dots k_n - 1$ is the product of two consecutive integers.
]

#problem(
  desp: "Problem 9.6.15 (IMO Shortlist 2005 N6)."
)[
  Let $a, b$ be positive integers such that $b^n + n$ is a multiple of $a^n + n$ for all positive integers $n$. Prove that $a = b$.
]

#problem(
  desp: "Problem 9.6.16 (EGMO 2018/6)."
)[
  1. Prove that for every real number $t$ such that $0 < t < 1/2$ there exists a positive integer $n$ with the following property: for every set $S$ of $n$ positive integers there exist two different elements $x$ and $y$ of $S$, and a non-negative integer $m$ such that $|x - m y| <= t y$.
  2. Determine whether for every real number $t$ such that $0 < t < 1/2$ there exists an infinite set $S$ of positive integers such that $|x - m y| > t y$ for every pair of different elements $x$ and $y$ of $S$ and every positive integer $m$.
]

#problem(
  desp: "Problem 9.6.17 (USA TST 2 2017/3)."
)[
  Prove that there are infinitely many triples $(a, b, p)$ of positive integers with $p$ prime, $a < p$, and $b < p$, such that $(a + b)^p - a^p - b^p$ is a multiple of $p^3$.
]

#problem(
  desp: "Problem 9.6.18 (IMO Shortlist 2013 N3)."
)[
  Prove that there exist infinitely many positive integers $n$ such that the largest prime divisor of $n^4 + n^2 + 1$ is equal to the largest prime divisor of $(n + 1)^4 + (n + 1)^2 + 1$.
]

#problem(
  desp: "Problem 9.6.19 (China TST 1 2019/2)."
)[
  Fix a positive integer $n >= 3$. Do there exist infinitely many sets $S$ of positive integers ${a_1, a_2, dots, a_n, b_1, b_2, dots, b_n}$, such that $gcd(a_1, a_2, dots, a_n, b_1, b_2, dots, b_n) = 1$, ${a_i}_(i=1)^n$, ${b_i}_(i=1)^n$ are arithmetic progressions, and $product_(i=1)^n a_i = product_(i=1)^n b_i$?
]

#problem(
  desp: "Problem 9.6.20 (Tuymaada 2004, also INMO 2019/4)."
)[
  Let $n$ and $M$ be positive integers such that $M > n^(n - 1)$. Prove that there are $n$ distinct primes $p_1, p_2, p_3 dots, p_n$ such that $p_j$ divides $M + j$ for all $1 <= j <= n$.
]

#problem(
  desp: "Problem 9.6.21 (USA TSTST 2015/5)."
)[
  Let $phi(n)$ denote the number of positive integers less than $n$ that are relatively prime to $n$. Prove that there exists a positive integer $m$ for which the equation $phi(n) = m$ has at least 2015 solutions in $n$.
]

#problem(
  desp: "Problem 9.6.22 (APMO 2020/4)."
)[
  Find all polynomials $P(x)$ with integer coefficients that satisfy the following property:
  For any infinite sequence $a_1, a_2, dots$ of integers in which each integer in $bb(Z)$ appears exactly once, there exist indices $i < j$ and an integer $k$ such that $a_i + a_(i+1) + dots + a_j = P(k)$.
]

#problem(
  desp: "Problem 9.6.23 (USA TSTST 2016/3)."
)[
  Decide whether or not there exists a nonconstant polynomial $Q(x)$ with integer coefficients with the following property: for every positive integer $n > 2$, the numbers $Q(0), Q(1), Q(2), dots, Q(n - 1)$ produce at most $0.499n$ distinct residues when taken modulo $n$.
]

#problem(
  desp: "Problem 9.6.24."
)[
  Show that if $q in bb(Q)$, then $a + b q = 0$ has a non-trivial solution in integers $a, b$.
]

= Collected Results

== Chapter 1: Divisibility

#definition(desp: "Definition 1.1.1.")[A number $n$ is said to be a multiple of $m$ if it appears in the multiplication table of $m$.]

#definition(desp: "Definition 1.1.2.")[A number $n$ is divisible by $m$ if $n$ is a multiple of $m$. Also, we say $m$ divides $n$ and write this symbolically as $m | n$.]

#theorem(desp: "Theorem 1.2.1.")[Let $x, y, z$ be integers.
1. If $x | y$ and $y | z$, then $x | z$.
2. If $x | y$ and $x | z$, then $x | y plus.minus z$.
3. If $x | y$, then $x | y z$ for any integer $z$.]

#theorem(desp: "Theorem 1.2.2.")[If $x | y$ for two integers, then either $y = 0$ or $|x| <= |y|$.]

#lemma(desp: "Lemma 1.2.1.")[For any two numbers $x, y$ in a set $cal(M)$ of multiples of $m$, we have $a x + b y in cal(M)$ for any integers $a, b$.]

#theorem(desp: "Theorem 1.2.3.")[Suppose $c | x, y$. Then $c | a x + b y$ for any $a, b in bb(Z)$.]

#theorem(desp: "Theorem 1.2.4 (List of properties).")[
  1. $n | n$.
  2. $n | 0$.
  3. $1 | n$.
  4. If $n | 1$, then $n = plus.minus 1$.
  5. If $a | b$ and $b | a$, then $a = plus.minus b$.
]

#lemma(desp: "Lemma 1.3.1.")[For any integers $b, a$, we can find a number $0 <= r < a$ such that $b$ is $r$ more than a multiple of $a$.]

#theorem(desp: "Theorem 1.3.1 (Euclid's Division Lemma).")[For any integers $b, a$, we can find unique integers $q, r$ such that $b = a q + r$, where $0 <= r < a$.]

#theorem(desp: "Theorem 1.4.1 (Fundamental Theorem of Arithmetic).")[Any natural number greater than 1 has a unique prime factorization up to order.]

#theorem(desp: "Theorem 1.5.1 (Divisibility in Sets).")[Let $a, b$ be two positive integers. Then $a | b$ if and only if $cal(S)_a supset cal(S)_b$, where $cal(S)_n$ is the set of prime factors of $n$.]

#definition(desp: "Definition 1.6.1 (GCD).")[The GCD, or the Greatest Common Divisor of two numbers is the number obtained by the set of common prime factors. For two numbers $m, n$, it is denoted by $gcd(m, n)$, or often just $(m, n)$.]

#lemma(desp: "Lemma 1.6.1.")[Let $a, b$ be integers. The GCD of $a, b$ is the largest number which divides both $a, b$. In particular, $gcd(a, b) <= a, b$.]

#lemma(desp: "Lemma 1.6.2.")[Let $a, b, c$ be three integers. Then $c | a$ and $c | b$ if and only if $c | gcd(a, b)$.]

#lemma(desp: "Lemma 1.6.3 (Prime Factorization of GCD).")[If $a = p_1^{a_1} dots p_k^{a_k}$ and $b = p_1^{b_1} dots p_k^{b_k}$, then $gcd(a, b) = p_1^{min(a_1, b_1)} dots p_k^{min(a_k, b_k)}$.]

#definition(desp: "Definition 1.6.2 (LCM).")[The LCM, or Least Common Multiple of two integers $a, b$, is the smallest positive integer that is a multiple of both $a$ and $b$. It is denoted by $lcm(a, b)$ or $[a, b]$.]

#lemma(desp: "Lemma 1.6.4.")[Let $a, b, c$ be integers. Then $a | c$ and $b | c$ if and only if $lcm(a, b) | c$.]

#lemma(desp: "Lemma 1.6.5 (Product of GCD and LCM).")[Let $a, b$ be two integers. Then $gcd(a, b) dot lcm(a, b) = a dot b$.]

#definition(desp: "Definition 1.6.3.")[Two numbers $a, b$ are called coprime or relatively prime if $gcd(a, b) = 1$.]

#theorem(desp: "Theorem 1.6.1 (Euclid).")[There are infinitely many primes.]

#lemma(desp: "Lemma 1.7.1.")[Let $a, b$ be integers. We can write $a = b q + r$ for integers $q, r$ where $0 <= r < b$. Then $gcd(a, b) = gcd(b, r)$.]

#theorem(desp: "Theorem 1.8.1 (Bézout's Theorem).")[Let $a, b$ be integers. Then the equation $a x + b y = gcd(a, b)$ always has integer solutions $(x, y)$.]

#theorem(desp: "Theorem 1.9.1.")[Any number $n$ has a unique representation in base $ell$.]

== Chapter 2: Modular Arithmetic Basics

#definition(desp: "Definition 2.3.1.")[Pick a natural number $n$, and a non-negative number $r < n$. Then the $r$-th residue class is the set of integers $a$ that satisfy $a equiv r (mod n)$.]

#theorem(desp: "Theorem 2.4.1 (Properties of Modulus).")[Let $a, b, r, s$ be integers such that $a equiv r (mod n)$ and $b equiv s (mod n)$. Then:
1. $a + b equiv r + s (mod n)$.
2. $a b equiv r s (mod n)$.]

#theorem(desp: "Theorem 2.5.1 (Two Equal Sets).")[Let $p$ be a prime and $cal(S) = {1, 2, dots, p - 1}$. Let $a$ be any integer coprime to $p$. Then $a cal(S) equiv cal(S) (mod p)$.]

#theorem(desp: "Theorem 2.6.1 (Fermat's Little Theorem).")[Let $a$ be any number relatively prime to a prime $p$. Then $a^{p - 1} equiv 1 (mod p)$.]

#theorem(desp: "Theorem 2.6.2 (Fermat's Little Theorem).")[Let $a$ be any number. Then $a^p equiv a (mod p)$.]

#theorem(desp: "Theorem 2.7.1 (Inverses).")[Let $p$ be a prime and $a$ be an integer coprime to $p$. Then there always exists an integer $x$ such that $a x equiv 1 (mod p)$.]

#lemma(desp: "Lemma 2.7.1 (Inverses add like Fractions).")[Let $b, d cancel(equiv) 0 (mod p)$. Then $a/b + c/d equiv (a d + b c)/(b d) (mod p)$.]

#lemma(desp: "Lemma 2.7.2 (Inverses multiply like Fractions).")[Let $b, d cancel(equiv) 0 (mod p)$. Then $a/b dot c/d equiv (a c)/(b d) (mod p)$.]

#theorem(desp: "Theorem 2.8.1 (Wilson's Theorem).")[Let $p$ be a prime. Then $(p - 1)! equiv -1 (mod p)$.]

#theorem(desp: "Theorem 2.8.2 (Wilson's Theorem).")[For any integer $n$, $(n - 1)! equiv -1 (mod n)$ if and only if $n$ is a prime.]

#theorem(desp: "Theorem 2.9.1 (General Equal Sets).")[Let $n$ be any integer. Let $cal(S)$ be the set of integers less than $n$ and relatively prime to $n$. Let $a$ be any integer coprime to $n$. Then $a cal(S) equiv cal(S) (mod n)$.]

#definition(desp: "Definition 2.10.1 (Euler's Totient Function).")[The function $phi(n)$ denotes the number of positive integers less than $n$ that are coprime to it.]

#theorem(desp: "Theorem 2.10.1 (Euler's Totient Formula).")[If $n = p_1^{a_1} dots p_k^{a_k}$, then $phi(n) = n product_(i=1)^k (1 - 1/p_i)$.]

#lemma(desp: "Lemma 2.10.1.")[$phi(n)$ is multiplicative, i.e., $phi(m n) = phi(m) phi(n)$ if $gcd(m, n) = 1$.]

#theorem(desp: "Theorem 2.10.2 (Euler's Theorem).")[Let $n >= 2$ be an integer and $a$ be any integer coprime to $n$. Then $a^{phi(n)} equiv 1 (mod n)$.]

#theorem(desp: "Theorem 2.11.1 (General Inverses).")[Let $n >= 2$. Every number $a$ with $gcd(a, n) = 1$ has an inverse modulo $n$.]

#lemma(desp: "Lemma 2.11.1.")[A number $a$ has an inverse modulo $n$ if and only if $gcd(a, n) = 1$.]

#theorem(desp: "Theorem 2.14.1 (Lucas's Theorem).")[For non-negative integers $m, n$ and a prime $p$, $binom(m, n) equiv product_(i=0)^k binom(m_i, n_i) (mod p)$, where $m_i, n_i$ are the digits of $m, n$ in base $p$.]

== Chapter 3: Arithmetic Functions

#definition(desp: "Definition 3.0.1.")[An arithmetic function is a function $f: bb(N) arrow.r bb(C)$.]

#definition(desp: "Definition 3.0.2.")[An arithmetic function is multiplicative if $f(m n) = f(m) f(n)$ for all $gcd(m, n) = 1$.]

#definition(desp: "Definition 3.1.1.")[$d(n)$ denotes the number of divisors of $n$.]

#theorem(desp: "Theorem 3.1.1 (Formula for $d(n)$).")[If $n = p_1^{a_1} dots p_k^{a_k}$, then $d(n) = (1 + a_1) dots (1 + a_k)$.]

#lemma(desp: "Lemma 3.1.1.")[$d(n)$ is odd if and only if $n$ is a perfect square.]

#lemma(desp: "Lemma 3.1.2.")[$d(n) <= 2 sqrt(n)$.]

#theorem(desp: "Theorem 3.2.1 (Formula for $sigma(n)$).")[If $n = p_1^{a_1} dots p_k^{a_k}$, then $sigma(n) = product_(i=1)^k (p_i^{a_i + 1} - 1)/(p_i - 1)$.]

#theorem(desp: "Theorem 3.2.2.")[$sigma(n)$ is multiplicative.]

#theorem(desp: "Theorem 3.3.1 (Gauss's Theorem).")[For any positive integer $n$, $sum_(d | n) phi(d) = n$.]

#theorem(desp: "Theorem 3.4.1.")[If $f$ is multiplicative, then $F(n) = sum_(d | n) f(d)$ is also multiplicative.]

#definition(desp: "Definition 3.4.1 (Möbius Function).")[
  $mu(n) = cases(
    1 & "if" n = 1,
    (-1)^m & "if" n "is square-free with" m "prime factors",
    0 & "if" n "is not square-free"
  )$
]

#theorem(desp: "Theorem 3.4.2.")[$mu(n)$ is multiplicative.]

#theorem(desp: "Theorem 3.4.3.")[$sum_(d | n) mu(d) = cases(1 & "if" n = 1, 0 & "if" n > 1)$.]

#definition(desp: "Definition 3.4.3 (Dirichlet Convolution).")[The Dirichlet convolution of $f$ and $g$ is $(f * g)(n) = sum_(d | n) f(d) g(n/d)$.]

#theorem(desp: "Theorem 3.4.5 (Möbius Inversion Formula).")[
  $g(n) = sum_(d | n) f(d) arrow.l.r f(n) = sum_(d | n) g(d) mu(n/d)$.
]

#definition(desp: "Definition 3.5.1 (Floor Function).")[$floor(x)$ is the largest integer $n <= x$.]

#definition(desp: "Definition 3.5.2 (Fractional Part).")[${x} = x - floor(x)$.]

#theorem(desp: "Theorem 3.5.1 (Hermite's Identity).")[For any real $x$ and $m in bb(N)$, $sum_(k=0)^(m-1) floor(x + k/m) = floor(m x)$.]

== Chapter 4: Diophantine Equations

#theorem(desp: "Theorem 4.5.1 (Fermat's Last Theorem).")[The equation $a^n + b^n = c^n$ has no solutions in positive integers for $n >= 3$.]

#theorem(desp: "Theorem 4.5.2 (Pythagorean Triplets).")[All primitive solutions to $a^2 + b^2 = c^2$ are of the form $(2 m n, m^2 - n^2, m^2 + n^2)$.]

#theorem(desp: "Theorem 4.8.1 (Pell's Equation).")[The equation $x^2 - d y^2 = 1$ always has infinitely many solutions for non-square $d$.]

#theorem(desp: "Theorem 4.8.2 (Norm is Multiplicative).")[The Norm $N(x + y sqrt(d)) = x^2 - d y^2$ satisfies $N(z_1 z_2) = N(z_1) N(z_2)$.]

#theorem(desp: "Theorem 4.8.3 (Fundamental Solution).")[Every solution to $x^2 - d y^2 = 1$ is of the form $x + y sqrt(d) = (x_0 + y_0 sqrt(d))^n$ for the fundamental solution $(x_0, y_0)$.]

== Chapter 5: Modular Arithmetic Advanced

#theorem(desp: "Theorem 5.3.1 (Fermat's Christmas Theorem).")[The congruence $x^2 equiv -1 (mod p)$ has a solution if and only if $p = 2$ or $p equiv 1 (mod 4)$.]

#definition(desp: "Definition 5.4.1 (Order).")[The order of $a$ modulo $p$ is the smallest positive integer $n$ such that $a^n equiv 1 (mod p)$.]

#theorem(desp: "Theorem 5.4.1 (Fundamental Theorem of Orders).")[
  $a^n equiv 1 (mod p) arrow.l.r "ord"_p (a) | n$.
]

#corollary(desp: "Corollary 5.4.1.")[$"ord"_p (a) | p - 1$.]

#definition(desp: "Definition 5.5.1 (Primitive Root).")[A residue $g$ is a primitive root if $"ord"_p (g) = p - 1$.]

#theorem(desp: "Theorem 5.5.1.")[A primitive root always exists modulo $p$ for any prime $p$.]

#theorem(desp: "Theorem 5.9.1 (Freshman's Dream).")[For any prime $p$, $(a + b)^p equiv a^p + b^p (mod p)$.]

#theorem(desp: "Theorem 5.9.2 (Lagrange's Theorem).")[A polynomial of degree $n$ over $bb(F)_p$ has at most $n$ roots.]

#theorem(desp: "Theorem 5.9.5.")[A polynomial $f$ has exactly $deg f$ roots in $bb(F)_p$ if and only if $f(x) | x^p - x$.]

== Chapter 6: p-adic Valuation

#definition(desp: "Definition 6.0.1 (p-adic Valuation).")[The $p$-adic valuation $v_p (n)$ is the largest exponent $t$ such that $p^t | n$.]

#theorem(desp: "Theorem 6.2.1 (Legendre's Formula).")[
  $v_p (n!) = sum_(k=1)^infinity floor(n / p^k) = (n - S_p (n))/(p - 1)$.
]

#theorem(desp: "Theorem 6.4.1 (Lifting The Exponent Lemma).")[
  If $p | x - y$ and $p cancel(|) x, y$, then $v_p (x^n - y^n) = v_p (x - y) + v_p (n)$.
]

== Chapter 7: Polynomials

#theorem(desp: "Theorem 7.1.1 (Fundamental Theorem of Algebra)")[Every non-constant polynomial with complex coefficients has at least one complex root.]

#theorem(desp: "Theorem 7.1.3 (Vieta's Theorem)")[Relates the coefficients of a polynomial to sums and products of its roots.]

#theorem(desp: "Theorem 7.2.1 (Lagrange Interpolation)")[There exists a unique polynomial of degree at most $n$ that takes given values at $n + 1$ distinct points.]

#theorem(desp: "Theorem 7.5.1 (Gauss's Lemma)")[If a polynomial with integer coefficients is reducible over $bb(Q)$, then it is reducible over $bb(Z)$.]

== Chapter 8: Quadratic Residues

#definition(desp: "Definition 8.2.1 (Legendre Symbol)")[
  $(a/p) = cases(
    1 & "if" a "is a quadratic residue mod" p,
    -1 & "if" a "is a quadratic non-residue mod" p,
    0 & "if" p | a
  )$
]

#theorem(desp: "Theorem 8.2.2 (Euler's Criterion)")[$(a/p) equiv a^{(p - 1)/2} (mod p)$.]

#theorem(desp: "Theorem 8.3.1 (Quadratic Reciprocity)")[For distinct odd primes $p, q$, $(p/q)(q/p) = (-1)^{(p-1)/2 dot (q-1)/2}$.]

#theorem(desp: "Theorem 8.3.2 (Criterion for 2)")[$(2/p) = (-1)^{(p^2 - 1)/8}$.]

== Chapter 9: Constructions

#theorem(desp: "Theorem 9.1.1 (Dirichlet's Theorem)")[For coprime $a, d$, there are infinitely many primes $p equiv a (mod d)$.]

#theorem(desp: "Theorem 9.2.1 (Chinese Remainder Theorem)")[A system of congruences $x equiv a_i (mod m_i)$ has a unique solution modulo $lcm(m_i)$ if the $m_i$ are pairwise coprime.]

#lemma(desp: "Lemma 9.3.1 (Thue's Lemma)")[Let $n > 1$ and $gcd(a, n) = 1$. Then there exist $x, y$ such that $a x equiv plus.minus y (mod n)$ with $0 < x, y <= sqrt(n)$.]

#theorem(desp: "Theorem 9.3.1 (Fermat's Two Square Theorem)")[An odd prime $p$ is a sum of two squares if and only if $p equiv 1 (mod 4)$.]
