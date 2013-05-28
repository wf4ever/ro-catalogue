#!/bin/bash
#

USE_LOCAL="NO"

if [ "$USE_LOCAL" == "YES" ]; then
  CHECKLIST_SERVICE=http://localhost:8080/evaluate/trafficlight_json
  ROBASE=file:///usr/workspace/wf4ever-ro-catalogue/v0.1
  echo "Using local evaluation of $ROBASE (USE_LOCAL: $USE_LOCAL)"
fi

if [ "$USE_LOCAL" == "NO" ]; then
  CHECKLIST_SERVICE=http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json
  ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
  echo "Using sandbox evaluation of $ROBASE (USE_LOCAL: $USE_LOCAL)"
fi

echo "CHECKLIST_SERVICE: $CHECKLIST_SERVICE"
echo "ROBASE:            $ROBASE"

ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
RONAME=minim-evaluation-1
ROURI=$ROBASE/$RONAME
CHECKLIST_URI=$ROBASE/$RONAME/chembox-minim-samples.ttl

countpass=0
countfail=0
countall=0

while read TARGET
  do
    echo "----- $ROURI :: $TARGET -----"
    echo "RO evaluation run: $(date)" >00-evaluate-ROs.log

    if [ "${OPT:0:4}" != "skip" ]; then
      # checklist eval ...
      # result=$(curl --silent \
      #       "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGET" \
      #     | python checklistresult.py)
      curl "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGET" \
           >00-checklistresult.tmp
      result=$(cat 00-checklistresult.tmp | python checklistresult.py)
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

  # done <chembox-uris-tryptoline.txt
  # done <chembox-uris-dihydrothiazole.txt
  done <chembox-uris-test.txt
  # done <chembox-uris-100.txt

echo "Total pass: $countpass, fail: $countfail out of $countall"

# End.
