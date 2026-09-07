// Permanent-on-top holds for real matrices of rank two
#set page(paper: "a4", margin: (x: 1.1in, y: 1.0in), numbering: "1")
#set text(size: 11pt)
#set par(justify: true, leading: 0.62em, first-line-indent: 1.2em)
#set heading(numbering: "1.")
#show heading: it => { v(0.6em); it; v(0.3em) }
#set math.equation(numbering: "(1)")
#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(el.location(), numbering(el.numbering, ..counter(math.equation).at(el.location())))
  } else { it }
}

#let per = math.op("per")
#let Tr = math.op("Tr")
#let tr = math.op("tr")
#let Sym = math.op("Sym")
#let rk = math.op("rank")
#let un(body) = [#set math.equation(numbering: none); #body]

#let thm(kind, num, name: none, body) = block(width: 100%, above: 1.1em, below: 1.1em)[
  *#kind #num*#if name != none [ (#name)]. #emph(body)
]
#let rem(kind, num, name: none, body) = block(width: 100%, above: 1.1em, below: 1.1em)[
  *#kind #num*#if name != none [ (#name)]. #body
]
#let proof(body) = block(width: 100%, above: 0.8em, below: 1.1em)[_Proof._ #body #h(1fr) $square$]

#align(center)[
  #text(size: 17pt, weight: "bold")[Permanent-on-top holds for real matrices of rank two]
  #v(0.6em)
  #text(size: 12pt)[liqsweep]
  #v(0.2em)
  #text(size: 10pt)[X: \@liqsweep]
  #v(0.2em)
  #text(size: 10pt)[September 2026]
]
#v(0.6em)

#block(inset: (x: 2.2em))[
  #set par(first-line-indent: 0em)
  *Abstract.* Let $A$ be a real symmetric positive semidefinite $n times n$ matrix of rank at most two, and let $Pi(A)$ be its Schur power matrix, the $n! times n!$ matrix with entries $Pi(A)_(sigma, tau) = product_i a_(sigma(i), tau(i))$. We prove $0 prec.eq Pi(A) prec.eq per(A) I$ for every $n$: the permanent is the largest eigenvalue of the Schur power matrix. The permanent-on-top conjecture is known to fail for complex matrices of rank two and for real matrices of rank three, so this is the exact extent of its validity. The proof constructs, for each $k$, an explicit symmetric involution $W$ on $Sym^(n-2k)(bb(R)^2) ⊗ Sym^n (bb(R)^2)$ whose partial trace over the second factor is the identity, and uses it to bound every isotypic block of the permutation-averaged tensor operator by its fully symmetric block. Consequences on this matrix class include Lieb's permanental dominance inequality for every subgroup of $S_n$ and every character, the Bapat–Sunder inequality $per(A compose B) <= per(A) product_i b_(i i)$ for every complex positive semidefinite $B$, both conjectures on real rank-two matrices in Drury's 2018 paper, and the permanental compound conjectures of Bapat–Sunder and Pate.
]
#v(0.4em)

= Introduction

Let $A = (a_(i j))$ be an $n times n$ complex Hermitian positive semidefinite matrix and let $per(A) = sum_(sigma in S_n) product_(i=1)^n a_(i, sigma(i))$ be its permanent. The _Schur power matrix_ of $A$ is the $n! times n!$ matrix
$ Pi(A)_(sigma, tau) = product_(i=1)^n a_(sigma(i), tau(i)), quad sigma, tau in S_n . $ <eq:schur>
Schur proved in 1918 that $Pi(A)$ is positive semidefinite, that $per(A)$ is one of its eigenvalues, with the all-ones vector as eigenvector, and that $det(A)$ is its smallest eigenvalue @Sch18. The _permanent-on-top conjecture_ of Soules @Sou66 @Sou94 asserted that $per(A)$ is also the largest eigenvalue:
$ Pi(A) prec.eq per(A) I . $ <eq:pot>
A proof would have implied Lieb's permanental dominance conjecture @Lie66 and a whole family of permanent inequalities; see Wanless @Wan22 for the implications. The conjecture holds for $n <= 3$ @BS86. It is false in general: Shchesnovich @Shc16 found a complex counterexample of order five and rank two, Drury @Dru17 found a real counterexample of order sixteen and rank three, and Tran @Tra21 found a complex counterexample of order five and rank two that can be checked by hand.

This paper proves that permanent-on-top is exactly true on the remaining class.

#thm("Theorem", "1.1")[
  Let $A$ be a real symmetric positive semidefinite $n times n$ matrix of rank at most two. Then
  $ 0 prec.eq Pi(A) prec.eq per(A) I_(n!) . $ <eq:main>
  In particular $per(A)$ is the largest eigenvalue of $Pi(A)$.
]

Together with the counterexamples of Drury and Tran, Theorem 1.1 gives a complete picture in terms of rank and field:

#align(center)[
  #table(
    columns: 3, align: (left, left, left), stroke: none, inset: 5pt,
    [*class*], [*permanent-on-top*], [*reference*],
    [real, rank $<= 2$], [holds for all $n$], [Theorem 1.1],
    [real, rank $3$], [fails ($n = 16$)], [Drury @Dru17],
    [complex, rank $2$], [fails ($n = 5$)], [Shchesnovich @Shc16, Tran @Tra21],
  )
]

Every implication in Wanless's diagram now applies on the real rank-two class. We record the consequences in Section 7. The most notable is that Lieb's conjecture holds there in full generality: for every subgroup $H <= S_n$ and every character $chi$ of $H$,
$ 0 <= 1/chi(1) sum_(h in H) chi(h) product_i a_(i, h(i)) <= per(A) . $ <eq:lieb>
Further, the Hadamard product inequality $per(A compose B) <= per(A) product_i b_(i i)$ holds with the second factor an arbitrary complex positive semidefinite matrix of the same order. Drury @Dru18 stated as Conjecture 2 that $per(A compose A) <= per(A)$ for real rank-two correlation matrices, and conjectured (as recorded in @Wan22) that the Bapat–Sunder Hadamard inequality holds for real rank-two matrices. Both follow. So do the compound conjectures of Bapat–Sunder @BS86 and Pate @Pat08 on this class, including the cofactor bound $[a_(i j) per A(i|j)] prec.eq per(A) I$.

*The method.* Write $A$ as the Gram matrix of vectors $v_1, dots, v_n in bb(R)^2$ and let $psi = v_1 ⊗ dots.c ⊗ v_n in (bb(R)^2)^(⊗ n)$. Then $Pi(A)$ is the Gram matrix of the $n!$ vectors $U_sigma psi$, where $U_sigma$ permutes tensor factors. Its nonzero spectrum coincides with that of the $2^n times 2^n$ operator $n! Q$, $Q = (n!)^(-1) sum_sigma |U_sigma psi ⟩ ⟨ U_sigma psi|$. Under $G L_2(bb(R))$ the space $(bb(R)^2)^(⊗ n)$ decomposes into isotypic blocks indexed by $k = 0, dots, floor(n\/2)$, the $k$-th block being $det^k ⊗ Sym^(n-2k)$ with multiplicity. A polarization identity writes $Q$ as a signed sum of tensor powers of real positive semidefinite $2 times 2$ matrices, so $Q$ is block diagonal with blocks $R_k$. The block $R_0$ on the fully symmetric tensors is rank one with trace $per(A)\/n!$. The heart of the proof is an explicit linear map $Phi_(n,k)$ carrying $R_0$ to $R_k$ and satisfying $Phi_(n,k)(S) prec.eq (tr S) I$ for $S succ.eq 0$. It is built from a symmetric involution $W_(n,k)$ on $Sym^(n-2k) ⊗ Sym^n$ whose partial trace over the second factor is the identity. The construction of $W_(n,k)$ and the verification of its three properties occupy Sections 3 and 4.

The real hypothesis enters at exactly one point: the covariance identity $Phi_(n,k)(rho_n (M)) = (det M)^k rho_(n-2k)(M)$ is proved for $M = g g^T$ with $g$ real, and Hermitian rank-one factors $v v^*$ are not of this form. This is where Tran's complex example escapes.

Concurrently with this work, Kunisky, Spielman and Yu @KSY26 sharpened Bang's inequality for real rank-two matrices using the same binary Clebsch–Gordan decomposition. Their inequality is different from @eq:main and is not used here.

= Preliminaries

Throughout, $E = bb(R)^2$ with the standard inner product $x dot y$, and $[x, y] = x_1 y_2 - x_2 y_1$. For $d >= 0$ let $V_d = Sym^d (E) subset E^(⊗ d)$ with the inner product inherited from the tensor product, $V_0 = bb(R)$. For $u in E$ write $u^d = u^(⊗ d) in V_d$. These _coherent vectors_ span $V_d$ and satisfy $⟨ u^d, v^d ⟩ = (u dot v)^d$. Every $g in G L_2(bb(R))$ acts on $V_d$ by $rho_d (g) = g^(⊗ d)|_(V_d)$; thus $rho_d (g) u^d = (g u)^d$ and $rho_d (g)^T = rho_d (g^T)$.

Let $e_1, e_2$ be the standard basis of $E$. For $0 <= a <= d$ let $e_a^((d))$ be the unit vector proportional to the symmetrization of $e_1^(⊗ a) ⊗ e_2^(⊗ (d-a))$. These form an orthonormal basis of $V_d$, and
$ u^d = sum_(a=0)^d sqrt(binom(d, a)) thin u_1^a u_2^(d-a) thin e_a^((d)) . $ <eq:coherent>

*The $frak("sl")_2$ operators.* On $V_d$ define
$ H_d e_a^((d)) = (a - d/2) e_a^((d)), quad E_d e_a^((d)) = sqrt((a+1)(d-a)) thin e_(a+1)^((d)), quad F_d = E_d^T . $ <eq:sl2>
These satisfy $[H_d, E_d] = E_d$, $[H_d, F_d] = -F_d$, $[E_d, F_d] = 2 H_d$, and they are the derivatives of $rho_d$: writing $X_(i j)$ for the matrix units,
$ dif rho_d (X_(12)) = E_d, quad dif rho_d (X_(21)) = F_d, quad dif rho_d (X_(11) - X_(22)) = 2 H_d . $ <eq:deriv>
Indeed the derivative of $g^(⊗ d)$ at the identity acts on a symmetrized word by acting on each factor in turn; on the word with $a$ letters $e_1$, the matrix unit $X_(12)$ turns each of the $d - a$ letters $e_2$ into $e_1$, producing $(a+1)$ times the symmetrized word with $a+1$ letters $e_1$, and the normalizations in @eq:coherent convert this count into $sqrt((a+1)(d-a))$.

*Clebsch–Gordan.* The following decomposition is classical; see @FH91[Section 11.2]. We include the short argument because the real orthogonality of the blocks is what we use.

#thm("Lemma", "2.1")[
  As an orthogonal direct sum of $G L_2(bb(R))$-modules,
  $ E^(⊗ n) tilde.equiv ⨁_(k=0)^(floor(n\/2)) (det^k ⊗ V_(n-2k)) ⊗ bb(R)^(d_(n,k)), quad d_(n,k) = binom(n, k) - binom(n, k-1) . $ <eq:cg>
  Consequently, for every real symmetric positive semidefinite $M$,
  $ M^(⊗ n) tilde.equiv ⨁_k (det M)^k rho_(n-2k)(M) ⊗ I_(d_(n,k)) . $ <eq:cgM>
]

#proof[
  Let $H, E, F$ act on $E^(⊗ n)$ as the sums over tensor positions of $H_1, E_1, F_1$. They satisfy the $frak("sl")_2$ relations, $H$ is symmetric, and $F = E^T$. Weight spaces of $H$ are spanned by words with a prescribed number of letters $e_1$, so the weight $h$ has multiplicity $binom(n, n\/2 + h)$. A highest-weight vector $w$ of weight $j$ generates by $w, F w, F^2 w, dots$ an $F$-stable subspace on which the relations force $E F^r w = r(2j - r + 1) F^(r-1) w$; this subspace is $E$-stable, has dimension $2j + 1$, and its normalized basis realizes @eq:sl2 for $d = 2j$. The orthogonal complement of an $(H, E, F)$-stable subspace is stable because $H$ is symmetric and $E, F$ are mutually adjoint, so induction decomposes $E^(⊗ n)$ orthogonally into copies of the $V_d$ with $d equiv n mod 2$. Comparing the multiplicities of consecutive weights gives $binom(n, k) - binom(n, k-1)$ copies of $V_(n-2k)$. For $g in G L_2(bb(R))$ with $det g > 0$ write $g = (det g)^(1\/2) exp(X)$ with $tr X = 0$; the $frak("sl")_2$ action identifies $exp(X)^(⊗ n)$ with $rho_(n-2k)(exp X)$ on each copy of $V_(n-2k)$, and the scalar contributes $(det g)^(n\/2) = (det g)^k (det g)^((n-2k)\/2)$, which is $(det g)^k rho_(n-2k)((det g)^(1\/2) I)$. This proves @eq:cg and @eq:cgM for positive definite $M$; the identity is polynomial in $M$, so it persists for singular $M$.
]

= The involution

Fix $n >= 0$ and $0 <= k <= floor(n\/2)$, and put $m = n - 2k$. Define a real operator $W = W_(n,k)$ on $V_m ⊗ V_n$ through its values on coherent vectors:
$ ⟨ u^m ⊗ x^n, thin W(v^m ⊗ y^n) ⟩ = sum_(ell=0)^m c_ell thin [x, y]^(2k + ell) [u, v]^ell (x dot u)^(m - ell) (y dot v)^(m - ell), $ <eq:kernel>
$ c_ell = (-1)^(k + ell) binom(n, k) binom(m, ell) binom(2k + ell, k)^(-1) . $ <eq:cl>
The right side of @eq:kernel is a polynomial in $(u, x, v, y)$, homogeneous of degrees $(m, n, m, n)$: each term has degree $2k + ell + (m - ell) = n$ in $x$ and in $y$, and degree $ell + (m - ell) = m$ in $u$ and in $v$. Since $⟨ u^m ⊗ x^n, dot ⟩$ identifies such polynomials with linear functionals on $V_m ⊗ V_n$ and the coherent vectors span, @eq:kernel determines $W$ uniquely.

#thm("Theorem", "3.1")[
  $W$ is symmetric, $W^2 = I$, and its partial trace over $V_n$ is the identity of $V_m$:
  $ W^T = W, quad W^2 = I, quad Tr_(V_n) W = I_(V_m) . $ <eq:three>
  In particular $-I prec.eq W prec.eq I$.
]

The proof occupies the rest of this section and the next. For $k = 0$, the bracket identity
$ [x, y][u, v] = (x dot u)(y dot v) - (x dot v)(y dot u) $ <eq:bracket>
reduces @eq:kernel to $(x dot v)^n (y dot u)^n$, so $W_(n,0)$ is the swap of the two factors of $V_n ⊗ V_n$, and @eq:three is immediate. The arguments below apply to all $k$, but the partial-trace computation of Section 4 is needed only for $k >= 1$.

== Symmetry and covariance

Interchanging $(u, x)$ with $(v, y)$ in @eq:kernel multiplies each bracket factor by $(-1)^(2k + ell)(-1)^ell = 1$ and interchanges the two dot-product factors, so the kernel is symmetric and $W^T = W$.

For $g in G L_2(bb(R))$ put $B = rho_m (g)$, $C = rho_n (g)$ and $cal(R)(g) = B^(-T) ⊗ C$. Replacing $u, v$ by $g^(-T) u, g^(-T) v$ and $x, y$ by $g x, g y$ leaves every dot product in @eq:kernel unchanged, multiplies $[x, y]$ by $det g$ and $[u, v]$ by $(det g)^(-1)$, hence multiplies each term by $(det g)^(2k)$. Since $(g^(-T) u)^m = B^(-T) u^m$ and $(g x)^n = C x^n$,
$ cal(R)(g)^T W cal(R)(g) = (det g)^(2k) W . $ <eq:cov>

On $V_m ⊗ V_n$ define
$ bold(H) = I ⊗ H_n - H_m ⊗ I, quad bold(E) = I ⊗ E_n - F_m ⊗ I, quad bold(F) = bold(E)^T = I ⊗ F_n - E_m ⊗ I . $ <eq:HEF>
These satisfy the $frak("sl")_2$ relations, being the action on $V_m^* ⊗ V_n$ with $V_m^*$ identified with $V_m$ by the inner product. Differentiating @eq:cov along $g = exp(t X)$ with $tr X = 0$, using @eq:deriv and $dif rho_m (X)^T = dif rho_m (X^T)$, gives $frak(X)^T W + W frak(X) = 0$ for $frak(X) = I ⊗ dif rho_n (X) - dif rho_m (X)^T ⊗ I$. The three choices $X = (X_(11) - X_(22))\/2$, $X_(12)$, $X_(21)$ give $frak(X) = bold(H), bold(E), bold(F)$ with transposes $bold(H), bold(F), bold(E)$, hence
$ W bold(H) = -bold(H) W, quad W bold(E) = -bold(F) W, quad W bold(F) = -bold(E) W . $ <eq:anticomm>
So $W$ maps the $bold(H)$-eigenspace of weight $h$ onto that of weight $-h$.

== The zero-weight space

The eigenvalues of $bold(H)$ on $e_a^((m)) ⊗ e_c^((n))$ are $(c - n\/2) - (a - m\/2) = c - a - k$, so all weights are integers and the zero-weight space has the orthonormal basis
$ b_a = e_a^((m)) ⊗ e_(a+k)^((n)), quad 0 <= a <= m . $ <eq:ba>

#thm("Lemma", "3.2")[
  $W b_0 = b_0$.
]

#proof[
  By @eq:anticomm, $W b_0$ lies in the zero-weight space, so it suffices to compute $⟨ b_0, W b_b ⟩$ for $0 <= b <= m$. Take $u = e_2$ in @eq:kernel, so that $u^m = e_0^((m))$, $x dot u = x_2$ and $[u, v] = -v_1$; then extract the coefficient of $x_1^k x_2^(n-k)$, of $v_1^b v_2^(m-b)$ and of $y_1^(b+k) y_2^(n-b-k)$, which by @eq:coherent equals $sqrt(binom(n, k) binom(m, b) binom(n, b+k)) thin ⟨ b_0, W b_b ⟩$. In the term of index $ell$, the factor $x_1^k$ must come from $[x, y]^(2k+ell) = (x_1 y_2 - x_2 y_1)^(2k + ell)$, contributing $binom(2k + ell, k) x_1^k y_2^k (-x_2 y_1)^(k + ell)$; the factor $(-v_1)^ell (y dot v)^(m - ell)$ then contributes $v_1^b$ exactly through $binom(m - ell, b - ell) (y_1 v_1)^(b - ell) (y_2 v_2)^(m - b)$. The exponents of $x_2$, $y_1$, $y_2$ come out as $n - k$, $b + k$, $n - b - k$ automatically. Hence the coefficient is
  #un[$ (-1)^k sum_(ell=0)^b c_ell binom(2k+ell, k) binom(m-ell, b-ell) = binom(n, k) sum_(ell=0)^b (-1)^ell binom(m, ell) binom(m - ell, b - ell) = binom(n, k) binom(m, b) (1 - 1)^b , $]
  using @eq:cl and $binom(m, ell) binom(m-ell, b-ell) = binom(m, b) binom(b, ell)$. For $b = 0$ this equals $binom(n, k)$, and division by the normalization $binom(n, k)$ gives $⟨ b_0, W b_0 ⟩ = 1$; for $b >= 1$ it vanishes. By symmetry of $W$, $W b_0 = sum_b ⟨ b_b, W b_0 ⟩ b_b = b_0$.
]

#thm("Lemma", "3.3")[
  $W$ fixes every vector of the zero-weight space.
]

#proof[
  Let $bold(C) = bold(H)^2 + 1/2 (bold(E) bold(F) + bold(F) bold(E))$ be the Casimir operator. From @eq:anticomm, $W bold(H)^2 = bold(H)^2 W$ and $W (bold(E) bold(F) + bold(F) bold(E)) = (bold(F) bold(E) + bold(E) bold(F)) W$, so $W$ commutes with $bold(C)$. Since $bold(C)$ commutes with $bold(H)$ it preserves the zero-weight space, where $bold(H)^2 = 0$. Computing $bold(E) b_a$ and $bold(F) b_a$ from @eq:sl2 and @eq:HEF, the matrix of $bold(C)$ in the basis @eq:ba is tridiagonal with off-diagonal entries
  $ ⟨ b_(a+1), bold(C) b_a ⟩ = -sqrt((a+1)(m-a)(a+k+1)(n-a-k)), quad 0 <= a < m, $ <eq:tridiag>
  all nonzero because $n - a - k >= k + 1$. Hence $bold(C)^j b_0$ has a nonzero component along $b_j$ and no component along $b_i$ for $i > j$, so $b_0, bold(C) b_0, dots, bold(C)^m b_0$ span the zero-weight space. Each is fixed by $W$, by Lemma 3.2 and $W bold(C) = bold(C) W$.
]

== The involution identity

#thm("Lemma", "3.4")[
  $W^2 = I$.
]

#proof[
  By @eq:anticomm, $W^2$ commutes with $bold(H)$, $bold(E)$ and $bold(F)$, and by Lemma 3.3 it is the identity on the zero-weight space. If $y$ has weight $h > 0$ and $bold(F) y = 0$, then $0 = ⟨ y, bold(E) bold(F) y ⟩ = ⟨ y, (bold(F) bold(E) + 2 bold(H)) y ⟩ = ||bold(E) y||^2 + 2h ||y||^2$, so $y = 0$; thus $bold(F)$ is injective on positive weights and its adjoint $bold(E)$ maps the weight-$(h-1)$ space onto the weight-$h$ space for every $h >= 1$. Symmetrically $bold(F)$ maps weight $-(h-1)$ onto weight $-h$. Since all weights are integers, every vector is a sum of images of zero-weight vectors under powers of $bold(E)$ or of $bold(F)$, and $W^2$ is the identity on all of them.
]

Symmetry and $W^2 = I$ give $-I prec.eq W prec.eq I$. It remains to prove the partial-trace identity.

= The partial trace

Assume $k >= 1$. Two tools are needed: a Beta-integral form of the kernel, and Gaussian moments.

*Beta form of the kernel.* Since $binom(2k+ell, k)^(-1) = k integral_0^1 t^(k+ell) (1-t)^(k-1) dif t$, and since @eq:bracket gives $[x,y]^ell [u,v]^ell (x dot u)^(m-ell) (y dot v)^(m-ell) = (a - b)^ell a^(m-ell)$ with $a = (x dot u)(y dot v)$ and $b = (x dot v)(y dot u)$, the binomial theorem turns @eq:kernel into
#un[$ K(u, x; v, y) := ⟨ u^m ⊗ x^n, W(v^m ⊗ y^n) ⟩ , $]
$ K(u, x; v, y) = (-1)^k binom(n, k) k thin [x, y]^(2k) integral_0^1 t^k (1-t)^(k-1) ((1-t) a + t b)^m dif t . $ <eq:beta>

*Gaussian resolution of the identity.* Let $Z = (Z_1, Z_2)$ be a standard complex Gaussian vector, $bb(E) |Z_i|^2 = 1$. By @eq:coherent the components of $Z^n$ in the basis $e_a^((n))$ are $sqrt(binom(n, a)) Z_1^a Z_2^(n-a)$, and $bb(E) [overline(Z_1)^a overline(Z_2)^(n-a) Z_1^b Z_2^(n-b)] = delta_(a b) a! (n-a)!$. Hence $bb(E)[overline(Z)^n ⊗ Z^n] = n! sum_a e_a^((n)) ⊗ e_a^((n))$, and extending $K$ bilinearly to complex arguments,
$ ⟨ u^m, (Tr_(V_n) W) v^m ⟩ = 1/n! bb(E) thin K(u, overline(Z); v, Z) . $ <eq:resolution>

Put $alpha = u dot v$, $beta = [u, v]$, $J = mat(0, 1; -1, 0)$ and $M_t = (1-t) u v^T + t v u^T$. With $x = overline(Z)$, $y = Z$ one has $[x, y] = Z^* J Z$ and $(1-t) a + t b = Z^* M_t Z$. For a complex $2 times 2$ matrix $N$ of small norm, $bb(E) exp(Z^* N Z) = det(I - N)^(-1)$, a Gaussian integral; both sides are analytic in the entries of $N$, so the identity holds coefficientwise as formal power series. A direct computation of the determinant gives
$ bb(E) exp(s Z^* J Z + r Z^* M_t Z) = 1 / (1 - r alpha + s^2 + (1 - 2t) s r beta - t(1-t) r^2 beta^2) . $ <eq:gauss>
Indeed, with $M_t = (m_(i j))$ one has $m_(11) + m_(22) = alpha$, $m_(12) - m_(21) = (1 - 2t) beta$ and $m_(11) m_(22) - m_(12) m_(21) = -t(1-t) beta^2$, and the determinant of $I - s J - r M_t$ expands accordingly. Note that the denominator of @eq:gauss factors as $a_0 + (s + (1-t) v_0)(s - t v_0)$ with $a_0 = 1 - r alpha$ and $v_0 = r beta$.

#thm("Lemma", "4.1")[
  For $k >= 1$, as formal power series in $s$ and $v_0$ with $a_0$ invertible,
  $ [s^(2k)] integral_0^1 (t^k (1-t)^(k-1)) / (a_0 + (s + (1-t) v_0)(s - t v_0)) dif t = (-1)^k (k! (k-1)!) / ((2k)!) a_0^(-k-1) . $ <eq:coeff>
  In particular the coefficient does not depend on $v_0$.
]

#proof[
  Expand $(a_0 + w)^(-1) = sum_p (-1)^p w^p a_0^(-p-1)$ with $w = (s + (1-t) v_0)(s - t v_0)$, homogeneous of degree two in $(s, v_0)$. The coefficient of $s^(2k) v_0^(2l)$ can only come from $p = k + l$, where
  #un[$ [s^(2k) v_0^(2l)] thin w^(k+l) = sum_i binom(k+l, i) binom(k+l, 2k-i) (1-t)^(k+l-i) (-t)^(l-k+i) . $]
  Integrating against $t^k (1-t)^(k-1)$ gives, up to the factor $(-1)^(k+l) a_0^(-k-l-1)$,
  $ sum_i (-1)^(l-k+i) binom(k+l, i) binom(k+l, 2k-i) ((l+i)! (2k+l-i-1)!) / ((2k+2l)!) , $ <eq:sumi>
  the sum running over the $i$ for which all factorials are of nonnegative integers. For $l = 0$ only $i = k$ contributes, giving $k! (k-1)! \/ (2k)!$, which is the right side of @eq:coeff. For $l >= 1$ write
  #un[$ binom(k+l, i) binom(k+l, 2k-i) (l+i)! (2k+l-i-1)! = ((k+l)!^2) / ((2k)!) binom(2k, i) P_l (i), quad P_l (i) = product_(a=1)^k (l - k + i + a) product_(b=1)^(k-1) (k + l - i + b) . $]
  So @eq:sumi is a constant multiple of $sum_i (-1)^i binom(2k, i) P_l (i)$. The range of $i$ may be extended to all of $0 <= i <= 2k$: for $i < k - l$ the first product contains the factor $0$, and for $i > k + l$ the second does. But $P_l$ is a polynomial of degree $2k - 1$, and the $2k$-th finite difference of such a polynomial vanishes. Hence every coefficient with $l >= 1$ is zero.
]

#proof[
  (of the partial-trace identity in Theorem 3.1.) By @eq:resolution, @eq:beta and @eq:gauss,
  #un[$ ⟨ u^m, (Tr_(V_n) W) v^m ⟩ = ((-1)^k binom(n, k) k (2k)! m!) / (n!) thin [s^(2k) r^m] integral_0^1 (t^k (1-t)^(k-1)) / (1 - r alpha + s^2 + (1-2t) s r beta - t(1-t) r^2 beta^2) dif t , $]
  since $bb(E)[(Z^* J Z)^(2k) (Z^* M_t Z)^m] = (2k)! m! [s^(2k) r^m]$ of the left side of @eq:gauss. By Lemma 4.1 with $a_0 = 1 - r alpha$ and $v_0 = r beta$, the coefficient of $s^(2k)$ is $(-1)^k k!(k-1)!(2k)!^(-1) (1 - r alpha)^(-k-1)$, whose coefficient of $r^m$ is $binom(k+m, m) alpha^m$. Therefore
  #un[$ ⟨ u^m, (Tr_(V_n) W) v^m ⟩ = (binom(n, k) (k!)^2 m! binom(k+m, m)) / (n!) alpha^m = alpha^m = ⟨ u^m, v^m ⟩ , $]
  because $binom(n,k)(k!)^2 m! binom(k+m, m) = n! thin k! (k+m)! \/ (n-k)! = n!$ when $n - k = m + k$. Coherent vectors span $V_m$, so $Tr_(V_n) W = I_(V_m)$.
]

This completes the proof of Theorem 3.1.

= A trace-dominating map between symmetric powers

For a real symmetric operator $S$ on $V_n$ define
$ Phi_(n,k)(S) = Tr_(V_n) (W_(n,k) (I ⊗ S)) , $ <eq:phi>
an operator on $V_m$, $m = n - 2k$. Partial trace over the second factor is cyclic with respect to operators of the form $I ⊗ S$, so $Phi_(n,k)(S)$ is symmetric.

#thm("Lemma", "5.1")[
  For every real symmetric $S succ.eq 0$ on $V_n$,
  $ Phi_(n,k)(S) prec.eq (tr S) thin I_(V_m) . $ <eq:phibound>
]

#proof[
  For $z in V_m$, $z^T Phi(S) z = Tr(W (z z^T ⊗ S))$. The operator $z z^T ⊗ S$ is positive semidefinite and $W prec.eq I$ by Theorem 3.1, so $Tr(W (z z^T ⊗ S)) <= Tr(z z^T ⊗ S) = ||z||^2 tr S$.
]

Nothing is claimed about $Phi$ preserving positivity, and nothing of the kind is needed.

#thm("Lemma", "5.2")[
  For every real symmetric positive semidefinite $2 times 2$ matrix $M$,
  $ Phi_(n,k)(rho_n (M)) = (det M)^k rho_m (M) . $ <eq:phicov>
]

#proof[
  Let $g in G L_2(bb(R))$, $B = rho_m (g)$, $C = rho_n (g)$. Multiplying @eq:cov on the left by $B ⊗ I$ and on the right by $B^T ⊗ I$ gives $(I ⊗ C^T) W (I ⊗ C) = (det g)^(2k) (B ⊗ I) W (B^T ⊗ I)$. Taking the partial trace against $I ⊗ S$ and using cyclicity in the traced factor,
  #un[$ Phi(C S C^T) = (det g)^(2k) B thin Phi(S) thin B^T . $]
  Put $S = I$. Then $Phi(I) = Tr_(V_n) W = I$ by Theorem 3.1, and $C C^T = rho_n (g g^T)$, $B B^T = rho_m (g g^T)$, so $Phi(rho_n (g g^T)) = (det g)^(2k) rho_m (g g^T)$. Every positive definite $M$ is $g g^T$ with $g$ real and $(det g)^(2k) = (det M)^k$; singular $M$ follow by continuity.
]

Lemma 5.2 is the only place where the real hypothesis is used, and it is used essentially: the factorization $M = g g^T$ with $g$ real is what turns the transpose in @eq:cov into the matrix $M$ itself.

= Proof of Theorem 1.1

Let $A = (v_i dot v_j)$ be the Gram matrix of $v_1, dots, v_n in bb(R)^2$; every real symmetric positive semidefinite matrix of rank at most two is of this form. Put $psi = v_1 ⊗ dots.c ⊗ v_n in E^(⊗ n)$, $D_i = v_i v_i^T$, and let $U_sigma$ be the operator permuting the tensor factors of $E^(⊗ n)$ according to $sigma$. Define
$ Q = 1/n! sum_(sigma in S_n) |U_sigma psi ⟩ ⟨ U_sigma psi| . $ <eq:Q>

*Polarization.* Expanding $(sum_(i in J) D_i)^(⊗ n)$ into words and applying inclusion–exclusion over $J subset.eq [n]$ cancels every word in which some $D_i$ is missing, leaving exactly the $n!$ words using each $D_i$ once. Since $|U_sigma psi ⟩ ⟨ U_sigma psi| = D_(sigma(1)) ⊗ dots.c ⊗ D_(sigma(n))$,
$ Q = 1/n! sum_(J subset.eq [n]) (-1)^(n - |J|) (sum_(i in J) D_i)^(⊗ n) . $ <eq:polar>
Each $M_J = sum_(i in J) D_i$ is real symmetric positive semidefinite.

*Block structure.* By Lemma 2.1 applied to each term of @eq:polar, $Q$ is block diagonal for the decomposition @eq:cg, with blocks $R_k ⊗ I_(d_(n,k))$ where
$ R_k = 1/n! sum_J (-1)^(n - |J|) (det M_J)^k rho_(n-2k)(M_J) . $ <eq:Rk>
The $k = 0$ block lives on $V_n$, which occurs with multiplicity one. Let $S = R_0$. Applying Lemma 5.2 to each term of @eq:Rk and using linearity of $Phi_(n,k)$,
$ R_k = Phi_(n,k)(S) quad (0 <= k <= floor(n\/2)) . $ <eq:RkPhi>

*The symmetric block.* Let $P$ be the orthogonal projection of $E^(⊗ n)$ onto $V_n$. Since $P U_sigma = P$, compressing @eq:Q gives $S = P Q P = |P psi ⟩ ⟨ P psi|$, a rank-one positive semidefinite operator with
$ tr S = ⟨ psi, P psi ⟩ = 1/n! sum_sigma ⟨ psi, U_sigma psi ⟩ = 1/n! sum_sigma product_i v_i dot v_(sigma(i)) = per(A) / n! . $ <eq:trS>

*Conclusion.* Lemma 5.1, @eq:RkPhi and @eq:trS give $R_k prec.eq (per(A)\/n!) I$ for every $k$, hence
$ 0 prec.eq Q prec.eq per(A)/n! I . $ <eq:Qbound>
Let $T$ be the $2^n times n!$ matrix with columns $U_sigma psi$. Then $T T^T = n! Q$ and $T^T T$ has entries $⟨ U_sigma psi, U_tau psi ⟩ = product_i a_(sigma(i), tau(i))$, that is, $T^T T = Pi(A)$. The two products have the same nonzero eigenvalues, so @eq:Qbound gives $0 prec.eq Pi(A) prec.eq per(A) I$. Since the all-ones vector is an eigenvector of $Pi(A)$ with eigenvalue $per(A)$, the permanent is the largest eigenvalue. $square$

= Consequences

Throughout this section $A$ is real symmetric positive semidefinite of rank at most two and of order $n$.

#thm("Corollary", "7.1", name: "Lieb's inequality on the class")[
  For every subgroup $H <= S_n$ and every character $chi$ of $H$, irreducible or not, real-valued or not,
  $ 0 <= 1/chi(1) sum_(h in H) chi(h) product_(i=1)^n a_(i, h(i)) <= per(A) . $ <eq:lieb2>
]

#proof[
  The matrix $Pi_H (A) = (Pi(A)_(sigma, tau))_(sigma, tau in H)$ is a principal submatrix of $Pi(A)$, so $0 prec.eq Pi_H (A) prec.eq per(A) I$. Choose a unitary representation with character $chi$; then $K_(sigma, tau) = chi(sigma^(-1) tau)$ is the Gram matrix of the representing matrices in the Hilbert–Schmidt inner product, hence positive semidefinite, with trace $|H| chi(1)$. Writing $m_h (A) = product_i a_(i, h(i))$ one has $Pi(A)_(sigma, tau) = m_(tau sigma^(-1))(A)$, and since $chi$ is a class function and $A$ is symmetric, $Tr(Pi_H (A) K) = |H| sum_(h in H) chi(h) m_h (A)$. The inequality $0 <= Tr(Pi_H (A) K) <= per(A) Tr K$ is @eq:lieb2.
]

#thm("Corollary", "7.2", name: "Hadamard products")[
  For every complex Hermitian positive semidefinite $B$ of order $n$,
  $ per(A compose B) <= per(A) product_(i=1)^n b_(i i) . $ <eq:hadamard>
  In particular $per(A compose A) <= per(A)$ when $A$ is a correlation matrix, which is Conjecture 2 of Drury @Dru18.
]

#proof[
  $Pi(B)$ is positive semidefinite, hence so is $Pi(B)^T$. Now $Tr(Pi(A) Pi(B)^T) = sum_(sigma, tau) product_i a_(sigma(i) tau(i)) b_(sigma(i) tau(i)) = n! per(A compose B)$ and $Tr(Pi(B)^T) = n! product_i b_(i i)$. Apply $0 prec.eq Pi(A) prec.eq per(A) I$.
]

The second factor in @eq:hadamard is unrestricted in rank and need not be real. Drury's conjecture, as recorded by Wanless @Wan22, that the Bapat–Sunder inequality $per(A compose B) <= per(A) product_i b_(i i)$ holds for real rank-two $A$, is thus proved in a stronger form.

#thm("Corollary", "7.3", name: "Permanental compounds")[
  For $1 <= s <= n$ let $cal(C)_s (A)$ be the $binom(n, s) times binom(n, s)$ matrix with entries $per A[I, J] thin per A[I^c, J^c]$ over $s$-subsets $I, J$. Then $0 prec.eq cal(C)_s (A) prec.eq per(A) I$. In particular the cofactor matrix $[a_(i j) per A(i|j)]$ has largest eigenvalue $per(A)$.
]

#proof[
  Let $cal(J)$ map a function $f$ on $s$-subsets to the function $sigma |-> f(sigma({1, dots, s}))$ on $S_n$. Summing @eq:schur over the permutations with a prescribed image of ${1, dots, s}$ gives $Pi(A) cal(J) = cal(J) cal(C)_s (A)$, and $cal(J)^T cal(J) = s! (n-s)! I$. Hence $cal(C)_s (A) = (s!(n-s)!)^(-1) cal(J)^T Pi(A) cal(J)$ is a compression of $Pi(A)$ by an isometry.
]

Corollary 7.3 is Conjecture 10 of Pate @Pat08 and, for $s = 1$, Conjecture 3 of Bapat and Sunder @BS86, on the real rank-two class. Both are false in general @Dru16 @Dru18 @Tra21.

= Sharpness

The hypotheses of Theorem 1.1 cannot be relaxed in either direction.

*Real rank three.* Drury @Dru17 exhibited a real correlation matrix of order sixteen and rank three, the Gram matrix of one representative from each antipodal pair of vertices of a polytope inscribed in the sphere of $bb(R)^3$, for which $Pi(A)$ has an eigenvalue exceeding $per(A)$.

*Complex rank two.* Tran's matrix @Tra21
#un[$ A = mat(3, 1-2i, -1, 1+2i, 1; 1+2i, 3, 1-2i, -1, 1; -1, 1+2i, 3, 1-2i, 1; 1-2i, -1, 1+2i, 3, 1; 1, 1, 1, 1, 1) $]
is Hermitian positive semidefinite of rank two with $per(A) = 504$, and $512$ is an eigenvalue of $Pi(A)$.

In the proof, complex Gram vectors $v_i in bb(C)^2$ would give factors $D_i = v_i v_i^*$, and the decomposition @eq:cgM together with Lemma 5.2 would be needed for Hermitian $M$. The covariance @eq:cov is an identity of bilinear forms and extends verbatim to complex $g$, but it yields $Phi(rho_n (g g^T)) = (det g)^(2k) rho_m (g g^T)$ with the transpose, not the conjugate transpose. For real $g$ the two coincide; for complex $g$ they do not, and Tran's example shows that no repair is possible.

= Computational confirmation

Theorem 3.1 was checked by exact rational arithmetic for all $0 <= k <= n\/2$ and $n <= 24$, and by an independent symbolic expansion of the kernel @eq:kernel for $n <= 8$. Theorem 1.1 itself was certified by exact rational $L D L^T$ elimination of $per(A) I - T T^T$ for integer Gram vectors of orders up to seven, and the largest eigenvalue of $Pi(A)$ was compared with $per(A)$ in floating point for random real rank-two matrices of orders up to eight, agreeing to machine precision. These computations played no role in the proof.

#v(1em)
*Acknowledgments.* The exposition was prepared with the assistance of GPT-6 Astra.

#v(0.5em)
#bibliography("refs.yml", title: "References", style: "ieee")
