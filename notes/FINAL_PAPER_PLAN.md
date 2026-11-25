# Final paper work plan

Updated: 2026-11-12 (Lima)

Official deadline: **Thursday 2026-11-26, 22:00 Lima**. What counts is the
complete repository merged into `main` by that time.

## Starting point

- The paper compiles to 12 pages in total. The body runs from the title through
  the conclusion and occupies 9 pages, meeting the 8--20 page requirement.
- The firm problem, four-case policy lemma, access-threshold proposition,
  complete paper proof, sectoral aggregation, numerical illustration,
  limitations, and conclusion are already in place.
- `code/verify.py` passes and reproduces the two CSV outputs used by the paper
  and final presentation.
- The current PDF has been rendered page by page and has no visible clipping,
  overlap, broken tables, or unreadable symbols.
- The final-presentation deck and the corrected handwritten threshold
  derivation are already merged on `main`.
- The professor's presentation feedback has now been recovered from the
  meeting transcript. The final paper adds reproducible figures for the cutoff,
  the kink, shifts in `bbar`, `a`, and `c`, and a two-sector/two-date exercise
  with different sectoral `beta` values. The optional continuous-time and
  general-equilibrium ideas are recorded as disciplined extensions rather than
  presented as identified results.

## Critical path

1. **Freeze the mathematical paper.** Incorporate presentation feedback,
   tighten the positioning claim, and make the computational verification map
   explicit. Avoid changing numbered results after the Lean run begins.
2. **Complete the handwritten appendix.** Re-derive every step listed in
   `hand/DERIVATION_GUIDE.md`, scan it legibly, and add a short index in
   `hand/README.md` mapping pages to the paper's equations and results.
3. **Run the official Lean workflow.** Pin the frozen `paper/paper.pdf` to a
   merged commit, run the AppliedModelingLib paper-formalization workflow, copy
   the entire generated paper folder into `lean/`, and obtain a clean
   paper-scoped `check --fast` result.
4. **Close the appendices.** Replace every outdated Lean status with the exact
   declaration, file, formalized paper commit, and check result. Update the AI
   collaboration log and append the remaining raw exchanges to `prompts.md`.
5. **Submission audit.** Re-run `code/verify.py`, compile all four PDFs on a
   clean environment, render and inspect `paper/paper.pdf`, check the repository
   structure, open a pull request, and merge only after CI is green.

## Schedule

| Date | Target |
|---|---|
| Nov 12--14 | Content audit, feedback incorporation, literature and claim check |
| Nov 15--17 | Paper freeze and first official Lean run |
| Nov 18--20 | Repair Lean gaps; complete handwritten derivations |
| Nov 21--22 | Finalize appendices, prompts log, README, and references |
| Nov 23--24 | Full numerical, Lean, LaTeX, and visual QA |
| Nov 25 | Open final PR; resolve CI or review issues |
| Nov 26, before 18:00 | Merge to `main`, leaving a four-hour safety margin |

## Definition of done

- `paper/paper.tex`, `references.bib`, and the committed `paper/paper.pdf` agree.
- The body remains between 8 and 20 pages; references and appendices follow.
- Every numbered result has a complete paper proof and an honest Lean status.
- `code/verify.py` reproduces the underlying data, checks every number used in
  the native PGFPlots figures, and fails on claim violations.
- `hand/` contains legible, step-by-step derivations with conditions checked at
  the point where they are used.
- `lean/` is the complete generated folder for the submitted working-tree
  snapshot, with no proof holes and a recorded `check --fast` result.
- Both presentation decks, the proposal, code, prompts, README, and all four
  compiled PDFs remain in the repository.
- The final GitHub Actions run on `main` is green before 22:00 Lima.

## Current handoff state

- The AppliedModelingLib `check --fast` run passed on November 17, 2026.
  Commit `20a1f28` records the checked model and results.
- The numerical verification passes, and the native PGFPlots/TikZ figures and
  compiled paper and slides have been visually inspected.
- The student's ten-page handwritten appendix is saved as
  `hand/manual_derivation.pdf`. The numerical checks remain in
  `code/verify.py`.
