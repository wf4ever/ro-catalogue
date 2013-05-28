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

WF980 (same problem)

Download from myExp 

Taverna shows problems in KEGG_Namespaces/list_databases and Query_KEGG_by_namespace/bfind

Proposed fix is to add these annotations:

<http://ns.taverna.org.uk/2010/workflowBundle/48e5ac9d-6f92-467e-b901-da2c14c4b886/workflow/Workflow17/processor/KEGG_namespaces/>
  wf4ever:wsdlURI
    "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI .
<http://ns.taverna.org.uk/2010/workflowBundle/48e5ac9d-6f92-467e-b901-da2c14c4b886/workflow/Workflow17/processor/Query_KEGG_by_namespace/>
  wf4ever:wsdlURI
    "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI .


[[
(romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/ ::  :: 980 -----
http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/, fully satisfies
Total pass: 1, fail: 0 out of 1
(romenv)conina:Kegg-workflow-evaluation graham$ 
(romenv)conina:Kegg-workflow-evaluation graham$ 
(romenv)conina:Kegg-workflow-evaluation graham$ python DoUpdateROAnnotations_0980.py 
INFO:rdflib:RDFLib Version: 4.0.1
INFO:UpdateROAnnotations:UpdateAnnotation:
INFO:UpdateROAnnotations:-- resuri:  http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/
INFO:UpdateROAnnotations:-- rouri:   http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/
INFO:UpdateROAnnotations:-- bodyuri: http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/wfdesc-extras.rdf
INFO:UpdateROAnnotations:-- Created empty annotation body (http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/wfdesc-extras.rdf)
Traceback (most recent call last):
  File "DoUpdateROAnnotations_0980.py", line 75, in <module>
    updateAnnotation(rosrs, rouri, resuri, ANNOTATION_PATH, ANNOTATION_BODY)
  File "/usr/workspace/wf4ever-ro-catalogue/v0.1/Kegg-workflow-evaluation/UpdateROAnnotations.py", line 78, in updateAnnotation
    (status, reason, annuri) = rosrs.createROAnnotationExt(rouri, resuri, bodyuri)
  File "../../../wf4ever-ro-manager/src/rocommand/ROSRS_Session.py", line 590, in createROAnnotationExt
    (status, reason, annuri) = self.createROAnnotation(rouri, resuri, bodyuri)
  File "../../../wf4ever-ro-manager/src/rocommand/ROSRS_Session.py", line 569, in createROAnnotation
    "%03d %s (%s)"%(status, reason, str(resuri)))
ROSRS_Session.ROSRS_Error: Error creating annotation for http://sandbox.wf4ever-project.org/rodl/ROs/: '500 Internal Server Error (http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/)'
(romenv)conina:Kegg-workflow-evaluation graham$ python DoUpdateROAnnotations_0980.py 
INFO:rdflib:RDFLib Version: 4.0.1
INFO:UpdateROAnnotations:UpdateAnnotation:
INFO:UpdateROAnnotations:-- resuri:  http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/
INFO:UpdateROAnnotations:-- rouri:   http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/
INFO:UpdateROAnnotations:-- bodyuri: http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/wfdesc-extras.rdf
INFO:UpdateROAnnotations:-- Updated annotation body (http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/wfdesc-extras.rdf)
(romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/ ::  :: 980 -----
http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/, does not satisfy
  One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>KEGG_namespaces</i></a>
Total pass: 0, fail: 1 out of 1
(romenv)conina:Kegg-workflow-evaluation graham$ 
]]




