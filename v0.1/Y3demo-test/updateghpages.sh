# !/usr/bin/env bash
#
# Regenerate and commit updated Y3 demo checklist
#

git checkout gh-pages
git merge master
git checkout master
echo "'git push' to publish updated gh-pages to github"

