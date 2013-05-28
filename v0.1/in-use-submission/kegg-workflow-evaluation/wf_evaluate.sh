#!/bin/bash
#

ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
CHECKLIST_URI=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf
CHECKLIST_SERVICE="http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json"
CHECKLIST_SERVICE="http://localhost:8080/evaluate/trafficlight_json"

countpass=0
countfail=0
countall=0

while read PACK
  do
    # Split URI from following stuff separated by ','
    # For next, see: http://stackoverflow.com/a/6583589
    read URI OPT <<<$(IFS=","; echo $PACK)
    PACKID=$(cut -f 5 -d '/' <<<$(echo $URI))
    ROURI="$ROBASE/myexperiment_pack_$PACKID/"

    echo "----- $ROURI :: $OPT :: $PACKID -----"

    echo "RO evaluation run: $(date)" >00-evaluate-ROs.log

    if [ "${OPT:0:4}" != "skip" ]; then
      # checklist eval ...
      curl --silent \
           "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=wf-runnable" \
           >00-checklistresult.tmp
      result=$(python checklistresult.py <00-checklistresult.tmp)
      if [ $? == 0 ]; then
          countpass=$((countpass+1))
      else
          countfail=$((countfail+1))
      fi
      countall=$((countall+1))
      echo "$ROURI, $result"
    fi

  # done <Kegg-workflows-967.csv
  done <Kegg-workflows.csv

echo "Total pass: $countpass, fail: $countfail out of $countall"

# End.
