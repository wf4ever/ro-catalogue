# !/usr/bin/env bash
#
# Regenerate and commit updated Y3 demo checklist
#

echo "Building Y3demo-minim.ttl, Y3demo-minim.rdf ..."
mkminim -o turtle Y3demo-minim.xls >Y3demo-minim.ttl
mkminim -o xml Y3demo-minim.xls >Y3demo-minim.rdf
git add Y3demo-minim.xls Y3demo-minim.ttl Y3demo-minim.rdf

echo "Building Y3demo-minim-enhanced.ttl, Y3demo-minim-enhanced.rdf ..."
mkminim -o turtle Y3demo-minim-enhanced.xls >Y3demo-minim-enhanced.ttl
mkminim -o xml Y3demo-minim-enhanced.xls >Y3demo-minim-enhanced.rdf
git add Y3demo-minim-enhanced.xls Y3demo-minim-enhanced.ttl Y3demo-minim-enhanced.rdf

# git commit -m "Update Y3demo minim checklist"
# git checkout gh-pages
# git merge master
# git checkout master

echo "New minim files created"

git status
