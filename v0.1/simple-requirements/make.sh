#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="simple-requirements"
TESTRO="$ROPATH/$RONAME"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs3 \
  -u "OpenID-1318340111490" \
  -p "2ae55d36-de48-444c-a" \
  -n "Test user" \
  -e "testuser@example.org"

rm .ro/*

$RO create -v "Simple requirements RO" -d $ROPATH/$RONAME -i $RONAME

$RO add -v -a -d $TESTRO

#for F in \
#    data/UserRequirements-astro.ods \
#    data/UserRequirements-bio.ods   \
#    data/UserRequirements-gen.ods   \
#do
#    $RO add -v -d $ROBASE/wf4ever-requirements/ $ROBASE/wf4ever-requirements/$F
#done

echo "--------"

$RO status -v -d $TESTRO

echo "--------"

$RO list -v -d $TESTRO

echo "--------"

$RO annotations

echo "--------"

$RO annotate -v $TESTRO/simple-requirements-wfdesc.rdf type "workflow-description"
$RO annotate -v $TESTRO/simple-requirements-wfprov.rdf type "workflow-run-provenance"
$RO annotate -v $TESTRO/simple-requirements-minim.rdf type "minim"

$RO annotate -v docs/mkjson.sh -g $TESTRO/simple-requirements-wfdesc.rdf
$RO annotate -v docs/UserRequirements-gen.json   -g $TESTRO/simple-requirements-wfprov.rdf
$RO annotate -v docs/UserRequirements-astro.json -g $TESTRO/simple-requirements-wfprov.rdf
$RO annotate -v docs/UserRequirements-bio.json   -g $TESTRO/simple-requirements-wfprov.rdf

$RO annotations

echo "--------"

#./ro annotations -v $ROBASE/test-create-RO/subdir1/subdir1-file.txt

#echo "--------"

#echo "--------"

# End.
