#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="annotation-tests"
EXTURI1="http://github.com/wf4ever/ro-catalogue/blob/master/v0.1/trivial/20120114-1156-405.jpg"
EXTURI2="http://github.com/wf4ever/ro-catalogue/blob/master/v0.1/trivial/README"

echo "--------"

# Use ro-catalogue project base for ROs, so that a new (tmp) subdirectory is usable

echo "$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t \"$ROSRS_ACCESS_TOKEN\" \
  -n \"Test user\" \
  -e \"testuser@example.org\""

$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"

echo "--------"

rm -rf .ro

$RO create -v "Frosty morning image" -d . -i $RONAME

$RO annotate . dcterms:identifier $RONAME

$RO add -v -a -d .

$RO add -d . $EXTURI1

$RO status -v -d .

$RO list -v -d .

echo "--------"

$RO list -v -a -d .

echo "--------"

# simple, direct annotation
#$RO annotate -v 20120114-1156-405.jpg title "Trees on frosty morning"

# Annotation using aggregated graph
#$RO annotate -v 20120114-1156-405.jpg -g $TESTRO/metadata.rdf

# Annotate external aggregated resource
#$RO annotate -v -d . $EXTURI1 title "More trees"

# Annotate external non-aggregated resource
#$RO annotate -v -d . $EXTURI2 title "README text"

# Annotate external aggregated resource via graph
#$RO annotate -v -d . $EXTURI1 -g $TESTRO/metadataext1.rdf

# Annotate external non-agregated resource via graph
$RO annotate -v -d . $EXTURI2 -g $TESTRO/metadataext2.rdf

# Create annotation on RO using external graph annotations
#$RO annotate -v . -g $TESTRO/metadataext1.rdf
#$RO annotate -v . -g $TESTRO/metadataext2.rdf

# Annotate workflow with wfdesc file provided
function isWorkflow {
    t2flow=workflows/$1
    t2fann=annotations/wf-$1.ttl
    cat >$t2fann <<EOF
@prefix wfdesc: <http://purl.org/wf4ever/wfdesc#> .
<$t2flow> wfdesc:isDefinitionOf
  [ a wfdesc:Workflow
  ] .
EOF
    ro add "$t2fann"
    ro annotate $t2flow -g "$t2fann"
}

isWorkflow main_nested_workflow.t2flow 

echo "--------"

$RO annotations -v

# End.
