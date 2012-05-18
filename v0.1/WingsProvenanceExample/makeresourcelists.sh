#!/bin/bash
#
# Create resource lists from RDF wfdesc/wfprov data
#
# makeresourcelists.sh - is a local helper script that queries the RDF data obtained from Wings
# (using Jena tools for querying local RDF files) and generates a list of resources of various types.
# These lists are used when generating RO manifests by the next script.
#

export JENAROOT=/Users/graham/DevTools/apache-jena-2.7.0-incubating

# wfdesc

rm mainworkflow.txt
rm subworkflows.txt
rm -f artifacts.tmp
rm artifacts.txt

CR='\015'

$JENAROOT/bin/arq -q --data=wf34/template.rdf --query=workflow-query.sparql --results=csv           | tail -n +2 | tr -d $CR >>mainworkflow.txt
$JENAROOT/bin/arq -q --data=wf34/linking.rdf --query=workflow-query.sparql --results=csv            | tail -n +2 | tr -d $CR >>subworkflows.txt
$JENAROOT/bin/arq -q --data=wf34/linking-artifacts.rdf --query=artifacts-query.sparql --results=csv  | tail -n +2 | tr -d $CR >>artifacts.tmp

# wfprov

rm mainworkflowrun.txt
rm processrun.txt

$JENAROOT/bin/arq -q --data=wf34/wfexec.rdf --query=workflowrun-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>mainworkflowrun.txt
$JENAROOT/bin/arq -q --data=wf34/linking-steps.rdf --query=processrun-query.sparql --results=csv     | tail -n +2 | tr -d $CR >>processrun.txt
$JENAROOT/bin/arq -q --data=wf34/artifact.rdf --query=artifacts-query.sparql --results=csv          | tail -n +2 | tr -d $CR >>artifacts.tmp

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
