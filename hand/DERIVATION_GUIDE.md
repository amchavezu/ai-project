# Hand derivation guide

The handwritten appendix must be the student's own work. Do not copy this file
line by line. Use it only as a checklist after attempting the derivation.

1. Write the firm's two-date profit problem and budget identity.
2. Substitute the financing identity to obtain the piecewise profit function.
3. Differentiate on the bank-finance and alternative-finance segments.
4. Derive the two target capital stocks `k_B` and `k_M(tau)`.
5. Prove that `k_M(tau) <= k_B` when `tau >= 0`.
6. Draw the declining marginal-product curve and the two marginal funding costs.
7. Derive all four cases of the optimal policy, including boundary conditions.
8. Impose `beta F'(n+B) > R_B` and derive
   `tau_star = beta F'(n+B) - R_B` from the right derivative at the bank limit.
9. Prove separately that `tau >= tau_star` implies `k*=n+B` and that
   `tau < tau_star` implies `beta F'(k*)=R_B+tau` with `k*>n+B`.
10. Calculate the local derivatives with respect to `B` and `tau` on each side
    of the threshold, and explain the one-for-one substitution in funding.
11. For the quadratic case, prove `k_M(tau_star)=n+B` and
    `dk_M/dtau=-1/(beta c)`.
12. Introduce a continuous sector distribution `G_s(tau)` and derive
    `lambda_s=1-G_s(tau_star)` rather than assuming `lambda_s` directly.

Recommended photographed check for the final-presentation slide: derive the
right slope `Pi'_+(n+B)=tau_star-tau`, show how its sign selects the regime,
and prove `k_M(tau_star)=n+B`. Then compare your proof with the Lean theorem
`access_below_threshold_iff`.
