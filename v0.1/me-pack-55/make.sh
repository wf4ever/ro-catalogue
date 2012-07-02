#!/bin/bash
#
# RO manager sample script
#

source ../../ro.sh

RONAME="me-pack-55"
TESTRO="$ROPATH/$RONAME"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs5 \
  -t "32801fc0-1df1-4e34-b" \
  -n "Test user" \
  -e "testuser@example.org"

$RO create -v "Simple me-55 RO" -d $ROPATH/$RONAME -i $RONAME

$RO add -v -a -d $TESTRO

$RO annotate workflows/pathways_and_gene_annotations_forqtl_region_290738.t2flow -g wfdesc.rdf 

echo "--------"

$RO status -v -d $TESTRO

echo "--------"

$RO list -v -d $TESTRO

echo "--------"

$RO annotations 

echo "--------"