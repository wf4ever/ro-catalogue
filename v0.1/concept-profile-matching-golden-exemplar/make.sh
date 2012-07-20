#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh.kmh-kmhettne

#Should not be needed if above shell is run
#ROBASE=~/Projects/ro-catalogue/v0.1 
#RO=~/Projects/ro-manager/src/ro 

TESTRO="."
RONAME="concept-profile-matching-golden-exemplar"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs5 \
  -n "https://www.google.com/accounts/o8/id?id=AItOawl4I-H_ask7ollkwUzMrjTDrgD2oj_Qu2Q" \
  -t "a5c489aa-b413-47ad-b" \
  -e "k.m.hettne@lumc.nl"

echo "--------"

rm -rf .ro

$RO create -v "Concept Profile Matching Golden Exemplar" -d . -i concept-profile-matching-golden-exemplar

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .

echo "--------"

$RO list -v -a -d .

echo "--------"

#$RO annotate -v showcase62a_wf-withMulitipleBPCUIs.t2flow title "Anni golden exemplar main workflow"

$RO annotate -v . -g ro_annotation.rdf

echo "--------"

$RO annotations -v

# End.

