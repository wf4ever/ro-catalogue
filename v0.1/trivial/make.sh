#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="trivial"

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"

echo "--------"

rm -rf .ro

$RO create -v "Frosty morning image" -d . -i RO-with-image

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .

echo "--------"

$RO list -v -a -d .

echo "--------"

$RO annotate -v 20120114-1156-405.jpg title "Trees on frosty morning"
$RO annotate -v 20120114-1156-405.jpg -g $TESTRO/metadata.rdf

$RO annotations -v 20120114-1156-405.jpg

echo "--------"

$RO annotations -v

# End.
