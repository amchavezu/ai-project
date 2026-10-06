# Lean status

`prototype/` contains a direct Lean 4 formalization of the quadratic core. It
proves the target-capital algebra, kink and market-regime optimality identities,
the output comparative statics, and the two sectoral sensitivity inequalities
without `sorry`.

This is **not yet** the course's final Lean deliverable. For the final paper:

1. merge and pin the paper PDF to a commit;
2. run the paper-formalization workflow from an up-to-date AppliedModelingLib
   clone against that exact commit;
3. run `python3 scripts/paper_contribution.py check <folder> --fast`;
4. replace this prototype with the entire generated paper folder, respecting
   its generated `.gitignore`;
5. update the declaration map in the paper appendix.

Current status: direct prototype available; AppliedModelingLib folder, pinned
paper commit, and `check --fast` output pending.
