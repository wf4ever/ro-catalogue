See kegg-workflows.md for overall plan of attack

Script wf_conversion.sh is used to convert the selected workflows (per Kegg-workflows.csv) from www.myExperiment to ROs in RODL, using the Wf-RO service.  The resulting metadata structure is quite dense, and hard to follow.

Wf4Ever test user access token:  972850de-1d98-488d-bd34-a19c9b86eb76

...

WF 3258: missing service detected OK:

    $ ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/ >dump.rdf
    $ asq -r dump.rdf "SELECT * WHERE { ?w a wfdesc:Process ; rdfs:label ?lab ; wf4ever:wsdlURI ?wsu }" -f csv
    wsu, lab, w
    "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI, "get_references_by_pathway" <http://ns.taverna.org.uk/2010/workflowBundle/b48e8bbe-00a7-4f7e-8819-b14025f21fd0/workflow/Retrieve_Pubmed_Publ/processor/get_references_by_pathway/>

...

WF 936: missing services not mentioned

$ ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/ >dump.rdf

$ asq -r dump.rdf "SELECT * WHERE { ?w a wfdesc:Process ; rdfs:label ?lab }" -f csv
w, lab
<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/NCBI_search_all_count/>, "NCBI_search_all_count"
<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/EBI_search_all_count/>, "EBI_search_all_count"
<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/UniProt_search_all_count/>, "UniProt_search_all_count"
<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/>, "Workflow1"
<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/KEGG_search_all_count/>, "KEGG_search_all_count"

$ asq -r dump.rdf "SELECT * WHERE { ?w a wfdesc:Process ; rdfs:label ?lab ; wf4ever:wsdlURI ?wsu }" -f csv
w, wsu, lab

...

KEGG service:
  http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/KEGG_search_all_count/

What should be it's service URI/value?
  "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI
?

Open http://www.myexperiment.org/workflows/936/versions/2.html in Taverna...

Confirms missing service is http://soap.genome.jp/KEGG.wsdl, used in nested process of "KEGG_search_all_count"

Proposed fix is to add this annotation:

<http://ns.taverna.org.uk/2010/workflowBundle/34ba6e6f-c1fc-4aaa-9fd8-bc4102a3ce68/workflow/Workflow1/processor/KEGG_search_all_count/>
  wf4ever:wsdlURI
    "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI .

...

Adding the annotation: use RODL API from python.  See UpdateROAnnotations.py and DoUpdateROAnnotations_nnnn.py

One DoUpdateROAnnotations_nnnn.py module is created for each RO tpo be tweaked.

...








