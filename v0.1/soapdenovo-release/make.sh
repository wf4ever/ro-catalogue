#!/bin/bash
#
#

source ../../ro.sh

TESTRO="."
RONAME="soapdenovo-v2"

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r "http://sandbox.wf4ever-project.org/rodl/ROs/" \
  -t "3c7483ac-e157-4cb3-97d5-8cf6e129f8e9" \
  -n "Jun Zhao" \
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

ro create "RO for SOAPdenovo case study" -d . -i $RONAME

# add all files from currenmt directory to RO

ro add -a -d .

# Show aggregated files

ro list -d .

# Basic information about the RO

ro annotate . dcterms:descriptions "RO that aggregates the ISA documents, the nanopublication statements as well as information about the workflow used to produce the results."

# Aggregate the ISAOWL and Nanopublication statements by links

ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/isatab_distribution/1
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/isaowl_distribution/1
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/study/1
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/nanopubs


ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/derived_data_file/3
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/raw_data_file/17
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/raw_data_file/18
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/raw_data_file/19
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/raw_data_file/20
ro link . ore:aggregates http://w3id.org/isa/soapdenovo2/raw_data_file/21

### Demonstrate of RO used for minimally preserving workflows

# Add workflow description (wfdesc)

# http://galaxy.cbiit.cuhk.edu.hk/u/gigascience/w/rluo2012-example-1-soapdenovo2-saureus

ro annotate Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga -g Galaxy-wfdesc.rdf

# Annotate selelcted input data

ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected http://w3id.org/isa/soapdenovo2/raw_data_file/17
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected http://w3id.org/isa/soapdenovo2/raw_data_file/18
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected http://w3id.org/isa/soapdenovo2/raw_data_file/19
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected http://w3id.org/isa/soapdenovo2/raw_data_file/20
ro link Workflows/Galaxy-Workflow-Workflow_constructed_from_history__reproduce_s.aureus_pipeline_.ga roterms:inputSelected http://w3id.org/isa/soapdenovo2/raw_data_file/21

# Annotate output data
ro annotate Outputs/gage.out.Tabular -g output.rdf

# Show all annotations

ro annotations

# publish an RO

ro push -d . -r "http://sandbox.wf4ever-project.org/rodl/ROs/" -t "73975122-9503-4000-ba52-d2c2d2bfccbb"

# End.

