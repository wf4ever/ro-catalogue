#!/bin/bash
#
# RO manager script to test RO for features in Y2 review demo
#

source ../../ro.sh

TESTRO="."
RONAME="soapdenovo-test"

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r "http://sandbox.wf4ever-project.org/rodl/ROs/" \
  -t "3c7483ac-e157-4cb3-97d5-8cf6e129f8e9" \
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

# Remove old RO structure

rm -rf .ro

# show simple directory content

ro create "SOAPdenovo case study RO features test" -d . -i $RONAME

# add all files from currenmt directory to RO

ro add -a -d .

# Show aggregated files

ro list -d .

# Add workflow description (wfdesc)

ro annotate Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga -g Galaxy-wfdesc.rdf

# Annotate selelcted input data

ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected Inputs/saureus_A_L1_101bp180IS45X_1.fq
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected Inputs/saureus_A_L1_101bp180IS45X_2.fq
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected Inputs/saureus_B_L3_37bp3500IS45X_1.fq
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected Inputs/saureus_B_L3_37bp3500IS45X_2.fq
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected Inputs/saureus.fasta

# Annotate output data
ro annotate Outputs/gage.out.Tabular -g output.rdf


# Show all annotations

ro annotations

# publish an RO

ro push -d . -r "http://sandbox.wf4ever-project.org/rodl/ROs/" -t "3c7483ac-e157-4cb3-97d5-8cf6e129f8e9"

# End.

