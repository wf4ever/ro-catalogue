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

# End.
