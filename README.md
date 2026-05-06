# tidal-algo-set-mark

`tidal-algo-set-mark` is a OCaml project in algorithms. Its focus is to package an OCaml local lab for set analysis with seeded input scenarios, deterministic summary checks, and documented operating limits.

## Problem It Tries To Make Smaller

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Tidal Algo Set Mark Review Notes

`recovery` and `stress` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## Working Pieces

- `fixtures/domain_review.csv` adds cases for input width and search depth.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/tidal-algo-set-walkthrough.md` walks through the case spread.
- The OCaml code includes a review path for `complexity` and `search depth`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Design Notes

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The OCaml addition stays small enough to inspect in one sitting.

## Example Run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

The check exercises the source code and the review fixture. `recovery` is the high score at 277; `stress` is the low score at 161.

## Known Limits

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
