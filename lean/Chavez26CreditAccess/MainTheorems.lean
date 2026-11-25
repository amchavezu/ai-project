import Chavez26CreditAccess.Model

/-!
# Paper-Facing Theorems: Credit Access, Firm Investment, and Future Output

This file is the implementation theorem layer for the source paper. Keep
source-faithful definitions and theorem wrappers here, and expose only the
compact human-review subset in `PaperInterface.lean`.

During the statement-first phase, each exact paper-facing proposition lives in a
transparent `<name>Spec : Prop` declaration in `PaperInterface.lean`; the paired
theorem/lemma endpoint belongs in `ProofInterface.lean` and has exactly that
type. Add proof implementations here only after those specifications pass v11
raw-source-to-expanded-Spec review and recursive premise provenance audit. Before full closeout, the v11
realization audit independently binds pinned source atoms to the elaborated Spec
and accounts for the complete Lean closure; a proof hole or a declaration name
is never evidence for that correspondence.
-/

namespace Chavez26CreditAccess

/-- Paper result: the nested four-case rule is globally optimal over the
economically feasible domain. -/
theorem paper_four_case_policy_optimal {β a c RB RM n cap : ℝ}
    (hβ : 0 < β) (hc : 0 < c) (hcost : RB ≤ RM) (hncap : n ≤ cap) :
    ∀ k : ℝ, n ≤ k →
      totalProfit β a c RB RM n cap k ≤
        totalProfit β a c RB RM n cap
          (optimalCapital β a c RB RM n cap) :=
  four_case_policy_optimal hβ hc hcost hncap

/-- Paper result: the access threshold is equivalent to investment beyond the
bank ceiling; the policy is continuous at the threshold; a higher wedge lowers
the alternative-finance target; and a larger capital stock raises output on
the increasing branch of the quadratic technology. -/
theorem paper_access_threshold_investment_output
    {β a c RB cap τ : ℝ} (hβ : 0 < β) (hc : 0 < c) :
    (τ < accessThreshold β a c RB cap ↔
        cap < targetCapital β a c (RB + τ)) ∧
      targetCapital β a c (RB + accessThreshold β a c RB cap) = cap ∧
      (∀ {δ : ℝ}, 0 < δ →
        targetCapital β a c (RB + τ + δ) <
          targetCapital β a c (RB + τ)) ∧
      (∀ {k₁ k₂ : ℝ}, k₁ < k₂ → c * (k₁ + k₂) / 2 < a →
        output a c k₁ < output a c k₂) := by
  refine ⟨access_below_threshold_iff hβ hc,
    market_target_at_access_threshold hβ hc, ?_, ?_⟩
  · intro δ hδ
    exact market_target_decreases hβ hc hδ
  · intro k₁ k₂ hk havg
    exact output_lt_output_of_lt hk havg

end Chavez26CreditAccess
