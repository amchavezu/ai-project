# Compliance audit against course issue #7

## Reformulation v2 for the final presentation — updated 2026-10-27

The final-presentation branch now uses one continuous access wedge `tau` and
the endogenous threshold
`tau_star = beta F'(n+B) - R_B`. The sectoral mapping is postponed until after
the firm problem and uses distributions `G_s(tau)` rather than assigning binary
firm types directly.

| Final-presentation requirement | V2 evidence | Current status |
|---|---|---|
| Question and conditional answer | `README.md`; final slides 2 and 6 | Complete in source |
| Model and timing | final slide 4; `paper/paper.tex`, Environment | Complete in source |
| Proposition with all conditions | final slides 5–6; Proposition 1 | Complete in source |
| Proof: done, hard, open | final slide 7 | Complete in source |
| Simulations and their limits | final slides 9 and 12; `code/verify.py` | Checks pass |
| Lean statement and proof fragment | final slides 13--14; prototype Lean file | Source present; complete AppliedModelingLib build remains a final-paper task |
| AI skepticism and hand derivation | final slide 15; `hand/threshold_derivation.jpeg` | Corrected handwritten derivation inserted in source |
| Two or three critique questions | final slide 16 | Complete in source |
| Compiled `slides/final.pdf` | 17-page PDF rebuilt by CI with the handwritten scan; visual inspection complete | Complete |
| Submission state | branch `final-presentation-reformulation` | Pull request and merge to `main` pending |

Audited on 2026-10-06 against the official project issue and presentation
schedule.

## Topic presentation — due before 2026-10-07 07:30 (Lima)

| Requirement | Evidence | Status |
|---|---|---|
| Track and question | `proposal/proposal.tex`, section 1; topic slides 2–3 | Complete |
| Baseline/model gap and agent problem | proposal section 2; topic slides 4–5 | Complete |
| Expected FOC/result | proposal section 3; topic slides 6–7 | Complete |
| Why it is not already solved, including closest versions/appendices | proposal section 4; topic slide 8; `notes/LITERATURE_NOTES.md` | Complete, with novelty claim narrowed |
| Plan and risks | proposal section 5; topic slide 9 | Complete |
| Proposal length 2–4 pages | `proposal/proposal.pdf` is 3 pages | Complete |
| 20-minute deck; same five points in order | `slides/topic.pdf` is 9 slides | Complete |
| Repository link on title slide | Planned `github.com/amchavezu/ai-project` | Source complete; remote pending authentication |
| No animations or paper screenshots; equations in LaTeX | `slides/topic.tex` | Complete |
| Public repository named `ai-project`, started from official template | Local repository is cloned from `alexanderquispe/ai-project-template` | Local complete; public remote pending |
| Branch → pull request → merge to `main` | Current branch: `topic-presentation` | Branch complete; PR/merge pending remote |
| Comment course issue with public URL | Requires public remote | Pending remote |

Presentation slot: **Wednesday 2026-10-07, 07:30–07:50 Lima**.

## Required repository structure

| Path | Status |
|---|---|
| `README.md` | Project-specific one-page description and conditions |
| `proposal/proposal.tex`, `proposal.pdf` | Present |
| `slides/topic.tex`, `topic.pdf` | Present |
| `slides/final.tex`, `final.pdf` | Substantive work-in-progress present |
| `paper/paper.tex`, `references.bib`, `paper.pdf` | Present; paper has 8 body pages plus appendices/references |
| `code/verify.py`, `requirements.txt` | Present; checks pass and CSV is reproduced |
| `lean/` | Honest direct prototype present; final AppliedModelingLib folder pending |
| `hand/` | Derivation guide present; required handwritten scans pending |
| `prompts.md` | Raw current exchange present; one earlier assistant answer disclosed as unavailable |
| `.github/workflows/build.yml` | Official template file unchanged |

## Final deliverables still pending

- Final presentation: **2026-10-28, 07:30–08:15 Lima**.
- Final paper: **2026-11-26, 22:00 Lima**.
- Run AppliedModelingLib on the exact merged paper commit, copy the entire
  generated folder, obtain a clean paper-scoped `check --fast`, and update the
  paper's declaration table.
- Write and scan every handwritten derivation following
  `hand/DERIVATION_GUIDE.md`.
- Export and append any additional raw substantive AI exchanges.
- Confirm the GitHub Actions build is green after the pull request is merged.

## Claim discipline adopted in this revision

- Exact 3-, 6-, and 12-month peaks are not asserted in the proposal, slides,
  README, abstract, introduction, mechanism, or conclusion.
- Thesis evidence is described as preliminary and qualitative: relatively
  short horizons for quantity/non-tradables versus a longer horizon for the
  price/tradables pattern.
- Forecasting evidence is not called causal.
- The tradable/non-tradable sector pattern is not claimed as new; Müller and
  Verner (2024) is identified as the closest sectoral paper.
- Novelty is limited to the explicit capped-bank versus marginal-outside-finance
  model and its quantity-versus-price sectoral sensitivity ranking.
