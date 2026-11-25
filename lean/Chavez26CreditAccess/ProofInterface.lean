import Chavez26CreditAccess.PaperInterface
import Chavez26CreditAccess.MainTheorems

/-!
# Proof Interface: Credit Access, Firm Investment, and Future Output

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace Chavez26CreditAccess

theorem four_case_policy_optimal_realizes_spec :
    fourCasePolicyOptimalSpec := by
  simpa only [fourCasePolicyOptimalSpec] using
    @paper_four_case_policy_optimal

theorem access_threshold_investment_output_realizes_spec :
    accessThresholdInvestmentOutputSpec := by
  simpa only [accessThresholdInvestmentOutputSpec] using
    @paper_access_threshold_investment_output

end Chavez26CreditAccess
