#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="wf74"
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

$RO create -v "WF74 protein discovery" -d $ROPATH/$RONAME -i $RONAME

$RO add -v -a -d $TESTRO

#for F in \
#    data/UserRequirements-astro.ods \
#    data/UserRequirements-bio.ods   \
#    data/UserRequirements-gen.ods   \
#do
#    $RO add -v -d $ROBASE/wf4ever-requirements/ $ROBASE/wf4ever-requirements/$F
#done

# echo "--------"

#$RO status -v -d $TESTRO

#echo "--------"

#$RO list -v -d $TESTRO

echo "--------"

$RO annotations

echo "--------"

$RO annotate -v $TESTRO/ type "Research object"
$RO annotate -v $TESTRO/ description "Taverna workflow example with provenance (wfdesc and wfprov)"

$RO annotate -v $TESTRO/bioaid_proteindiscovery_181667.wfdesc.ttl type "workflow-description"
$RO annotate -v $TESTRO/wf74.wfprov.ttl type "workflow-run-provenance"

$RO annotate -v bioaid_proteindiscovery_181667.t2flow -g $TESTRO/bioaid_proteindiscovery_181667.wfdesc.ttl

# Associate provenance with all output files
# The file output-resources.txt was creeated with the help of this command:
# $JENAROOT/bin/arq -q --data=wf74.wfprov.ttl --query=output-resource-query.sparql --results=csv

#$RO annotate -v -d $TESTRO -g wf74.wfprov.ttl http://ns.taverna.org.uk/2011/data/479c9612-4862-4bcb-ad09-315b7b864260/list/001addaf-0c4a-4513-8a73-f7733558b783/false/1

for resource in $(cat output-resources.txt); do
    $RO annotate -v -d $TESTRO -g wf74.wfprov.ttl $resource
done



$RO annotations

echo "--------"

#./ro annotations -v $ROBASE/test-create-RO/subdir1/subdir1-file.txt

#echo "--------"

#echo "--------"

# End.
