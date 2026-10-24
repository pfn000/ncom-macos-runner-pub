# ncom-macos-runner-pub

Public GitHub Actions macOS runner lane for NCOM icon tooling, used while the private repo's free Actions
minutes are used up for the month. This repo is intentionally minimal:

- `.github/workflows/macrun-pub.yml` — a `workflow_dispatch` job on `macos-26` (or the newest available image)
- `scripts/ictool.sh` — runs `ictool --help`/`--version` and `icrtool --help`/`--version`

**What is NOT here, ever:** the `.dmg` tool itself, any Apple software, any token or credential beyond the
one narrow `DMG_KEY` repo secret used to decrypt a file that was already encrypted before it arrived.

**How a run works:** the box that drives this repo encrypts the dmg with AES-256 (openssl, PBKDF2) and keeps
only the ciphertext in a *private* Hugging Face dataset. Each run is dispatched with a short-lived (~1 hour)
signed download URL for that ciphertext as the `dmg_url` input; the runner downloads it, decrypts it with the
`DMG_KEY` secret (never logged — GitHub auto-masks secret values, and the URL itself is explicitly masked too),
mounts it read-only, runs the requested script, and uploads the plain-text output (e.g. `ictool --help`'s
text) as a 1-day artifact. Nothing proprietary is ever committed to this repo or printed in a public log.

Triggered and polled from `ops/macos/macrun_pub.py` on the operator's own box.
