#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="${1:-ngo-connect-live-demo}"
OWNER="harypalkar"
VISIBILITY="${VISIBILITY:-public}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required" >&2
  exit 1
fi
if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required. Install it, then run: gh auth login" >&2
  exit 1
fi

CURRENT_LOGIN="$(gh api user --jq .login)"
if [[ "$CURRENT_LOGIN" != "$OWNER" ]]; then
  echo "GitHub CLI is authenticated as '$CURRENT_LOGIN', not '$OWNER'." >&2
  echo "Run 'gh auth switch -u $OWNER' or 'gh auth login' and retry." >&2
  exit 1
fi

if [[ ! -d .git ]]; then
  git init -b main
fi

git add README.md index.html vercel.json .gitignore publish-to-harypalkar.sh
git -c user.name="Harish Palkar" -c user.email="palkarharish02@gmail.com" \
  commit -m "Initial NGO Connect live demo" || true

if gh repo view "$OWNER/$REPO_NAME" >/dev/null 2>&1; then
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$OWNER/$REPO_NAME.git"
else
  gh repo create "$OWNER/$REPO_NAME" "--$VISIBILITY" \
    --description "NGO Connect — interactive NGO management and transparency live demo" \
    --source . --remote origin
fi

git push -u origin main

echo "Published: https://github.com/$OWNER/$REPO_NAME"
