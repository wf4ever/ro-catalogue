#!/bin/bash
#
# Create resource lists from RDF wfdesc/wfprov data
#

export JENAROOT=/Users/graham/DevTools/apache-jena-2.7.0-incubating

# wfdesc

rm mainworkflow.txt
rm subworkflows.txt
rm processes.txt
rm artifacts.txt

CR='\015'

$JENAROOT/bin/arq -q --data=wf34/template.rdf --query=workflow-query.sparql --results=csv           | tail -n +2 | tr -d $CR >>mainworkflow.txt
$JENAROOT/bin/arq -q --data=wf34/linking.rdf --query=workflow-query.sparql --results=csv            | tail -n +2 | tr -d $CR >>subworkflows.txt
$JENAROOT/bin/arq -q --data=wf34/linkingArtifacts.rdf --query=artifacts-query.sparql --results=csv  | tail -n +2 | tr -d $CR >>artifacts.txt

# $JENAROOT/bin/arq -q --data=wf41/template.rdf --query=workflow-query.sparql --results=csv           | tail -n +2 >>mainworkflow.txt
$JENAROOT/bin/arq -q --data=wf41/linking.rdf --query=workflow-query.sparql --results=csv            | tail -n +2 | tr -d $CR >>processes.txt
$JENAROOT/bin/arq -q --data=wf41/linkingArtifacts.rdf --query=artifacts-query.sparql --results=csv  | tail -n +2 | tr -d $CR >>artifacts.tmp

# wfprov

rm mainworkflowrun.txt
rm processrun.txt

$JENAROOT/bin/arq -q --data=wf34/wfExec.rdf --query=workflowrun-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>mainworkflowrun.txt
$JENAROOT/bin/arq -q --data=wf34/linkingSteps.rdf --query=processrun-query.sparql --results=csv     | tail -n +2 | tr -d $CR >>processrun.txt
$JENAROOT/bin/arq -q --data=wf34/artifact.rdf --query=artifacts-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>artifacts.txt

$JENAROOT/bin/arq -q --data=wf41/wfExec.rdf --query=workflowrun-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>mainworkflowrun.txt
$JENAROOT/bin/arq -q --data=wf41/linkingSteps.rdf --query=processrun-query.sparql --results=csv     | tail -n +2 | tr -d $CR >>processrun.txt
$JENAROOT/bin/arq -q --data=wf41/artifact.rdf --query=artifacts-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>artifacts.txt

cat artifacts.tmp | sort -u > artifacts.txt
rm artifacts.tmp

# ./wf34/template.rdf           # wfdesc - identifies workflow and sub-processes
# ./wf34/linking.rdf            # wfdesc - more workflows, with describedby...
# ./wf34/linkingArtifacts.rdf   # wfdesc - enumerates artifacts, with describedbyparameter for some
# ./wf34/processGeneration.rdf  # wfdesc - processes, parameters, artifacts
# ./wf34/processUsage.rdf       # wfdesc - processes, parameters, artifacts

# ./wf34/wfExec.rdf             #wfprov - identifies WorkflowRun
# ./wf34/linkingSteps.rdf       #wfprov - enumerates processes, with describedby...
# ./wf34/artifact.rdf           #wfprov - artifacts with file sizes
### These have processes typed as artifacts: surely not?
# ./wf34/usage.rdf              #wfprov - resource, artifact, with wasPartOfWorkflowRun, usedInput
# ./wf34/generation.rdf         #wfprov - resource, artifact, with wasPartOfWorkflowRun, wasOutputFrom

# ./wf41/template.rdf
# ./wf41/linking.rdf
# ./wf41/linkingArtifacts.rdf
# ./wf41/linkingSteps.rdf
# ./wf41/processGeneration.rdf
# ./wf41/processUsage.rdf

# ./wf41/wfExec.rdf
# ./wf41/artifact.rdf
# ./wf41/usage.rdf
# ./wf41/generation.rdf

