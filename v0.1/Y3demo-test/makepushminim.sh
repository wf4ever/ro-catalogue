# !/usr/bin/env bash
#
# Regenerate and commit updated Y3 demo checklist
#

mkminim -o turtle Y3demo-minim.xls >Y3demo-minim.ttl
mkminim -o xml Y3demo-minim.xls >Y3demo-minim.rdf
git add Y3demo-minim.xls Y3demo-minim.ttl Y3demo-minim.rdf
git commit -m "Update Y3demo minim checklist"
git checkout gh-pages
git merge master
git checkout master
git status
echo "'git push' to publish in github"
