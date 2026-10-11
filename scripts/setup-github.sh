#!/usr/bin/env bash
# One-time setup: creates labels, milestones, and a GitHub Project with the
# fields the roadmap needs. Run from the repo root after pushing to GitHub.
#
# Usage:  scripts/setup-github.sh <owner> <repo> ["Project title"]
# Needs:  gh CLI, logged in with the "project" scope:
#           gh auth refresh -s project
set -euo pipefail

OWNER="${1:?usage: $0 <owner> <repo> [project title]}"
REPO="${2:?usage: $0 <owner> <repo> [project title]}"
TITLE="${3:-Robotics Roadmap}"

echo "==> Labels"
for l in task bug; do
  gh label create "$l" --repo "$OWNER/$REPO" --force >/dev/null
done

echo "==> Milestones"
for m in \
  "M1 Requirements & architecture frozen" \
  "M2 Subsystem prototypes" \
  "M3 First integration" \
  "M4 Autonomy v1" \
  "M5 Validation & freeze" \
  "M6 Delivery"; do
  gh api "repos/$OWNER/$REPO/milestones" -f title="$m" >/dev/null 2>&1 \
    || echo "   (milestone exists or failed: $m)"
done

echo "==> Project"
NUM=$(gh project create --owner "$OWNER" --title "$TITLE" --format json --jq '.number')
gh project link "$NUM" --owner "$OWNER" --repo "$REPO"

gh project field-create "$NUM" --owner "$OWNER" --name "Start date"  --data-type DATE >/dev/null
gh project field-create "$NUM" --owner "$OWNER" --name "Target date" --data-type DATE >/dev/null
gh project field-create "$NUM" --owner "$OWNER" --name "Subsystem" --data-type SINGLE_SELECT \
  --single-select-options "Mechanical,Electrical,Firmware,Software / Autonomy,Perception,Testing / Integration,Docs / Admin" >/dev/null

cat <<EOF

Project #$NUM created and linked to $OWNER/$REPO.

Still manual (GitHub's CLI/API can't do these yet):
  1. Add an Iteration field (Project -> Settings -> New field -> Iteration).
  2. Edit the Status field options to: Backlog, Ready, In progress, In review, Done.
  3. Create the views: Roadmap (Start=Start date, Target=Target date),
     Board, My work, Current sprint. See docs/project/workflow.md.
  4. Project -> Settings -> Workflows: turn on auto-add for this repo, and
     "item closed -> Done".
  5. Repo -> Settings -> Pages -> Source: GitHub Actions.
EOF
