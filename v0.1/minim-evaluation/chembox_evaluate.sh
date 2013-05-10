#!/bin/bash
#

LOCAL=YES
if [ "$LOCAL"=="YES" ]; then
  CHECKLIST_SERVICE=http://localhost:8080/evaluate/trafficlight_json
  ROBASE=file:///usr/workspace/wf4ever-ro-catalogue/v0.1
  echo "Using local evaluation of $ROBASE"
else
  CHECKLIST_SERVICE=http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json
  ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
fi
ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
RONAME=minim-evaluation
ROURI=$ROBASE/$RONAME
CHECKLIST_URI=$ROBASE/$RONAME/chembox-minim-samples.ttl

countpass=0
countfail=0
countall=0

while read TARGET
  do
    echo "----- $ROURI :: $TARGET -----"
    echo "RO evaluation run: $(date)" >00-evaluate-ROs

    if [ "${OPT:0:4}" != "skip" ]; then
      # checklist eval ...
      result=$(curl --silent \
            "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGET" \
          | python checklistresult.py)
      # @@TODO: count results for individual checklist items
      # (or, just hack the 
      if [ $? == 0 ]; then
          countpass=$((countpass+1))
      else
          countfail=$((countfail+1))
      fi
      countall=$((countall+1))
      echo "$ROURI, $result"
    fi

  done <chembox-uris-sample.txt

echo "Total pass: $countpass, fail: $countfail out of $countall"

# End.
