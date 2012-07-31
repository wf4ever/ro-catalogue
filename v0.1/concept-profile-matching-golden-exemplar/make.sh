#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

# Fail on first error
set -e

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

# Make wfdesc from t2flow
pushd Workflows
    ../../../lib/scufl2-wfdesc/bin/scufl2-to-wfdesc *t2flow 
    # Move away, we don't want to aggregate these annotation bodies
    # as ro:Resources
    mv *wfdesc.ttl ../.ro/
    for t2flow in *t2flow ; do
        $RO annotate -v $t2flow -g ../.ro/$(echo $t2flow|sed s/.t2flow$/.wfdesc.ttl/)
        $RO annotate -v $t2flow rdf:type 'http://purl.org/wf4ever/wfdesc#Workflow'
    done
popd

echo "--------"
pushd Datasets
    for data in * ; do
        $RO annotate -v $data rdf:type 'http://purl.org/wf4ever/wf4ever#Dataset'
    done
popd
echo "--------"
pushd Documents
    for doc in * ; do
        $RO annotate -v $doc rdf:type 'http://purl.org/wf4ever/wf4ever#Document'
    done
popd
echo "--------"
pushd Workflow-runs
    for run in *run*rdf ; do
        $RO annotate -v $run rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
    done
popd

#$RO annotate -v showcase62a_wf-withMulitipleBPCUIs.t2flow title "Anni golden exemplar main workflow"
#$RO annotate -v showcase62a_wf-withMulitipleBPCUIs.t2flow title "Anni golden exemplar main workflow"

$RO annotate -v . -g ro_annotation.rdf

echo "--------"

$RO annotations -v

# End.

