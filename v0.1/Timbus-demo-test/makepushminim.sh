# !/usr/bin/env bash
#
# Regenerate and commit updated Timbus demo checklist
#

mkminim -o turtle Timbus-demo-minim.xls >Timbus-demo-minim.ttl
mkminim -o xml Timbus-demo-minim.xls >Timbus-demo-minim.rdf
git add Timbus-demo-minim.xls Timbus-demo-minim.ttl Timbus-demo-minim.rdf
git commit
git checkout gh-pages
git merge master
git checkout master
git status
echo "'git push' to publish in github"
