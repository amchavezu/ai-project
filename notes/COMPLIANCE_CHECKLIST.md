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
| Lean statement and proof fragment | final slides 13--14; `lean/Chavez26CreditAccess/` | Complete package; focused builds and `check --fast` pass |
| AI skepticism and hand derivation | final slide 15; `hand/threshold_derivation.jpeg` | Corrected handwritten derivation inserted in source |
| Two or three critique questions | final slide 16 | Complete in source |
| Compiled `slides/final.pdf` | 17-page PDF rebuilt by CI with the handwritten scan; visual inspection complete | Complete |
| Submission state | pull request 2, merge commit `4838deb` | Merged to `main`; post-merge build passed |

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
| Repository link on title slide | `github.com/amchavezu/ai-project` | Present |
| No animations or paper screenshots; equations in LaTeX | `slides/topic.tex` | Complete |
| Public repository named `ai-project`, started from official template | `amchavezu/ai-project` | Repository exists |
| Branch → pull request → merge to `main` | Historical topic branch | Topic-delivery history closed |
| Comment course issue with public URL | [Course issue comment](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/7#issuecomment-6026307155) | Link posted |

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
| `lean/` | Complete `Chavez26CreditAccess` package and validation receipt present |
| `hand/` | Ten-page handwritten scan present at `hand/manual_derivation.pdf` |
| `prompts.md` | Raw current exchange present; one earlier assistant answer disclosed as unavailable |
| `.github/workflows/build.yml` | Official template file unchanged |

## Final handoff state

- Final presentation: **2026-10-28, 07:30–08:15 Lima**.
- Final paper: **2026-11-26, 22:00 Lima**.
- The paper-scoped AppliedModelingLib `check --fast` passed on November 17.
  Commit `20a1f28` records the model and results covered by that check.
- The handwritten appendix is in `hand/manual_derivation.pdf`. The numerical
  example is checked by `code/verify.py`.

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
