# Bank Credit Limits, Alternative Finance, and Firm Investment

**Track B — a model for an existing thesis · AI and Economic Modeling · UP 2026-II**

Public repository: <https://github.com/amchavezu/ai-project>. Course
requirements and deadlines: [project issue #7](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/7).

## Question

How does the cost of accessing alternative finance affect investment and
output for a firm facing a bank-credit limit?

Preliminary thesis evidence suggests that credit volume and a credit spread
contain different information across Peruvian sectors. That evidence motivates
the model, but the model does not claim to derive forecast accuracy, causality,
or exact forecast horizons.

## Model

A firm with internal funds \(n\) chooses capital \(k\), bank borrowing \(b\),
and alternative finance \(m\):

\[
\max_{k,b,m}\ \beta F(k)-R_Bb-(R_B+\tau)m
\quad\text{s.t.}\quad
k=n+b+m,\quad 0\le b\le \bar b,\quad m\ge0,
\]

where \(F'>0\) and \(F''<0\). Bank credit is cheaper but capped. The access
wedge \(\tau\ge0\) captures the extra cost of raising funds outside the bank.
Let \(\bar k=n+\bar b\) denote capital after the bank line is exhausted.

## Main result and conditions

Focus on a firm that would like to invest beyond its bank line at the bank
rate, so \(\beta F'(\bar k)>R_B\). Define the access-cost threshold

\[
\tau^*=\beta F'(\bar k)-R_B>0.
\]

- If \(\tau\ge\tau^*\), alternative finance is too expensive and
  \(k^*=\bar k\). Locally,
  \(\partial k^*/\partial\bar b=1\) and
  \(\partial k^*/\partial\tau=0\).
- If \(0\le\tau<\tau^*\), the firm finances the marginal unit outside the
  bank. Its optimum satisfies \(\beta F'(k^*)=R_B+\tau\), with
  \(k^*>\bar k\). Locally,
  \(\partial k^*/\partial\bar b=0\) and
  \(\partial k^*/\partial\tau=1/[\beta F''(k^*)]<0\).

Thus the bank limit determines real investment when access is sufficiently
costly. When access is sufficiently cheap, a larger bank line only substitutes
bank funding for alternative funding, while the marginal financing cost
determines investment.

For the quadratic specialization, the amount invested beyond the bank limit is

\[
k^*-\bar k
=\max\left\{0,\frac{\tau^*-\tau}{\beta c}\right\}.
\]

This expression shows both the threshold and the magnitude of the investment
response: a larger distance below \(\tau^*\) produces more additional capital,
while greater technological curvature \(c\) dampens the response.

## Sectoral extension

If firms in sector \(s\) draw access wedges from \(G_s(\tau)\), the model
endogenously determines the constrained share:

\[
\lambda_s=\Pr(\tau_i\ge\tau^*)=1-G_s(\tau^*).
\]

A sector whose distribution is shifted toward higher access costs contains
more firms whose investment is governed by bank-credit availability. This is a
testable composition hypothesis, not an assumption that every firm in a sector
uses the same financing regime.

## Status

| Component | Current state |
|---|---|
| Topic document and slides | Historical deliverable retained unchanged |
| Final slides | Rebuilt around the access-cost threshold; PDF compilation pending |
| Paper | Question, model, proposition, aggregation, and illustration revised |
| Verification | Threshold-specific symbolic and numerical checks pass; two CSV files reproduced |
| Lean | Threshold equivalence added to the quadratic prototype; full build check pending |
| Hand appendix | Step-by-step derivation guide present; handwritten scan pending |
| Workflow | Official template workflow retained unchanged |

The repository follows the official structure. Work is prepared on a branch
and will be merged through a pull request; only the merged `main` version is a
course submission.

All comparative statics are local to a strict regime. Observed credit volume
is only a proxy for the bank limit, and the measured spread is only a proxy for
the relevant marginal financing wedge.
