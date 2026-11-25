import Mathlib.Data.Real.Basic

/-!
# Core definitions for the credit-access model

This module contains only the source-facing objects used in statement review.
Proof tactics and implementation theorems live behind `Model.lean`.
-/

namespace Chavez26CreditAccess

noncomputable section

/-- Concave quadratic date-one output from date-zero capital. -/
def output (a c k : ℝ) : ℝ := a * k - c * k ^ 2 / 2

/-- Present-value profit when the marginal unit is bank financed. -/
def bankProfit (β a c RB n k : ℝ) : ℝ :=
  β * output a c k - RB * (k - n)

/-- Present-value profit when the bank line is exhausted and the marginal unit
is market financed. `cap` is total capital at the bank-credit ceiling. -/
def marketProfit (β a c RB RM n cap k : ℝ) : ℝ :=
  β * output a c k - RB * (cap - n) - RM * (k - cap)

/-- Continuous piecewise profit schedule. -/
def totalProfit (β a c RB RM n cap k : ℝ) : ℝ :=
  if k ≤ cap then bankProfit β a c RB n k
  else marketProfit β a c RB RM n cap k

/-- The unconstrained capital target associated with gross marginal funding
cost `R` in the quadratic technology. -/
def targetCapital (β a c R : ℝ) : ℝ := (β * a - R) / (β * c)

/-- Maximum alternative-finance wedge at which the firm still wants to invest
beyond the bank-credit limit `cap`. -/
def accessThreshold (β a c RB cap : ℝ) : ℝ :=
  β * (a - c * cap) - RB

/-- Marginal output response to a larger bank ceiling for a sector with share
`lambda` in the quantity regime. -/
def quantityMarginal (lambda a c n B : ℝ) : ℝ :=
  lambda * (a - c * (n + B))

/-- Absolute marginal output response to a common spread for a sector whose
share in the quantity regime is `lambda`. -/
def priceMagnitude (lambda β c RM : ℝ) : ℝ :=
  (1 - lambda) * (RM / (β ^ 2 * c))

/-- The paper's four-region policy: internal funds, interior bank target,
bank-ceiling kink, or the alternative-finance target. -/
def optimalCapital (β a c RB RM n cap : ℝ) : ℝ :=
  let kB := targetCapital β a c RB
  let kM := targetCapital β a c RM
  if kB ≤ n then n
  else if kB ≤ cap then kB
  else if kM ≤ cap then cap
  else kM

end

end Chavez26CreditAccess
