# !/usr/bin/env bash
#
# Commit updated Y3 demo checklist on current branch and gh-pages branch
#

git commit -m "Update Y3demo minim checklist"
git checkout gh-pages
git merge master
git checkout master
git status

echo "'git push' to publish updated gh-pages to github"
