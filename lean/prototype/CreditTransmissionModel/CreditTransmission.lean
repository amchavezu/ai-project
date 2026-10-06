import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Credit quantity, credit prices, and future output

This file formalizes the quadratic specialization of a two-date firm problem.
A firm has internal funds, a cheap but capped bank loan, and (when accessible)
more expensive market finance. The paper's two central regimes are:

* a kink regime in which the bank-credit ceiling determines investment; and
* a market-finance regime in which the marginal financing price determines
  investment while the bank ceiling only changes financing composition.

The formalization proves the algebraic first-order conditions, global
optimality on both regimes, comparative statics, and the sector-composition
ordering used in the paper.
-/

namespace CreditTransmissionModel

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

/-- Marginal output response to a larger bank ceiling for a sector with share
`lambda` in the quantity regime. -/
def quantityMarginal (lambda a c n B : ℝ) : ℝ :=
  lambda * (a - c * (n + B))

/-- Absolute marginal output response to a common spread for a sector whose
share in the quantity regime is `lambda`. -/
def priceMagnitude (lambda β c RM : ℝ) : ℝ :=
  (1 - lambda) * (RM / (β ^ 2 * c))

theorem targetCapital_foc {β a c R : ℝ} (hβc : β * c ≠ 0) :
    β * (a - c * targetCapital β a c R) = R := by
  rcases mul_ne_zero_iff.mp hβc with ⟨hβ, hc⟩
  unfold targetCapital
  field_simp [hβ, hc]
  ring

theorem targetCapital_spread_shift {β a c R delta : ℝ} :
    targetCapital β a c (R + delta) =
      targetCapital β a c R - delta / (β * c) := by
  unfold targetCapital
  ring

theorem market_target_decreases {β a c R delta : ℝ}
    (hβ : 0 < β) (hc : 0 < c) (hdelta : 0 < delta) :
    targetCapital β a c (R + delta) < targetCapital β a c R := by
  rw [targetCapital_spread_shift]
  have hden : 0 < β * c := mul_pos hβ hc
  have hquot : 0 < delta / (β * c) := div_pos hdelta hden
  linarith

theorem bankProfit_target_sub (β a c RB n target k : ℝ)
    (hfoc : β * (a - c * target) = RB) :
    bankProfit β a c RB n target - bankProfit β a c RB n k =
      β * c / 2 * (k - target) ^ 2 := by
  unfold bankProfit output
  rw [← hfoc]
  ring

theorem marketProfit_target_sub (β a c RB RM n cap target k : ℝ)
    (hfoc : β * (a - c * target) = RM) :
    marketProfit β a c RB RM n cap target -
        marketProfit β a c RB RM n cap k =
      β * c / 2 * (k - target) ^ 2 := by
  unfold marketProfit output
  rw [← hfoc]
  ring

theorem bankProfit_cap_sub (β a c RB n cap k : ℝ) :
    bankProfit β a c RB n cap - bankProfit β a c RB n k =
      (cap - k) * (β * (a - c * cap) - RB) +
        β * c / 2 * (cap - k) ^ 2 := by
  unfold bankProfit output
  ring

theorem marketProfit_cap_sub (β a c RB RM n cap k : ℝ) :
    marketProfit β a c RB RM n cap cap -
        marketProfit β a c RB RM n cap k =
      (k - cap) * (RM - β * (a - c * cap)) +
        β * c / 2 * (k - cap) ^ 2 := by
  unfold marketProfit output
  ring

theorem financing_cost_continuous (β a c RB RM n cap : ℝ) :
    bankProfit β a c RB n cap = marketProfit β a c RB RM n cap cap := by
  unfold bankProfit marketProfit
  ring

/-- Global optimality of the bank-ceiling kink. The two slope assumptions are
exactly the paper's conditions `k_M ≤ cap ≤ k_B`, written without division. -/
theorem kink_regime_optimal {β a c RB RM n cap : ℝ}
    (hβ : 0 < β) (hc : 0 < c)
    (hleft : RB ≤ β * (a - c * cap))
    (hright : β * (a - c * cap) ≤ RM) :
    ∀ k : ℝ, totalProfit β a c RB RM n cap k ≤
      totalProfit β a c RB RM n cap cap := by
  intro k
  have hβc : 0 < β * c := mul_pos hβ hc
  by_cases hk : k ≤ cap
  · have hd : 0 ≤ cap - k := sub_nonneg.mpr hk
    have hslope : 0 ≤ β * (a - c * cap) - RB := sub_nonneg.mpr hleft
    have hfirst : 0 ≤ (cap - k) * (β * (a - c * cap) - RB) :=
      mul_nonneg hd hslope
    have hsecond : 0 ≤ β * c / 2 * (cap - k) ^ 2 := by positivity
    have hdiff : 0 ≤ bankProfit β a c RB n cap - bankProfit β a c RB n k := by
      rw [bankProfit_cap_sub]
      exact add_nonneg hfirst hsecond
    simpa [totalProfit, hk] using (sub_nonneg.mp hdiff)
  · have hk' : cap < k := lt_of_not_ge hk
    have hd : 0 ≤ k - cap := sub_nonneg.mpr (le_of_lt hk')
    have hslope : 0 ≤ RM - β * (a - c * cap) := sub_nonneg.mpr hright
    have hfirst : 0 ≤ (k - cap) * (RM - β * (a - c * cap)) :=
      mul_nonneg hd hslope
    have hsecond : 0 ≤ β * c / 2 * (k - cap) ^ 2 := by positivity
    have hdiff :
        0 ≤ marketProfit β a c RB RM n cap cap -
          marketProfit β a c RB RM n cap k := by
      rw [marketProfit_cap_sub]
      exact add_nonneg hfirst hsecond
    have hcont := financing_cost_continuous β a c RB RM n cap
    rw [← hcont] at hdiff
    simpa [totalProfit, hk] using (sub_nonneg.mp hdiff)

/-- Global optimality of the market-finance target when it lies strictly above
the bank ceiling. -/
theorem market_regime_optimal {β a c RB RM n cap target : ℝ}
    (hβ : 0 < β) (hc : 0 < c) (hcost : RB ≤ RM)
    (hcap : cap < target) (hfoc : β * (a - c * target) = RM) :
    ∀ k : ℝ, totalProfit β a c RB RM n cap k ≤
      totalProfit β a c RB RM n cap target := by
  intro k
  have hβc : 0 < β * c := mul_pos hβ hc
  have hslope : RB ≤ β * (a - c * cap) := by
    have hmp : β * (a - c * target) < β * (a - c * cap) := by
      nlinarith
    rw [hfoc] at hmp
    exact le_trans hcost (le_of_lt hmp)
  have htarget_not_le : ¬ target ≤ cap := not_le.mpr hcap
  by_cases hk : k ≤ cap
  · have hd : 0 ≤ cap - k := sub_nonneg.mpr hk
    have hslope' : 0 ≤ β * (a - c * cap) - RB := sub_nonneg.mpr hslope
    have hfirst : 0 ≤ (cap - k) * (β * (a - c * cap) - RB) :=
      mul_nonneg hd hslope'
    have hsecond : 0 ≤ β * c / 2 * (cap - k) ^ 2 := by positivity
    have hbank : bankProfit β a c RB n k ≤ bankProfit β a c RB n cap := by
      have hdiff : 0 ≤ bankProfit β a c RB n cap - bankProfit β a c RB n k := by
        rw [bankProfit_cap_sub]
        exact add_nonneg hfirst hsecond
      linarith
    have hmarket :
        marketProfit β a c RB RM n cap cap ≤
          marketProfit β a c RB RM n cap target := by
      have hsq : 0 ≤ β * c / 2 * (cap - target) ^ 2 := by positivity
      have hdiff := marketProfit_target_sub β a c RB RM n cap target cap hfoc
      linarith
    have hcont := financing_cost_continuous β a c RB RM n cap
    rw [hcont] at hbank
    simpa [totalProfit, hk, htarget_not_le] using hbank.trans hmarket
  · have hsq : 0 ≤ β * c / 2 * (k - target) ^ 2 := by positivity
    have hdiff := marketProfit_target_sub β a c RB RM n cap target k hfoc
    have hopt :
        marketProfit β a c RB RM n cap k ≤
          marketProfit β a c RB RM n cap target := by
      linarith
    simpa [totalProfit, hk, htarget_not_le] using hopt

theorem output_increment_identity (a c k delta : ℝ) :
    output a c (k + delta) - output a c k =
      delta * (a - c * k) - c * delta ^ 2 / 2 := by
  unfold output
  ring

/-- A sufficiently small expansion of a binding credit line raises output. -/
theorem quantity_output_gain {a c k delta : ℝ}
    (hdelta : 0 < delta)
    (hmargin : c * delta / 2 < a - c * k) :
    output a c k < output a c (k + delta) := by
  have hpos : 0 < delta * ((a - c * k) - c * delta / 2) :=
    mul_pos hdelta (sub_pos.mpr hmargin)
  rw [← sub_pos]
  rw [output_increment_identity]
  nlinarith

/-- Output is increasing between two capital stocks when average marginal
product is positive. -/
theorem output_lt_output_of_lt {a c k₁ k₂ : ℝ}
    (hk : k₁ < k₂) (havg : c * (k₁ + k₂) / 2 < a) :
    output a c k₁ < output a c k₂ := by
  have hfactor : 0 < (k₂ - k₁) * (a - c * (k₁ + k₂) / 2) :=
    mul_pos (sub_pos.mpr hk) (sub_pos.mpr havg)
  unfold output
  nlinarith

/-- A larger constrained share makes the sector more sensitive to bank-credit
quantity, provided marginal product at the ceiling is positive. -/
theorem quantity_sensitivity_order {lambdaN lambdaT a c n B : ℝ}
    (hlambda : lambdaT < lambdaN)
    (hmp : 0 < a - c * (n + B)) :
    quantityMarginal lambdaT a c n B < quantityMarginal lambdaN a c n B := by
  unfold quantityMarginal
  have hprod : 0 < (lambdaN - lambdaT) * (a - c * (n + B)) :=
    mul_pos (sub_pos.mpr hlambda) hmp
  nlinarith

/-- A larger constrained share makes the sector less sensitive in absolute
value to a common credit-spread shock. -/
theorem price_sensitivity_order {lambdaN lambdaT β c RM : ℝ}
    (hlambda : lambdaT < lambdaN)
    (hβ : 0 < β) (hc : 0 < c) (hRM : 0 < RM) :
    priceMagnitude lambdaN β c RM < priceMagnitude lambdaT β c RM := by
  unfold priceMagnitude
  have hden : 0 < β ^ 2 * c := mul_pos (sq_pos_of_pos hβ) hc
  have hcoef : 0 < RM / (β ^ 2 * c) := div_pos hRM hden
  have hshare : 1 - lambdaN < 1 - lambdaT := by linarith
  exact mul_lt_mul_of_pos_right hshare hcoef

end

end CreditTransmissionModel
