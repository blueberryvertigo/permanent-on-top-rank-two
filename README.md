# Permanent-on-top holds for real matrices of rank two

**Theorem.** Let A be a real symmetric positive semidefinite n×n matrix of rank at most two,
and let Π(A) be its Schur power matrix, Π(A)_{σ,τ} = ∏_i a_{σ(i),τ(i)}. Then

    0 ⪯ Π(A) ⪯ per(A)·I

for every n. The permanent is the largest eigenvalue of the Schur power matrix.

This is the exact extent of the permanent-on-top conjecture: it fails for real matrices of
rank three (Drury, n = 16) and for complex matrices of rank two (Shchesnovich, Tran, n = 5).

Consequences on the real rank-two class, in every dimension:
- Lieb's permanental dominance inequality for every subgroup of S_n and every character;
- per(A∘B) ≤ per(A)·∏ b_ii for every complex PSD B (Bapat–Sunder), hence per(A∘A) ≤ per(A)
  for correlation matrices (Drury's 2018 Conjecture 2);
- the permanental compound bounds of Pate and Bapat–Sunder, including the cofactor matrix.

Lieb's conjecture itself remains open in general.

- `permanent_on_top_rank_two.pdf` — the paper
- `pot.typ`, `refs.yml` — Typst source; build with `typst compile pot.typ`
