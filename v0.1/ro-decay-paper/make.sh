#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="ro-decay-paper"
TESTRO="$ROPATH/$RONAME"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs5 \
  -t "32801fc0-1df1-4e34-b" \
  -n "Test user" \
  -e "testuser@example.org"

$RO create -v "RO for the decay paper" -d $ROPATH/$RONAME -i $RONAME

$RO add -v -a -d $TESTRO

echo "--------"

$RO status -v -d $TESTRO

echo "--------"

$RO list -v -d $TESTRO

echo "--------"

$RO annotations 

echo "--------"