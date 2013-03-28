#!/bin/bash
#

ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
CHECKLIST_URI=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation/Runnable-workflow-checklist.rdf

PACKID=$1

ROURI="$ROBASE/myexperiment_pack_$PACKID/"

echo "----- $PACKID :: $ROURI -----"
curl "http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json?RO=$ROURI&minim=$CHECKLIST_URI&purpose=wf-runnable"

# End.
