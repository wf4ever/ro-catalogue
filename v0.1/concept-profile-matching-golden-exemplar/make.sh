#!/bin/bash
#
# RO manager script to create trivial RO
#

source ../../ro.sh

# Fail on first error
set -e

TESTRO="."
RONAME="concept-profile-matching-golden-exemplar"

echo "--------"

$RO config -v \
  -b $ROBASE \
  -r http://sandbox.wf4ever-project.org/rosrs5 \
  -n "https://www.google.com/accounts/o8/id?id=AItOawl4I-H_ask7ollkwUzMrjTDrgD2oj_Qu2Q" \
  -t "a5c489aa-b413-47ad-b" \
  -e "k.m.hettne@lumc.nl"

echo "--------"

rm -rf .ro

$RO create -v "Concept Profile Matching Golden Exemplar" -d . -i concept-profile-matching-golden-exemplar

$RO add -v -a -d .

$RO status -v -d .

$RO list -v -d .
echo "--------"

$RO list -v -a -d .
echo "--------"

# Make wfdesc from t2flow
pushd Workflows
    ../../../lib/scufl2-wfdesc/bin/scufl2-to-wfdesc *t2flow 
    # Move away, we don't want to aggregate these annotation bodies
    # as ro:Resources
    mv *wfdesc.ttl ../.ro/
    for t2flow in *t2flow ; do
        $RO annotate -v $t2flow -g ../.ro/$(echo $t2flow|sed s/.t2flow$/.wfdesc.ttl/)
        $RO annotate -v $t2flow rdf:type 'http://purl.org/wf4ever/wfdesc#Workflow'
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

$RO annotate -v Workflow-runs/SNP2KEGG-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/List-Concept-Sets-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs8396-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs168622-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs174547-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs211718-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs272889-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs541503-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs603424-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2014355-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2046813-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2286963-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs7094971-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs7156144-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs9393903-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs11158519-prov-export.zip rdf:type 'http://purl.org/wf4ever/wfprov#WorkflowRun'

$RO annotate -v Workflow-runs/SNP2KEGG-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/List-Concept-Sets-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs8396-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs168622-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs174547-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs211718-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs272889-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs541503-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs603424-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2014355-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2046813-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs2286963-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs7094971-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs7156144-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs9393903-prov-export.zip wprov:enactorAgent 'Kristina Hettne'
$RO annotate -v Workflow-runs/Main-nested-workflow-rs11158519-prov-export.zip wprov:enactorAgent 'Kristina Hettne'

$RO link Datasets/output_snp_gene_kegg.txt wfprov:wasOutputFrom Workflows/SNP2KEGG.t2flow
$RO link Datasets/List_Concept_Sets_output.xls wfprov:wasOutputFrom Workflows/List_Predefined_Concept_Sets.t2flow
$RO link Datasets/rs8396_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs168622_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs174547_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs211718_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs272889_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs541503_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs603424_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs2014355_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs2046813_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs2216405_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs2286963_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs7094971_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs7156144_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs9393903_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow
$RO link Datasets/rs11158519_output.xls wfprov:wasOutputFrom Workflows/main_nested_workflow.t2flow

$RO link Datasets/top_snps_to_annotate_input.txt wfprov:usedInput Workflows/main_nested_workflow.t2flow
$RO link Datasets/top_snps_to_annotate_input.txt wfprov:usedInput Workflows/SNP2KEGG.t2flow

$RO annotate -v Documents/HOWTO.txt rdfs:comment 'Text file describing the protocol for the experiment, including the order of workflow execution.'
$RO annotate -v Documents/README.txt rdfs:comment 'Text file describing the background of the experiment, and the formulated hypothesis.'

$RO annotate -v Documents/kegg_cp_comparison_results.xls rdf:type 'http://purl.org/wf4ever/wfdesc#Results'
$RO annotate -v Documents/kegg_cp_comparison_results.xls rdfs:comment 'Excel file comparing the results from the workflows.'
$RO annotate -v Documents/workflow_sketch_final.jpg rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.odp rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.pdf rdfs:comment 'High-level overview of experiment and order of workflow execution.'
$RO annotate -v Documents/workflow_sketch_final.png rdfs:comment 'High-level overview of experiment and order of workflow execution.'

$RO link Workflow-runs/List-Concept-Sets-prov-export.zip wfprov:describedByWorkflow Workflows/List_Predefined_Concept_Sets.t2flow
$RO link Workflow-runs/SNP2KEGG-prov-export.zip wfprov:describedByWorkflow Workflows/SNP2KEGG.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs8396-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs168622-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs174547-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs211718-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs272889-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs541503-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs603424-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs2014355-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs2046813-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs7094971-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs7156144-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs9393903-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs11158519-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow
$RO link Workflow-runs/Main-nested-workflow-rs2286963-prov-export.zip wfprov:describedByWorkflow Workflows/main_nested_workflow.t2flow

$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Filter_concepts_with_profiles_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Find_co_occurring_documents_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Get_concept_information_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Match_concept_profiles_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/DatabaseID_to_ConceptID_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/SNP_ID2EntrezGene_ID_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Get_Concept_IDs_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Explain_concept_scores_component.t2flow
$RO link Workflows/main_nested_workflow.t2flow wfdesc:hasSubWorkflow Workflows/Find_Supporting_Documents_component.t2flow

$RO annotate -v . -g ro_annotation.rdf

echo "--------"

$RO annotations -v

# End.

