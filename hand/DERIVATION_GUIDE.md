# Hand derivation guide

The handwritten appendix must be the student's own work. Do not copy this file
line by line. Use it only as a checklist after attempting the derivation.

1. Write the firm's two-date profit problem and budget identity.
2. Substitute the financing identity to obtain the piecewise profit function.
3. Differentiate on the bank-finance and market-finance segments.
4. Derive the two target capital stocks `k_B` and `k_M`.
5. Prove that `k_M <= k_B` when market finance is weakly more expensive.
6. Draw the declining marginal-product curve and the two marginal funding costs.
7. Derive all four cases of the optimal policy, including boundary conditions.
8. In the kink regime, calculate the derivatives with respect to the bank limit
   and the common spread.
9. In the market-finance regime, calculate the same derivatives and explain the
   one-for-one substitution between bank and market finance.
10. Aggregate over a sector with constrained share `lambda_s` and prove the
    cross-sector ordering.

Recommended photographed check: prove the kink case from the signs of the left
and right derivatives, then compare your proof with the Lean theorem
`kink_regime_optimal`.
