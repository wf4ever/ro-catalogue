#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="trivial"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs3 \
  -u "OpenID-1318340111490" \
  -p "2ae55d36-de48-444c-a" \
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

$RO annotations -v 20120114-1156-405.jpg

echo "--------"

# End.
