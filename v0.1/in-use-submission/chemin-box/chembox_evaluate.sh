#!/bin/bash
#

USE_SERVICE="ANDROS-SANDBOX"

if [ "$USE_SERVICE" == "ESKARINA" ]; then
  CHECKLIST_SERVICE=http://localhost:8080/evaluate/trafficlight_json
  ROBASE=file:///usr/workspace/wf4ever-ro-catalogue/v0.1/
  RONAME=minim-evaluation
  echo "Using local evaluation of $ROBASE"
fi
if [ "$USE_SERVICE" == "SANDBOX" ]; then
  CHECKLIST_SERVICE=http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json
  ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
  RONAME=minim-evaluation
  echo "Using sandbox evaluation of $ROBASE"
fi
if [ "$USE_SERVICE" == "ANDROS" ]; then
  CHECKLIST_SERVICE=http://andros.zoo.ox.ac.uk:8080/evaluate/trafficlight_json
  ROBASE=file:///home/graham/Workspace/wf4ever/ro-catalogue/v0.1
  RONAME=minim-evaluation
  echo "Using andros-based evaluation of $ROBASE"
fi
if [ "$USE_SERVICE" == "ANDROS-SANDBOX" ]; then
  CHECKLIST_SERVICE=http://andros.zoo.ox.ac.uk:8080/evaluate/trafficlight_json
  ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs
  RONAME=minim-evaluation-1
  echo "Using andros-based evaluation of $ROBASE"
fi

echo "CHECKLIST_SERVICE: $CHECKLIST_SERVICE"
echo "ROBASE:            $ROBASE"
echo "RONAME:            $RONAME"

if [ "$CHECKLIST_SERVICE" == "" ]; then
  echo "Set USE_SERVICE to ESKARINA, SANDBOX or ANDROS (was $USE_SERVICE)"
  echo "Exitting..."
  exit 2
fi

ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
ROURI=$ROBASE/$RONAME
CHECKLIST_URI=$ROBASE/$RONAME/chembox-minim-samples.ttl

countpass=0
countfail=0
countall=0

while read TARGET
  do
    # Escape '%' in URI used as parameter in URI.
    TARGETESC=${TARGET//%/%25}
    echo "----- $ROURI :: $TARGET :: $TARGETESC -----"
    echo "RO evaluation run: $(date)" >00-evaluate-ROs.log

    if [ "${OPT:0:4}" != "skip" ]; then
      # checklist eval ...
      # result=$(curl --silent \
      #       "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGETESC" \
      #     | python checklistresult.py)
      curl --silent "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGETESC" \
           >00-checklistresult.tmp
      result=$(cat 00-checklistresult.tmp | python checklistresult.py)
      # @@TODO: count results for individual checklist items
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
  # done <chembox-uris-test.txt
  done <chembox-uris-100.txt

echo "Total pass: $countpass, fail: $countfail out of $countall"

# End.
