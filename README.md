# Credit Quantity, Credit Prices, and Future Output

**Track B — a model for an existing thesis · AI and Economic Modeling · UP 2026-II**

Planned public repository: <https://github.com/amchavezu/ai-project>. Course
requirements and deadlines: [project issue #7](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/7).

## Question

Why might bank-credit quantity contain more forecasting information for
non-tradable activity at relatively short horizons, while a credit-price
spread becomes more informative for tradable activity over a longer horizon?
The empirical pattern is preliminary; this project builds a conditional
mechanism rather than asserting exact forecast peaks or causality.

## Model

A firm with internal funds \(n\) chooses capital \(k\), bank borrowing \(b\),
and outside finance \(m\):

\[
\max_{k,b,m}\ \beta F(k)-R_Bb-R_Mm
\quad\text{s.t.}\quad
k=n+b+m,\quad 0\le b\le \bar b,\quad m\ge0,
\]

where \(F'>0\), \(F''<0\), and \(R_B\le R_M\). Bank credit is relatively
cheap but capped. Firms differ in whether outside finance is available and in
its access wedge. The quadratic specialization is
\(F(k)=ak-ck^2/2\), with \(a,c>0\).

## Main result and conditions

Let \(\bar k=n+\bar b\), and let \(k_B\) and \(k_M\) solve
\(\beta F'(k_B)=R_B\) and \(\beta F'(k_M)=R_M\).

- **Quantity regime:** if \(k_M<\bar k<k_B\), then \(k^*=\bar k\), so
  \(\partial k^*/\partial\bar b=1\) and a sufficiently small common-spread
  change has zero local effect on capital.
- **Price regime:** if \(\bar k<k_M\), then \(k^*=k_M\), so a larger bank line
  substitutes bank for market finance without changing capital, while
  \(\partial k^*/\partial z=1/[\beta F''(k_M)]<0\).
- **Sector ranking:** under common conditional primitives and
  \(0\le\lambda_T<\lambda_N\le1\), where \(\lambda_s\) is the share of firms
  in the quantity regime, non-tradables are more quantity-sensitive and
  tradables are more price-sensitive.

These are local, regime-specific comparative statics. They do not establish
that the composition assumption holds in Peru, that the measured spread is a
causal shock, or that the model identifies exact forecasting horizons.

## Status

| Component | State on the topic-presentation branch |
|---|---|
| Topic document and slides | Complete; compiled PDFs visually checked (3 pages and 9 slides) |
| Final slides | Substantive work-in-progress deck, not the final submission |
| Paper | Full draft with assumptions, FOCs, proofs, mechanisms, limitations, and appendices |
| Verification | `python code/verify.py` checks the algebra and numerical illustration and writes a CSV |
| Lean | Direct no-`sorry` prototype for the quadratic core; required AppliedModelingLib run pending |
| Hand appendix | Step-by-step derivation guide present; handwritten scan pending |
| Workflow | Official template workflow retained unchanged |

The repository follows the official structure. Work is prepared on a branch
and will be merged through a pull request; only the merged `main` version is a
course submission.
