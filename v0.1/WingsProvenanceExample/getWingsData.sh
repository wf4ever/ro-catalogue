#!/bin/bash
#
# Issue SPARQL query to Wings service to obtain test data for RO
#
# getWingsData.sh - performs a series of SPARQL CONSTRUCT queries to extract Wings provenance data 
# from the isi.edu endpoint, and convert it to wfdesc/wfprov vocabularies.  
# (Uses SPARQL CONSTRUCT query as a kind of simple inference rule.)  
# The resulting RDF data is saved in subdirectory wf34.
#
# http://wind.isi.edu:10035/catalogs/java-catalog/repositories/WINGSTemplatesAndResults#query

WINGSEP=http://wind.isi.edu:10035/catalogs/java-catalog/repositories
DATASET=WINGSTemplatesAndResults

echo "===== CREATE SPARQL QUERIES ====="

# test query
cp prefixes.sparql wings-query-test.sparql
cat >>wings-query-test.sparql <<%EOF%
SELECT * WHERE { ?s ?p ?o } LIMIT 10
%EOF%

# Usage
cp prefixes.sparql wings-query-usage.sparql
cat >>wings-query-usage.sparql <<%EOF%
CONSTRUCT {
  ?artifact a <http://purl.org/wf4ever/wfprov#Artifact>, <http://purl.org/wf4ever/ro#Resource>;
  		<http://www.w3.org/2000/01/rdf-schema#label> ?label.
  ?activity a <http://purl.org/wf4ever/wfprov#Process>, <http://purl.org/wf4ever/ro#Resource>;
            <http://purl.org/wf4ever/wfprov#usedInput> ?artifact;
			<http://www.w3.org/2000/01/rdf-schema#label> ?labelA;
            <http://purl.org/wf4ever/wfprov#wasPartOfWorkflowRun> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>.
 } WHERE {
  ?artifact a <http://wings.isi.edu/ontology/opmv/ArtifactInstance>;
            <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>.
  ?activity a <http://wings.isi.edu/ontology/opmv/ProcessInstance>;
            <http://purl.org/net/opmv/ns#used> ?artifact;
            <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>.
  OPTIONAL{?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
  OPTIONAL{?activity <http://www.w3.org/2000/01/rdf-schema#label> ?labelA.}.
 }
%EOF%

# Generation
cp prefixes.sparql wings-query-generation.sparql
cat >>wings-query-generation.sparql <<%EOF%
CONSTRUCT {
  ?artifact a <http://purl.org/wf4ever/wfprov#Artifact>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?label;
            <http://purl.org/wf4ever/wfprov#wasOutputFrom> ?activity.
  ?activity a <http://purl.org/wf4ever/wfprov#Process>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?labelA;
            <http://purl.org/wf4ever/wfprov#wasPartOfWorkflowRun> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>.
} WHERE {
  ?artifact a <http://wings.isi.edu/ontology/opmv/ArtifactInstance>;
            <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>;
            <http://purl.org/net/opmv/ns#wasGeneratedBy> ?activity.
  ?activity a <http://wings.isi.edu/ontology/opmv/ProcessInstance>.
  OPTIONAL{?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
  OPTIONAL{?activity <http://www.w3.org/2000/01/rdf-schema#label> ?labelA.}.
}
%EOF%

# Artifact
cp prefixes.sparql wings-query-artifact.sparql
cat >>wings-query-artifact.sparql <<%EOF%
CONSTRUCT {
  ?artifact a <http://purl.org/wf4ever/wfprov#Artifact>, <http://purl.org/wf4ever/ro#Resource>;
            <http://purl.org/wf4ever/ro#name> ?f;
            <http://purl.org/wf4ever/ro#fileSize> ?s;
			<http://www.w3.org/2000/01/rdf-schema#label> ?label.

} WHERE {
  ?artifact a <http://wings.isi.edu/ontology/opmv/ArtifactInstance>.
  ?artifact <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>.
  OPTIONAL{
           ?artifact <http://wings.isi.edu/ontology/opmv/hasFileName> ?f.
           ?artifact <http://wings.isi.edu/ontology/opmv/hasSize> ?s.
		   ?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.
  }.
}
%EOF%

# Enumerate workflow executions in account
cp prefixes.sparql wings-query-wfexec.sparql
cat >>wings-query-wfexec.sparql <<%EOF%
CONSTRUCT {
  <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534> a <http://purl.org/wf4ever/wfprov#WorkflowRun>;
				<http://www.w3.org/2000/01/rdf-schema#label> ?label.
} WHERE {
  <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534> a <http://openprovenance.org/model/opmo#Account>.
  OPTIONAL{<http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534> <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.

}
%EOF%

# ProcessUsage
cp prefixes.sparql wings-query-process-usage.sparql
cat >>wings-query-process-usage.sparql <<%EOF%
 CONSTRUCT {
  ?artifact a <http://purl.org/wf4ever/wfdesc#Artifact>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?label.
  ?activity a <http://purl.org/wf4ever/wfdesc#Process>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?labelA;
            <http://purl.org/wf4ever/wfdesc#hasInput> _:p.
  _:p a <http://purl.org/wf4ever/wfdesc#Parameter>;
      <http://purl.org/wf4ever/wfdesc#hasArtifact> ?artifact.
} WHERE {
  <http://wings.isi.edu/opmexport/resource/WorkflowTemplate/ABSTRACTSUBWFLIGANDBINDINGSITESCOMPARISON> a <http://wings.isi.edu/ontology/opmv/WorkflowTemplate>;
            <http://openprovenance.org/model/opmo#hasArtifact> ?artifact;
            <http://openprovenance.org/model/opmo#hasProcess> ?activity.
  ?artifact a <http://wings.isi.edu/ontology/opmv/DataVariable>.
  ?activity a <http://wings.isi.edu/ontology/opmv/ProcessTemplate>;
            <http://purl.org/net/opmv/ns#used> ?artifact.
  OPTIONAL{?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
  OPTIONAL{?activity <http://www.w3.org/2000/01/rdf-schema#label> ?labelA.}.
}
%EOF%

# ProcessGeneration
cp prefixes.sparql wings-query-process-generation.sparql
cat >>wings-query-process-generation.sparql <<%EOF%
 CONSTRUCT {
  ?artifact a <http://purl.org/wf4ever/wfdesc#Artifact>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?label.
  ?activity a <http://purl.org/wf4ever/wfdesc#Process>, <http://purl.org/wf4ever/ro#Resource>;
			<http://www.w3.org/2000/01/rdf-schema#label> ?labelA;
            <http://purl.org/wf4ever/wfdesc#hasOutput> _:p.
  _:p a <http://purl.org/wf4ever/wfdesc#Parameter>;
      <http://purl.org/wf4ever/wfdesc#hasArtifact> ?artifact.
} WHERE {
  <http://wings.isi.edu/opmexport/resource/WorkflowTemplate/ABSTRACTSUBWFLIGANDBINDINGSITESCOMPARISON> a <http://wings.isi.edu/ontology/opmv/WorkflowTemplate>;
            <http://openprovenance.org/model/opmo#hasArtifact> ?artifact;
            <http://openprovenance.org/model/opmo#hasProcess> ?activity.
  ?artifact a <http://wings.isi.edu/ontology/opmv/DataVariable>;
            <http://purl.org/net/opmv/ns#wasGeneratedBy> ?activity.
  ?activity a <http://wings.isi.edu/ontology/opmv/ProcessTemplate>.
  OPTIONAL{?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
  OPTIONAL{?activity <http://www.w3.org/2000/01/rdf-schema#label> ?labelA.}.
}
%EOF%

# Template
cp prefixes.sparql wings-query-template.sparql
cat >>wings-query-template.sparql <<%EOF%
CONSTRUCT{
<http://wings.isi.edu/opmexport/resource/WorkflowTemplate/ABSTRACTSUBWFLIGANDBINDINGSITESCOMPARISON> a <http://purl.org/wf4ever/wfdesc#Workflow>;
                 <http://purl.org/wf4ever/wfdesc#hasSubProcess> ?proc.
}WHERE{
<http://wings.isi.edu/opmexport/resource/WorkflowTemplate/ABSTRACTSUBWFLIGANDBINDINGSITESCOMPARISON> a <http://wings.isi.edu/ontology/opmv/WorkflowTemplate>;
                 <http://openprovenance.org/model/opmo#hasProcess> ?proc.
}
%EOF%

# Linking workflow instances to template
cp prefixes.sparql wings-query-linking.sparql
cat >>wings-query-linking.sparql <<%EOF%
CONSTRUCT{
?templ a <http://purl.org/wf4ever/wfdesc#Workflow>;
	   <http://www.w3.org/2000/01/rdf-schema#label> ?label.
<http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534> a <http://purl.org/wf4ever/wfdesc#Workflow>; 
			<http://purl.org/wf4ever/wfprov#describedByWorkflow> ?templ.
}WHERE{
?templ a <http://wings.isi.edu/ontology/opmv/WorkflowTemplate>.
<http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534> a <http://openprovenance.org/model/opmo#Account>; 
			<http://wings.isi.edu/ontology/opmv/hasWorkflowTemplate> ?templ.
OPTIONAL{?templ <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
}
%EOF%

# Linking result artifacts to artifact descriptions
cp prefixes.sparql wings-query-linking-artifacts.sparql
cat >>wings-query-linking-artifacts.sparql <<%EOF%
CONSTRUCT{
?aTempl a <http://purl.org/wf4ever/wfdesc#Artifact>.
?artifact a <http://purl.org/wf4ever/wfprov#Artifact>;
		  <http://www.w3.org/2000/01/rdf-schema#label> ?label;	
          <http://purl.org/wf4ever/wfprov#describedByParameter> _:p.
_:p a <http://purl.org/wf4ever/wfdesc#Parameter>;
      <http://purl.org/wf4ever/wfdesc#hasArtifact> ?aTempl.
}
WHERE
{
?artifact a <http://wings.isi.edu/ontology/opmv/ArtifactInstance>;
          <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>;
          <http://wings.isi.edu/ontology/opmv/hasArtifactTemplate> ?aTempl.
OPTIONAL{?artifact <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
}
%EOF%

# Linking workflow execution steps to templates
cp prefixes.sparql wings-query-linking-steps.sparql
cat >>wings-query-linking-steps.sparql <<%EOF%
CONSTRUCT{
?pTempl a <http://purl.org/wf4ever/wfdesc#Process>;
		<http://www.w3.org/2000/01/rdf-schema#label> ?label.
?process a <http://purl.org/wf4ever/wfprov#Process>;
          <http://purl.org/wf4ever/wfprov#describedByProcess> ?pTempl.
}WHERE{
?process a <http://wings.isi.edu/ontology/opmv/ProcessInstance>;
          <http://openprovenance.org/model/opmo#account> <http://wings.isi.edu/opmexport/resource/Account/ACCOUNT1332778606534>;
          <http://wings.isi.edu/ontology/opmv/hasProcessTemplate> ?pTempl.
OPTIONAL{?pTempl <http://www.w3.org/2000/01/rdf-schema#label> ?label.}.
}
%EOF%


echo "===== ISSUE SPARQL QUERIES ====="

# JSON results
#curl -X POST $WINGSEP/$DATASET \
# -H "accept: application/sparql-results+json" \
# -H "Content-Type: application/x-www-form-urlencoded" \
# --data-urlencode query@wings-query-test.sparql

# RDF/XML results

for q in \
        usage generation artifact wfexec \
        process-usage process-generation template \
        linking linking-artifacts linking-steps; do
curl -X POST $WINGSEP/$DATASET \
      -H "accept: application/rdf+xml" \
      -H "Content-Type: application/x-www-form-urlencoded" \
      --data-urlencode query@wings-query-$q.sparql >wf34/$q.rdf
done

# XML results
#curl http://localhost:3030/$DATASET/query --data-urlencode query@query.sparql

# Plain text tabular results
#curl http://localhost:3030/$DATASET/query -H "accept: text/plain" --data-urlencode query@query.sparql

# End.
