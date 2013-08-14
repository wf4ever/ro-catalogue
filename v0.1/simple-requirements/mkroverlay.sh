# !/usr/bin/env bash
#
# Test script to create Overlay URI for simple-requirements, and test basic responses.
#
# To riun server locally:
#
#   cd $RO_MANAGER/src/roverlay/rovweb
#   python manage.py runserver

RO_MANAGER=/Users/graham/workspace/wf4ever-ro-manager
ROV_BASE_URI=http://wf4ever.github.io/ro-catalogue/v0.1/simple-requirements
ROVERLAY_URI=http://localhost:8000/rovserver/

curl -i -v -X POST -H "Content-type: text/uri-list" --output 00-mkrov.html --data-binary @- $ROVERLAY_URI <<@EOF
$ROV_BASE_URI/checklist-runnable.rdf
$ROV_BASE_URI/data/UserRequirements-astro.ods
$ROV_BASE_URI/data/UserRequirements-bio.ods
$ROV_BASE_URI/data/UserRequirements-gen.ods
$ROV_BASE_URI/docs/mkjson.sh
$ROV_BASE_URI/docs/UserRequirements-astro.csv
$ROV_BASE_URI/docs/UserRequirements-astro.json
$ROV_BASE_URI/docs/UserRequirements-bio.csv
$ROV_BASE_URI/docs/UserRequirements-bio.json
$ROV_BASE_URI/docs/UserRequirements-gen.csv
$ROV_BASE_URI/docs/UserRequirements-gen.json
$ROV_BASE_URI/make.sh
$ROV_BASE_URI/minim-checklist.sh
$ROV_BASE_URI/python
$ROV_BASE_URI/python/ReadCSV.py
$ROV_BASE_URI/README
$ROV_BASE_URI/simple-requirements-minim.rdf
$ROV_BASE_URI/simple-requirements-wfdesc.rdf
$ROV_BASE_URI/simple-requirements-wfprov.rdf
$ROV_BASE_URI/TODO
@EOF


