#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="WingsProvenanceExample"
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

$RO create -v "Wings provenance example" -d $ROPATH/$RONAME -i $RONAME

$RO add -v -a -d $TESTRO

# echo "--------"

#$RO status -v -d $TESTRO

#echo "--------"

#$RO list -v -d $TESTRO

echo "--------"

$RO annotations

echo "--------"

$RO annotate -v $TESTRO/ type "Research object"
$RO annotate -v $TESTRO/ description "Wings provenance example"

###?? $RO annotate -v $TESTRO/bioaid_proteindiscovery_181667.wfdesc.ttl type "workflow-description"
###?? $RO annotate -v $TESTRO/wf74.wfprov.ttl type "workflow-run-provenance"

# Associate provenance with all output files
# The resource listings were created using makeresourcelists.sh

for wf in wf34; do

    for res in $(cat mainworkflow.txt); do
        $RO add -v -d $TESTRO $res
        $RO annotate -v -d $TESTRO -g ./$wf/template.rdf $res
        $RO annotate -v -d $TESTRO -g ./$wf/linking.rdf  $res
    done

    for res in $(cat subworkflows.txt); do
        $RO add -v -d $TESTRO $res
        $RO annotate -v -d $TESTRO -g ./$wf/template.rdf $res
        $RO annotate -v -d $TESTRO -g ./$wf/linking.rdf  $res
        $RO annotate -v -d $TESTRO -g ./$wf/process-generation.rdf $res
        $RO annotate -v -d $TESTRO -g ./$wf/process-usage.rdf      $res
    done

    for res in $(cat artifacts.txt); do
        $RO add -v -d $TESTRO $res
        $RO annotate -v -d $TESTRO -g ./$wf/linking-artifacts.rdf  $res
        $RO annotate -v -d $TESTRO -g ./$wf/process-generation.rdf $res
        $RO annotate -v -d $TESTRO -g ./$wf/process-usage.rdf      $res
        $RO annotate -v -d $TESTRO -g ./$wf/artifact.rdf          $res
        $RO annotate -v -d $TESTRO -g ./$wf/usage.rdf             $res
        $RO annotate -v -d $TESTRO -g ./$wf/generation.rdf        $res
    done

    for res in $(cat mainworkflowrun.txt); do
        $RO annotate -v -d $TESTRO -g ./$wf/wfexec.rdf $res
    done

    for res in $(cat processrun.txt); do
        $RO annotate -v -d $TESTRO -g ./$wf/linking-steps.rdf $res
    done

done

# ./wf34/template.rdf           # wfdesc - identifies workflow and sub-processes
# ./wf34/linking.rdf            # wfdesc - more workflows, with describedby...
# ./wf34/linkingArtifacts.rdf   # wfdesc - enumerates artifacts, with describedbyparameter for some
# ./wf34/processGeneration.rdf  # wfdesc - processes, parameters, artifacts
# ./wf34/processUsage.rdf       # wfdesc - processes, parameters, artifacts

# ./wf34/wfExec.rdf             #wfprov - identifies WorkflowRun
# ./wf34/linkingSteps.rdf       #wfprov - enumerates processes, with describedby...
# ./wf34/artifact.rdf           #wfprov - artifacts with file sizes
### These have processes typed as artifacts: surely not?
# ./wf34/usage.rdf              #wfprov - resource, artifact, with wasPartOfWorkflowRun, usedInput
# ./wf34/generation.rdf         #wfprov - resource, artifact, with wasPartOfWorkflowRun, wasOutputFrom

$RO annotations

echo "--------"

#./ro annotations -v $ROBASE/test-create-RO/subdir1/subdir1-file.txt

#echo "--------"

#echo "--------"

# End.
