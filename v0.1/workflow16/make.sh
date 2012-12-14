#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

# Fail on first error
set -e

TESTRO="."
RONAME="workflows-16-updated"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rodl/ROs/ \
  -n "https://www.google.com/accounts/o8/id?id=AItOawl4I-H_ask7ollkwUzMrjTDrgD2oj_Qu2Q" \
  -t "5cef281f-922a-4238-b276-594a118f7acb" \
  -e "jun.zhao@zoo"

echo "--------"

rm -rf .ro

$RO create -v "Workflows 16 Updated" -d . -i workflows-16-updated

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .
echo "--------"

$RO list -v -a -d .
echo "--------"

$RO annotate -v workflow-runs1.zip rdf:type 'http://purl.org/wf4ever/rouser#ProvenanceBundle'


echo "--------"

$RO annotations -v

# End.

