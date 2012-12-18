#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

TESTRO="."
RONAME="golden-exemplar-gk"

# Fail on first error
set -e

echo "--------"

$RO config -v \
  -b $ROPATH \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"

echo "--------"

rm -rf .ro

$RO create -v "Concept Profile Matching Golden Exemplar GK" -d . -i $RONAME

$RO annotate . dcterms:identifier $RONAME

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .
echo "--------"

$RO list -v -a -d .
echo "--------"

# Make wfdesc from t2flow
pushd Workflows
    #../../../lib/scufl2-wfdesc/bin/scufl2-to-wfdesc *t2flow 
    # Move away, we don't want to aggregate these annotation bodies
    # as ro:Resources
    #mv *wfdesc.ttl ../.ro/
    for t2flow in *t2flow ; do
        $RO annotate -v $t2flow -g wfdesc/$(echo $t2flow|sed s/.t2flow$/.wfdesc.ttl/)
        $RO annotate -v $t2flow rdf:type 'http://purl.org/wf4ever/rouser#WorkflowDefinition'
    done
popd

echo "--------"
pushd Datasets
    for data in * ; do
        $RO annotate -v $data rdf:type 'http://purl.org/wf4ever/wf4ever#Dataset'
    done
popd
echo "--------"
pushd Documents
    for doc in * ; do
        $RO annotate -v $doc rdf:type 'http://purl.org/wf4ever/wf4ever#Document'
    done
popd
echo "--------"

# Make zip files out of all runs and remove the folders according to the following example commands:
#zip -r Workflow-runs/SNP2KEGG-prov-export.zip Workflow-runs/SNP2KEGG-prov-export
#rm -rf SNP2KEGG-prov-export

#$RO annotate -v Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip rdf:type 'http://purl.org/wf4ever/rouser#ProvenanceBundle'

#$RO annotate -v Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip http://purl.org/wf4ever/rouser#attributedTo 'Kristina Hettne'

$RO link Datasets/rs2014355_output.xls http://purl.org/wf4ever/rouser#outputFrom Workflows/main_nested_workflow.t2flow

$RO link Workflows/main_nested_workflow.t2flow	http://purl.org/wf4ever/rouser#usedInput 	Datasets/top_snps_to_annotate_input.txt 
$RO link Workflows/SNP2KEGG.t2flow	http://purl.org/wf4ever/rouser#usedInput 	Datasets/top_snps_to_annotate_input.txt 

$RO annotate -v Documents/HOWTO.txt rdfs:comment 'Text file describing the protocol for the experiment, including the order of workflow execution.'
$RO annotate -v Documents/README.txt rdfs:comment 'Text file describing the background of the experiment, and the formulated hypothesis.'

$RO annotate -v Documents/kegg_cp_comparison_results.xls rdf:type 'http://purl.org/wf4ever/wf4ever#Results'
$RO annotate -v Documents/kegg_cp_comparison_results.xls rdfs:comment 'Excel file comparing the results from the workflows.'
$RO annotate -v Documents/workflow_sketch_final.jpg rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.odp rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.pdf rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.png rdfs:comment 'High-level overview of experiment and order of workflow execution.'

#$RO link Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip http://purl.org/wf4ever/rouser#runOfWorkflow Workflows/main_nested_workflow.t2flow

$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Filter_concepts_with_profiles_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Find_co_occurring_documents_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Get_concept_information_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Match_concept_profiles_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/DatabaseID_to_ConceptID_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/SNP_ID2EntrezGene_ID_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Get_Concept_IDs_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Explain_concept_scores_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow http://purl.org/wf4ever/rouser#hasSubWorkflow Workflows/Find_Supporting_Documents_component.t2flow

$RO annotate -v . -g ro_annotation.rdf

echo "--------"

$RO annotations -v

# End.

