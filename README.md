# tidal-algo-set-mark

`tidal-algo-set-mark` packages a practical algorithms exercise in OCaml. The emphasis is on deterministic behavior, a small public API, and examples that explain the tradeoffs.

## How I Read Tidal Algo Set Mark

The useful thing to inspect here is how the same score rule is represented in code, metadata, and examples. If those three pieces disagree, the audit script should make the drift visible.

## Problem Shape

I use this kind of project to make a rule visible before adding more machinery around it. The important part here is not the size of the codebase. It is that the input signals, scoring rule, fixture data, and expected output can all be checked in one sitting.

## Internal Model

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps input shape, complexity tradeoffs, and golden cases in one explicit decision path. The threshold is 151, with risk penalty 5, latency penalty 3, and weight bonus 3. The OCaml implementation keeps the data record and functions small enough to load directly in the test file.

## Scenario Walkthrough

`examples/extended_cases.csv` adds six named cases. I kept the names plain so failures are easy to read in a terminal: baseline, pressure, surge, degraded, recovery, and boundary.

## Main Behaviors

- Uses fixture data to keep complexity tradeoffs changes visible in code review.
- Includes extended examples for golden cases, including `recovery` and `degraded`.
- Documents boundary checks tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.

## Run It Locally

Install OCaml and run the commands from the repository root. The project does not need credentials or a hosted service.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Repository Map

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Known Edges

The examples cover useful edges, not every edge. A larger version would add malformed-input tests, richer reports, and deeper domain parsers.

## Follow-Up Work

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more algorithms fixture that focuses on a malformed or borderline input.

## How To Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.
