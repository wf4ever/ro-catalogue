#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="mkminim-documentation-example"
TESTRO="$ROPATH/$RONAME"

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"

rm .ro/*

$RO create -v "MkMinim documentation example RO" -d $ROPATH/$RONAME -i $RONAME

$RO add -a -d $TESTRO

echo "--------"

$RO status -v -d $TESTRO

echo "--------"

$RO list -v -d $TESTRO

echo "--------"

$RO annotate . -g $TESTRO/FileAnnotations.ttl
$RO annotations

echo "--------"

#./ro annotations -v $ROBASE/test-create-RO/subdir1/subdir1-file.txt

#echo "--------"

#echo "--------"

# End.
