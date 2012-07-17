#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="anni-golden-exemplar"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs5 \
  -n "https://me.yahoo.com/grahamklyne#734de" \
  -t "faeb3ffd-20c5-4ef2-a" \
  -e "testuser@example.org"
  # These credentials work
  #-t "47d5423c-b507-4e1c-8" \
  #-n "Test User" \

echo "--------"

rm -rf .ro

$RO create -v "Anno Golden Exemplar" -d . -i anni-golden-exemplar

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .

echo "--------"

$RO list -v -a -d .

echo "--------"

$RO annotate -v showcase62a_wf-withMulitipleBPCUIs.t2flow title "Anni golden exemplar main workflow"

#$RO annotate -v 20120114-1156-405.jpg title "Golden exemplay anni workflow"

#$RO annotations -v 

echo "--------"

$RO annotations -v

# End.
