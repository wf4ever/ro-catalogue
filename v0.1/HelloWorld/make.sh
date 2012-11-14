#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="hello-world"

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

ro create "Hello World" -d . -i hello-world

# add all files from currenmt directory to RO

ro add -a -d .

# Show aggregated files

ro list -d .

# Create link annotation between RO and README.txt

ro link . rdfs:seeAlso README.txt

# Display new annotation on RO

ro annotations `pwd`/

# Create new single annotation with explicit target

ro annotate TavernaHelloWorld.t2flow title "Hellow World"

# Display new annotation on file

ro annotations TavernaHelloWorld.t2flow

# Also show nbew files created in RO directory

# Add nore annotations using pre-existing RDF file

ro annotate TavernaHelloWorld.t2flow -g HelloWorld-wfdesc.rdf

# Show all annotations

ro annotations

# End.


