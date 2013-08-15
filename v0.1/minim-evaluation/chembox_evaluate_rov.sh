#!/bin/bash
#

USE_SERVICE="ANDROS"

if [ "$USE_SERVICE" == "ESKARINA" ]; then
  CHECKLIST_SERVICE=http://localhost:8080/evaluate/trafficlight_json
  ROVERLAY_SERVICE=http://localhost:8000/rovserver/
  CHECKLIST_URI=file:///usr/workspace/wf4ever-ro-catalogue/v0.1/minim-evaluation/chembox-minim-samples.ttl
  echo "Using local roverlay service at $ROVERLAY_SERVICE"
fi
if [ "$USE_SERVICE" == "SANDBOX" ]; then
  CHECKLIST_SERVICE=http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json
  ROVERLAY_SERVICE=http://sandbox.wf4ever-project.org/roverlay/rovserver/
  CHECKLIST_URI=http://sandbox.wf4ever-project.org/rodl/ROs/minim-evaluation/chembox-minim-samples.ttl
  echo "Using sandbox roverlay service at $ROVERLAY_SERVICE"
fi
if [ "$USE_SERVICE" == "ANDROS" ]; then
  CHECKLIST_SERVICE=http://andros.zoo.ox.ac.uk:8080/evaluate/trafficlight_json
  ROVERLAY_SERVICE=http://andros.zoo.ox.ac.uk:8000/rovserver/
  CHECKLIST_URI=file:///home/graham/Workspace/wf4ever/ro-catalogue/v0.1/minim-evaluation/chembox-minim-samples.ttl
  echo "Using andros-based roverlay service at $ROVERLAY_SERVICE"
fi

echo "CHECKLIST_SERVICE: $CHECKLIST_SERVICE"
echo "ROVERLAY_SERVICE:  $ROVERLAY_SERVICE"

if [ "$CHECKLIST_SERVICE" == "" ]; then
  echo "Set USE_SERVICE to ESKARINA, SANDBOX or ANDROS (was $USE_SERVICE)"
  echo "Exitting..."
  exit 2
fi

ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"

countpass=0
countfail=0
countall=0

echo "RO evaluation run: $(date)" >00-evaluate-ROs.log

while read TARGET
  do

    # Escape '%' in URI used as parameter in URI.
    TARGETESC=${TARGET//%/%25}
    echo "----- $TARGET :: $TARGETESC -----"
    # echo "RO evaluation for $TARGET: $(date)" >>00-evaluate-ROs.log
    echo "" >>00-evaluate-ROs.log
    echo "<$TARGET>" >>00-evaluate-ROs.log
    # Create Overlay RO for selected target...
    ROURI=$(roverlay -s $ROVERLAY_SERVICE $TARGET)

    # checklist eval ...
    # result=$(curl --silent \
    #       "$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGETESC" \
    #     | python checklistresult.py)
    EVALUATE_URI="$CHECKLIST_SERVICE?RO=$ROURI&minim=$CHECKLIST_URI&purpose=complete&target=$TARGETESC"
    # echo "Evaluate: $EVALUATE_URI" >>00-evaluate-ROs.log   
    curl --silent "$EVALUATE_URI"  >00-checklistresult.tmp
    result=$(cat 00-checklistresult.tmp | python checklistresult.py)
    # @@TODO: count results for individual checklist items
    if [ $? == 0 ]; then
        countpass=$((countpass+1))
    else
        countfail=$((countfail+1))
    fi
    rm 00-checklistresult.tmp
    countall=$((countall+1))
    echo "$ROURI, $result"
    echo "$ROURI, $result" >>00-evaluate-ROs.log

    # Delete Overlay RO created
    roverlay -s $ROVERLAY_SERVICE -d $ROURI

  # done <chembox-uris-tryptoline.txt
  # done <chembox-uris-dihydrothiazole.txt
  # done <chembox-uris-test.txt
  done <chembox-uris-100.txt

echo "Total pass: $countpass, fail: $countfail out of $countall"
echo "Total pass: $countpass, fail: $countfail out of $countall" >>00-evaluate-ROs.log
echo "RO evaluation run ended: $(date)" >>00-evaluate-ROs.log


# End.
