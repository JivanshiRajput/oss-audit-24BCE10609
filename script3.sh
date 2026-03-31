#!/bin/bash
# Script 3: Git Repository Analyser
# Author: Jivanshi Rajput | Reg: 24BCE10609

REPO_DIR=${1:-"."}

if [ ! -d "$REPO_DIR/.git" ]; then
  echo "Error: $REPO_DIR is not a git repository."
  exit 1
fi

cd "$REPO_DIR"
echo "======================================"
echo "   Git Repository Analysis Report"
echo "   Jivanshi Rajput | 24BCE10609"
echo "======================================"
echo "Repo Path      : $(pwd)"
echo "Total Commits  : $(git rev-list --count HEAD 2>/dev/null || echo 0)"
echo "Active Branch  : $(git branch --show-current)"
echo "Remote Origin  : $(git remote get-url origin 2>/dev/null || echo 'none')"
echo ""
echo "--- Top 5 Contributors ---"
git log --format='%an' | sort | uniq -c | sort -rn | head -5
echo ""
echo "--- Last 3 Commits ---"
git log --oneline -3
