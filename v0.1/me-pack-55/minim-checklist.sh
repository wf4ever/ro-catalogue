#!/bin/bash
#
# RO manager checklist sample script
#

source ../../ro.sh

RONAME="me-pack-55"
TESTRO="$ROPATH/$RONAME"

echo "--------"

$RO evaluate checklist -d $TESTRO -a me-pack-55-runnable.rdf "Runnable" $TESTRO/

echo "--------"

$RO evaluate checklist -d $TESTRO -a me-pack-55-replicable.rdf "Replicable" $TESTRO/

echo "--------"

#$RO evaluate checklist -v -d $TESTRO -a me-pack-55-minim.rdf "Repeatable" $TESTRO/

echo "--------"

#echo "--------"

#echo "--------"

# End.
