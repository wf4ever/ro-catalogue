# $prov wprov:enactorAgent $name
# =>
# $prov rouser:attributedTo $name
# =>
# $prov wfprov:wasGeneratedBy 
#   [ a wfprov:WorkflowRun ; wfprov:wasInitiatedBy 
#      [ a foaf:Agent ; foaf:name $name ] ]
# (use ro-manager wildcard?)

function attributedTo {
    prov=$1
    name=$2
    cat >annotations/attrib-$prov.ttl <<EOF

@prefix wfprov: <http://purl.org/wf4ever/wfprov#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
<$prov> wfprov:wasGeneratedBy
  [ a wfprov:WorkflowRun ;
    wfprov:wasInitiatedBy
      [ a foaf:Agent ; foaf:name "$name" ]
  ] .
EOF
    ro add "annotations/attrib-$prov.ttl"
    ro annotate $prov -g "annotations/attrib-$prov.ttl"
}


# $t2flow wprov:usedInput $txt
# =>
# $t2flow rouser:usedInput $txt
# =>
# <> wfprov:usedInput $txt ;
#    a wfprov:WorkflowRun ; 
#    wfprov:describedByWorkflow [wfdesc:hasWorkflowDefinition $t2flow ]] .


function usedInput {
    input=$1
    t2flow=$2
    cat >annotations/usedInput-$input.ttl <<EOF

@prefix wfprov: <http://purl.org/wf4ever/wfprov#> .
@prefix wfdesc: <http://purl.org/wf4ever/wfdesc#> .
[ a wfprov:WorkflowRun ; wfprov:describedByWorkflow
  [ wfdesc:hasWorkflowDefinition  <$t2flow> ]
] wfprov:usedInput <$input> .
EOF
    ro add "annotations/usedInput-$input.ttl"
    ro annotate $input -g "annotations/usedInput-$input.ttl"
}

# $xls wprov:wasOutputFrom $t2flow
# =>
# $xls rouser:outputFrom <>
# =>
# $xls wfprov:wasOutputFrom
#   [ a wfprov:WorkflowRun ; wfprov:describedByWorkflow [wfdesc:hasWorkflowDefinition $t2flow ]] 


function outputFrom {
    output=$1
    t2flow=$2
    cat >annotations/outputFrom-$output.ttl <<EOF

@prefix wfprov: <http://purl.org/wf4ever/wfprov#> .
@prefix wfdesc: <http://purl.org/wf4ever/wfdesc#> .
<$output> wfprov:wasOutputFrom
  [ a wfprov:WorkflowRun ;
    wfprov:describedByWorkflow
      [ wfdesc:hasWorkflowDefinition  <$t2flow> ]
  ] .
EOF
    ro add "annotations/outputFrom-$output.ttl"
    ro annotate $output -g "annotations/outputFrom-$output.ttl"
}


# $zip wfprov:describedByWorkflow $t2flow
# =>
# $zip rouser:runOfWorkflow $t2flow
# =>
# $zip prov:wasGeneratedBy [
#     a wfprov:WorkflowRun ;
#     wfprov:describedByWorkflow [wfdesc:hasWorkflowDefinition Â$t2flow ].
# (use ro-manager wildcard?)

function linkToWorkflow {
    prov=$1
    t2flow=$2
    cat >annotations/linktoWF-$prov.ttl <<EOF
@prefix wfprov: <http://purl.org/wf4ever/wfprov#> .
@prefix prov: <http://www.w3.org/TR/prov-o/> .
@prefix wfdesc: <http://purl.org/wf4ever/wfdesc#> .
<$prov> prov:wasGeneratedBy [   
     a wfprov:WorkflowRun ;
     wfprov:describedByWorkflow [wfdesc:hasWorkflowDefinition <$t2flow>] ] .
EOF
    ro add "annotations/linktoWF-$prov.ttl"
    ro annotate $prov -g "annotations/linktoWF-$prov.ttl"
}


# $t2flow rdf:type wfdesc:WorkflowDefinition
# =>
# $t2flow wfdesc:isDefinitionOf [ rdf:type wfdesc:Workflow ].
# (use ro-manager wildcard?)

function isWorkflow {
    t2flow=$1
    cat >annotations/wf-$t2flow.ttl <<EOF
@prefix wfdesc: <http://purl.org/wf4ever/wfdesc#> .
<$t2flow> wfdesc:isDefinitionOf
  [ a wfdesc:Workflow
  ] .
EOF
    ro add "annotations/wf-$t2flow.ttl"
    ro annotate $t2flow -g "annotations/wf-$t2flow.ttl"
}


attributedTo Workflow-runs/SNP2KEGG-prov-export.zip 'Kristina Hettne'

outputFrom Datasets/rs2014355_output.xls  Workflows/main_nested_workflow.t2flow

usedInput Workflows/main_nested_workflow.t2flow  Datasets/top_snps_to_annotate_input.txt
usedInput Workflows/SNP2KEGG.t2flow  Datasets/top_snps_to_annotate_input.txt 

linkToWorkflow  Workflow-runs/Main-nested-workflow-rs2216405-prov-export.zip  Workflows/main_nested_workflow.t2flow

isWorkflow Workflows/main_nested_workflow.t2flow 

