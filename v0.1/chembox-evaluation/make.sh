#!/bin/bash
#
# RO manager script to create trivial RO
#

 source ~/workspace/wf4ever-ro-manager/romenv/bin/activate

source ../../ro.sh

TESTRO="."
RONAME="chembox-evaluation"
ROTITLE="Chembox evaluation"

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"

# ro config \
#    -b /Users/graham/Desktop/robase \
#    -r "http://sandbox.wf4ever-project.org/rodl/ROs/" \
#    -t "32801fc0-1df1-4e34-b" \
#    -n "Test user" \
#    -e "testuser@example.org"

#  -b /Users/graham/Desktop/robase \                     # base directory for ROs
#  -r "http://sandbox.wf4ever-project.org/rodl/ROs/" \   # URI for ROSRS service used for ro push, checkout
#  -t "32801fc0-1df1-4e34-b" \                           # Auth bearer token for ROSRS access
#  -n "Test user" \                                      # User name
#  -e "testuser@example.org"                             # User email

# show simple directory content

ro create "$ROTITLE" -d . -i $RONAME

# add all files from currenmt directory to RO

ro add -a -d .

# Show aggregated files

ro list -d .

# ro annotations

ro annotate . -g Ethane.ttl

# End.

