# Fixing up KEGG workflow decay evaluation problems

See kegg-workflows.md for overall plan of attack for KEGG workflow decay evaluation.  This file deals with the problematic cases, which in most cases were due to problems with the workflows, conversion service or availability of provenance information.

Script wf_conversion.sh is used to convert the selected workflows (per Kegg-workflows.csv) from www.myExperiment to ROs in RODL, using the Wf-RO service.  The resulting metadata structure is quite dense, and hard to follow.

Wf4Ever test user access token:  972850de-1d98-488d-bd34-a19c9b86eb76

...

WF 3258: missing service detected OK:

    $ ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/ >dump.rdf
    $ asq -r dump.rdf "SELECT * WHERE { ?w a wfdesc:Process ; rdfs:label ?lab ; wf4ever:wsdlURI ?wsu }" -f csv
    wsu, lab, w
    "http://soap.genome.jp/KEGG.wsdl"^^http://www.w3.org/2001/XMLSchema#anyURI, "get_references_by_pathway" <http://ns.taverna.org.uk/2010/workflowBundle/b48e8bbe-00a7-4f7e-8819-b14025f21fd0/workflow/Retrieve_Pubmed_Publ/processor/get_references_by_pathway/>

...

## 1. The fully satisfied should not have passed the test.

Workflows 980 and 936 both have inaccessible kegg services, but in the 
nested workflows. Is this causing the false positive?

Query is:

          ?pr rdf:type wfdesc:Process ;
              rdfs:label ?prlab .
            {
            ?pr wf4ever:serviceURI ?pruri .
            }
          UNION
            {
            ?pr wf4ever:wsdlURI ?pruri .
            }

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

One DoUpdateROAnnotations_nnnn.py module is created for each RO to be tweaked.

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

...

## 2. Potential problem with the RO-ification

Workflows 3108 and 3107 do have input data, both as annotations in the 
workflow and the provenance corpus. But this information is indeed lost 
in the RO and hence failed the assessment.

...

The evaluation fails thus:

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/ :: run_3 // skip: no provenance files present :: 3107 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/, does not satisfy
      Workflow is not present.
      No workflows are described
      No workflow definitions are present
      Input data is not present
    Total pass: 0, fail: 1 out of 1

NOTE: in this case, the workflow description is missing from the RO.  I attempted to re-run the myExperiment->RO conversion process, but this failed because myExperiment would not return an RDF descrtiption for the workflow.

...

Locate missing metadata:

    ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/ >dump.rdf

    (romenv)conina:Kegg-workflow-evaluation graham$ cat dump.rdf 
    <?xml version="1.0" encoding="utf-8"?>
    <rdf:RDF
      xmlns:ns1="http://purl.org/wf4ever/ro#"
      xmlns:ns2="http://purl.org/wf4ever/roevo#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    >
      <ns2:LiveRO rdf:about="http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/">
        <rdf:type rdf:resource="http://purl.org/wf4ever/ro#ResearchObject"/>
      </ns2:LiveRO>
    </rdf:RDF>
    (romenv)conina:Kegg-workflow-evaluation graham$ 

This dump shows an empty RO, hence no defined workflow.

...

The original problem here was that no provenance information was available from which to determine the input data, as required by the wf_conversion script.

        PROVURI=$(get_workflow_provenance $1 $2 $3)
        asq -r $PROVURI -p provenance.prefixes -f TURTLE,"%(portname)s %(valueuri)s\n" \
          " SELECT ?portname ?valueuri ?portname WHERE \
              { ?wfrun a wfprov:WorkflowRun ; \
                prov:used [ tavernaprov:content ?valueuri ; wfprov:describedByParameter ?porturi ] . \
                ?porturi rdfs:label ?portname } " \
          | grep "^Workflow input" \
          | cut -d " " -f 3,4

Then create annotation:

        # Initialize annotation
        cat >00-bundle-inputs.tmp <<[[EOF]]
          @PREFIX roterms: <http://purl.org/wf4ever/roterms#>
    [[EOF]]
        cat >00-bundle-inputs-rdf.tmp <<[[EOF]]
          <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:roterms="http://purl.org/wf4ever/roterms#">
            <rdf:Description rdf:about="$BUNDLEURI">
    [[EOF]]
    
        while read PORTNAME INPUTURI; do
          # echo "Port: $PORTNAME, Value: $(curl --silent $INPUTURI)"
          #
          # Generate annotation in local file
          #
          # ro:wfbundle roterms:inputValue
          #    [ roterms:portName "path_to_input_file" ;
          #      roterms:resource <file:///home/marco/Dropbox/Wf4Ever/Reviews/year 2/Demo/UserMaterial/datasetmarkers_hgvrs487.txt> ]
          #  .
          cat >>00-bundle-inputs.tmp <<[[EOF]]
          $BUNDLEURI roterms:inputValue
            [ roterms:portName "$PORTNAME" ;
              roterms:resource <$INPUTURI> ] .
    [[EOF]]
          cat >>00-bundle-inputs-rdf.tmp <<[[EOF]]
              <roterms:inputValue>
                <rdf:Description>
                  <roterms:portName>$PORTNAME</roterms:portName>
                  <roterms:resource rdf:resource="$INPUTURI" />
                </rdf:Description>
              </roterms:inputValue>
    [[EOF]]
        done <$3
    
        cat >>00-bundle-inputs-rdf.tmp <<[[EOF]]
            </rdf:Description>
          </rdf:RDF>
    [[EOF]]
    
        # Create annotation in RO
        # See: http://www.wf4ever-project.org/wiki/display/docs/RO+SRS+interface+6#ROSRSinterface6-Annotatearesource
        #
        # curl -i -v -X POST $BUNDLEURI \
        #   -H "Link: <$BUNDLEURI>; rel=\"http://purl.org/ao/annotatesResource\"" \
        #   -H "Content-type: text/turtle" -H "Slug: bundle-inputs.ttl" --data @00-bundle-inputs.tmp
        curl --silent -X POST $ROURI \
          -H "Link: <$BUNDLEURI>; rel=\"http://purl.org/ao/annotatesResource\"" \
          -H "Content-type: application/rdf+xml" -H "Slug: bundle-inputs.rdf" \
          --data @00-bundle-inputs-rdf.tmp >00-annotation-body.tmp

...

The attempted fix will be to add the input data details manually, in similar fashion to the previous case.

...

Attempted to re-run the Pack conversion: failed with myExperiment problem (can't retrieve RDF for workflow):

    (romenv)conina:Kegg-workflow-evaluation graham$ curl -H "accept: application/rdf+xml" http://www.myexperiment.org/workflows/3107/versions/1
    <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>303 See Other</title>
    </head><body>
    <h1>See Other</h1>
    <p>The answer to your request is located <a href="http://www.myexperiment.org/workflows/3107/versions/1.rdf">here</a>.</p>
    <hr>
    <address>Apache/2.2.15 (Red Hat) Server at www.myexperiment.org Port 80</address>
    </body></html>
    (romenv)conina:Kegg-workflow-evaluation graham$ curl http://www.myexperiment.org/workflows/3107/versions/1.rdf

    Warning: require_once(xmlfunc.inc.php): failed to open stream: No such file or directory in /home/myexperiment/hg-repos/linkeddata/inc/functions/rdf.inc.php on line 288

    Fatal error: require_once(): Failed opening required 'xmlfunc.inc.php' (include_path='.:/home/myexperiment/hg-repos/linkeddata/inc/:') in /home/myexperiment/hg-repos/linkeddata/inc/functions/rdf.inc.php on line 288
    (romenv)conina:Kegg-workflow-evaluation graham$ 

Giving up on 3107.

...

Try pack 3108 (which, from notes, appears to be a different problem).

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/ ::  :: 3108 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
      Input data is not present
    Total pass: 0, fail: 1 out of 1
    (romenv)conina:Kegg-workflow-evaluation graham$ 

...

    ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/ >dump.rdf

Query:

    ?wfbundle roterms:inputValue ?iv .
    ?iv roterms:portName ?portname .
    {
      ?iv roterms:value ?inputval
    }
    UNION
    {
      ?iv roterms:resource ?inputref
    }

Query confirms checklist result:

    asq -r dump.rdf "SELECT * WHERE { ?wfbundle roterms:inputValue ?iv . ?iv roterms:portName ?portname . { ?iv roterms:value ?inputval } UNION { ?iv roterms:resource ?inputref } }" -f csv
    inputref, iv, portname, inputval, wfbundle

But inputs are defined in wfdesc:

    (romenv)conina:Kegg-workflow-evaluation graham$ asq -r dump.rdf "SELECT * WHERE { ?wfbundle a wfdesc:Workflow ; wfdesc:hasWorkflowDefinition ?wfdef ; rdfs:label ?wflab ; wfdesc:hasInput ?inp . ?inp rdfs:label ?portName }" -f csv
    portName, wfbundle, inp, wfdef, wflab
    "Entrez_ID", <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/>, <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/Entrez_ID>, <http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/root/workflows/main/Create_SNP_Set.wfbundle>, "Create_SNP_Set"
    "path_to_output_file", <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/>, <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/path_to_output_file>, <http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/root/workflows/main/Create_SNP_Set.wfbundle>, "Create_SNP_Set"
    "set_width", <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/>, <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/set_width>, <http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/root/workflows/main/Create_SNP_Set.wfbundle>, "Create_SNP_Set"
    (romenv)conina:Kegg-workflow-evaluation graham$ 

Proposed fix, then, is to add annotations

    <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/>
        roterms:inputValue [ roterms:portName "Entrez_ID" ; roterms:resource <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/Entrez_ID> ] ;
        roterms:inputValue [ roterms:portName "path_to_output_file" ; roterms:resource <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/path_to_output_file> ] ;
        roterms:inputValue [ roterms:portName "set_width" ; roterms:resource <http://ns.taverna.org.uk/2010/workflowBundle/944b8dbc-d6c8-4199-98a3-538b40d9f142/workflow/Create_SNP_Set/in/set_width> ] ;

Fixed:

    (romenv)conina:Kegg-workflow-evaluation graham$ python DoUpdateROAnnotations_3108.py 
    INFO:rdflib:RDFLib Version: 4.0.1
    INFO:UpdateROAnnotations:UpdateAnnotation:
    INFO:UpdateROAnnotations:-- resuri:  http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/
    INFO:UpdateROAnnotations:-- rouri:   http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/
    INFO:UpdateROAnnotations:-- bodyuri: http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/wfdesc-extras.rdf
    INFO:UpdateROAnnotations:-- Updated annotation body (http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/wfdesc-extras.rdf)

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/ ::  :: 3108 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    Total pass: 0, fail: 1 out of 1
    (romenv)conina:Kegg-workflow-evaluation graham$ 

...

## 3. No inputs were actually required for a workflow.

This applies to workflows 3001, 2021, 987, and 967. These workflows do 
not require inputs. But the assessment code seem not detect the difference.

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/ ::  :: 967 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>list_databases</i></a>
      Input data is not present
    Total pass: 0, fail: 1 out of 1
    (romenv)conina:Kegg-workflow-evaluation graham$ 

...

    (romenv)conina:Kegg-workflow-evaluation graham$ ro dump http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/ >dump.rdf
    WARNING:rocommand.ROSRS_Session:getROResourceAnnotationGraph: http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/bundle-inputs.rdf has unrecognized content-type: text/plain

Check for wfdesc annotations:

    (romenv)conina:Kegg-workflow-evaluation graham$ asq -r dump.rdf "SELECT * WHERE { ?wfbundle a wfdesc:Workflow ; wfdesc:hasWorkflowDefinition ?wfdef ; rdfs:label ?wflab ; wfdesc:hasInput ?inp . ?inp rdfs:label ?portName }" -f csv
    inp, wfdef, wflab, portName, wfbundle
    (romenv)conina:Kegg-workflow-evaluation graham$ 
    (romenv)conina:Kegg-workflow-evaluation graham$ asq -r dump.rdf "SELECT * WHERE { ?wfbundle a wfdesc:Workflow ; wfdesc:hasWorkflowDefinition ?wfdef ; rdfs:label ?wflab }" -f csv
    wfbundle, wflab, wfdef
    <http://ns.taverna.org.uk/2010/workflowBundle/1cf7b8aa-ae12-4327-aa90-4f889697a410/workflow/Workflow11/>, "Workflow11", <http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/root/workflows/main/Workflow11.wfbundle>
    (romenv)conina:Kegg-workflow-evaluation graham$ 

...

Update checklist definition to check for wfdesc inputs (see &lt;forall&gt; clause added):

    <minim:Requirement rdf:about="#RO_has_inputdata">
      <minim:isDerivedBy>
        <minim:ContentMatchRequirementRule>
          <minim:exists___>
          <minim:forall>
              ?wf a wfdesc:Workflow ; wfdesc:hasInput ?inp .
          </minim:forall>
          <minim:exists>
              ?wfbundle roterms:inputValue ?iv .
              ?iv roterms:portName ?portname .
              {
                ?iv roterms:value ?inputval
              }
              UNION
              {
                ?iv roterms:resource ?inputref
              }
          </minim:exists>
          <minim:showmiss>Workflow uses no inputs</minim:showmiss>
          <minim:showpass>Input data is present</minim:showpass>
          <minim:showfail>Input data is not present</minim:showfail>
          <minim:derives rdf:resource="#RO_has_inputdata" />
        </minim:ContentMatchRequirementRule>
      </minim:isDerivedBy>
      <minim:seq>030</minim:seq>
    </minim:Requirement>

Seems to work:

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/ ::  :: 967 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>list_databases</i></a>
      Workflow uses no inputs
    Total pass: 0, fail: 1 out of 1

# Re-run full evaluation with fix-ups

Note: WF 3107 has not been re-evaluated, as it was not possible to re-run the WF conversion process due to a problem with the WF stored at www.myexperiment.  See notes above.

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/ ::  :: 3258 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_references_by_pathway</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/ ::  :: 3108 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/ :: skip: can't re-run conversion (was no provenance files present run3 added) :: 3107 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3086/ ::  :: 3086 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3086/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_genes_by_pathway</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3062/ ::  :: 3062 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3062/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_enzymes_by_gene</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3001/ ::  :: 3001 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3001/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_enzymes_by_gene</i></a>
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2805/ ::  :: 2805 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2805/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>convertToKEGGid</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2843/ ::  :: 2843 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2843/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>convertToKEGGid</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2673/ :: run_2 :: 2673 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2673/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2658/ :: skip: no RDF at myExperiment URI - 401 Unauthorized :: 2658 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2659/ ::  :: 2659 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2659/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2021/ ::  :: 2021 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2021/, does not satisfy
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1990/ ::  :: 1990 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1990/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1237/ :: run1 run2 :: 1237 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1237/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1189/ :: skip: incorrect link/filename in RDF from www.myExperiment [run1] :: 1189 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1120/ :: skip: incorrect link/filename in RDF from www.myExperiment [run1] :: 1120 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1118/ :: run1 :: 1118 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1118/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_pathways_by_genes</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1099/ :: run1 run2 :: 1099 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1099/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_987/ :: run1 :: 987 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_987/, does not satisfy
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/ :: run1 :: 980 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>KEGG_namespaces</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_977/ :: run1 :: 977 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_977/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bfind</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/ ::  :: 967 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>list_databases</i></a>
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/ ::  :: 936 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>KEGG_search_all_count</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_786/ :: skip: workflow SCUFL format :: 786 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_778/ ::  :: 778 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_778/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>getCommonPathways</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_738/ :: skip: workflow SCUFL format :: 738 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_730/ :: skip: workflow SCUFL format :: 730 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_611/ :: skip: workflow SCUFL format :: 611 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_525/ :: skip: workflow SCUFL format :: 525 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_524/ :: skip: workflow SCUFL format :: 524 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_523/ :: skip: workflow SCUFL format :: 523 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_522/ :: skip: workflow SCUFL format :: 522 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_520/ :: skip: workflow SCUFL format :: 520 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_519/ :: skip: workflow SCUFL format :: 519 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_518/ :: skip: workflow SCUFL format :: 518 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_511/ :: skip: workflow SCUFL format :: 511 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_510/ :: skip: workflow SCUFL format :: 510 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_503/ :: skip: workflow SCUFL format :: 503 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_502/ :: skip: workflow SCUFL format :: 502 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_501/ :: skip: workflow SCUFL format :: 501 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_499/ :: skip: workflow SCUFL format :: 499 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_494/ :: skip: workflow SCUFL format :: 494 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_493/ :: skip: workflow SCUFL format [run1] :: 493 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_98/ :: skip: workflow SCUFL format [run1] :: 98 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3300/ ::  :: 3300 -----
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3300/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    Total pass: 0, fail: 21 out of 21
    (romenv)conina:Kegg-workflow-evaluation graham$ 



