# Failure Modes

For `tidal-algo-set-mark`, I would look first for these mistakes:

- `input width` cases moving lanes without a matching threshold change.
- `boundary pressure` scoring higher after drag increases.
- Duplicate fixture ids hiding a stale golden row.
- README examples drifting away from the verifier.

The local checks are intentionally strict about these cases.
