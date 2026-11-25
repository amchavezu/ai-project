# Final validation report

- Paper: **Credit Access, Firm Investment, and Future Output**
- Formalization id: `Chavez26CreditAccess`
- Validated: 2026-11-17

## Scope

The Lean development verifies the quadratic specialization used for the
paper's simulations and figures. It proves:

- the algebraic first-order conditions and target-capital identities;
- continuity of the two financing branches;
- global optimality in all four investment regions;
- the access-cost threshold equivalence and continuity at the cutoff;
- the direction of the alternative-finance comparative static;
- output monotonicity on the increasing branch; and
- the two-sector quantity/price sensitivity ordering.

The source metadata intentionally identifies an uncommitted academic
working-tree snapshot dated 2026-11-17. No academic commit was created.

## Verification receipt

- `lake env lean papers/Chavez26CreditAccess/Model.lean`: passed.
- `lake build +Chavez26CreditAccess.PaperInterface:olean`: passed (754 jobs).
- `lake build +Chavez26CreditAccess.ProofInterface:olean`: passed (965 jobs).
- `lake env lean papers/Chavez26CreditAccess.lean`: passed.
- `python -m scripts.paper_contribution check Chavez26CreditAccess --fast`:
  passed, including the semantic import-closure check and `git diff --check`.
- No `sorry` is present in the formalization.

## Separate course artifact

The only remaining student-produced artifact is the signed handwritten scan
`hand/manual_derivation.pdf`; it is not a Lean proof obligation.
