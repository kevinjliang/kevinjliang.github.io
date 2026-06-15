#!/usr/bin/env bash
#
# Regenerate the downloadable CV PDF (files/Kevin_Liang_CV.pdf) from cv-pdf/cv.html.
#
# Workflow:
#   1. Edit cv-pdf/cv.html — it is the source of truth for the PDF.
#      (The publications there were derived from _includes/publications-list_selected.md;
#       update them by hand to keep curation control over what the PDF shows.)
#   2. Run this script.
#   3. Commit the updated cv-pdf/cv.html AND files/Kevin_Liang_CV.pdf, then push.
#
# IMPORTANT: run this from a real terminal (Terminal.app / iTerm), NOT from inside
# Claude Code's shell — headless Chrome cannot launch in that sandboxed context.
#
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
src="file://$repo_root/cv-pdf/cv.html"
out="$repo_root/files/Kevin_Liang_CV.pdf"

"$chrome" --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$out" "$src"

echo "Regenerated: $out"
