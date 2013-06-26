# Scholarly quality assessment

Assess the quality of a collection of workflows pointed by the Kegg-workflows.csv file using the checklist at http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation/Runnable-workflow-checklist.rdf.


## To reproduce the assessment presented in the paper

    ./wf_evaluate.sh

(Updated 2013-06-26) Expected output:

    (romenv)conina:Kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/ ::  :: 3258 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3258/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_references_by_pathway</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/ ::  :: 3108 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3108/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/ :: run_3 :: 3107 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3107/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_compounds_by_reaction</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3086/ ::  :: 3086 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3086/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3086/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_genes_by_pathway</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3062/ ::  :: 3062 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3062/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3062/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_enzymes_by_gene</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3001/ ::  :: 3001 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3001/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3001/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_enzymes_by_gene</i></a>
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2805/ ::  :: 2805 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2805/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2805/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>convertToKEGGid</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2843/ ::  :: 2843 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2843/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2843/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>convertToKEGGid</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2673/ :: run_2 :: 2673 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2673/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2673/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2658/ :: skip: no RDF at myExperiment URI - 401 Unauthorized :: 2658 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2659/ ::  :: 2659 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2659/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2659/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2021/ ::  :: 2021 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2021/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_2021/, does not satisfy
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1990/ ::  :: 1990 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1990/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1990/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1237/ :: run1 run2 :: 1237 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1237/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1237/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1189/ :: skip: incorrect link/filename in RDF from www.myExperiment [run1] :: 1189 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1120/ :: skip: incorrect link/filename in RDF from www.myExperiment [run1] :: 1120 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1118/ :: run1 :: 1118 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1118/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1118/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>get_pathways_by_genes</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1099/ :: run1 run2 :: 1099 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1099/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_1099/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>btit</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_987/ :: run1 :: 987 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_987/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_987/, does not satisfy
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/ :: run1 :: 980 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_980/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>KEGG_namespaces</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_977/ :: run1 :: 977 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_977/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_977/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bfind</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/ ::  :: 967 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_967/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>list_databases</i></a>
      Workflow uses no inputs
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/ ::  :: 936 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_936/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>KEGG_search_all_count</i></a>
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_786/ :: skip: workflow SCUFL format :: 786 -----
    ----- http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_778/ ::  :: 778 -----
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_778/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
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
    http://localhost:8080/evaluate/trafficlight_json?RO=http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3300/&minim=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation-4/Runnable-workflow-checklist.rdf&purpose=wf-runnable
    http://sandbox.wf4ever-project.org/rodl/ROs/myexperiment_pack_3300/, does not satisfy
      One or more web services used by one of the workflows are inaccessible, including <a href="http://soap.genome.jp/KEGG.wsdl"><i>bconv</i></a>
    Total pass: 0, fail: 22 out of 22
    (romenv)conina:Kegg-workflow-evaluation graham$ 


(Previous): Expected output:

    (romenv)conina:kegg-workflow-evaluation graham$ ./wf_evaluate.sh 
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
    (romenv)conina:kegg-workflow-evaluation graham$ 

