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
    ro annotate -v $prov -g "annotations/attrib-$prov.ttl"
}

# $RO annotate -v Workflow-runs/SNP2KEGG-prov-export.zip wprov:enactorAgent 'Kristina Hettne'

attributedTo Workflow-runs/SNP2KEGG-prov-export.zip 'Kristina Hettne'


