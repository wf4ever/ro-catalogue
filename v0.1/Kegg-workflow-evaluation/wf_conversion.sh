#!/bin/bash
#
# This script drives conversion of www.myExperiment.org packs into
# alpha.myexperiment.org Research Object format with annotations that 
# allow for detection of decay caused by services or required input 
# resources becoming unavailable.
#
# In addition to the usual linux utilities, the script uses curl and asq
# (https://pypi.python.org/pypi/asqc)
#

ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs

function retrieve_T2_URI {
    # Use CURL with content negotiation to retrieve RDF for myExperiment referenced by URI (Appendix D)
    # Use ASQ to extract URI of T2Flow resource in myExperiment (Appendix D)
    return
}

function make_workflow_pack {
    # Use Wf-RO service via CURL to convert Taverna WF to new style pack in alpha.myExperiment (Appendix C)
    return
}

function get_workflow_inputs {
    # Isolate details of WF inputs values and/or references and corresponding ports.
    # This information will be extracted from the provenance corpus saved in GitHub (see Appendix F).
    # - The Github data can be located by extracting the myExperiment pack number NNN and version VVV 
    #   from the incoming URI, and using that to construct a path to the provenance data 
    #   provenance-corpus/Taverna_kegg_wf/workflow_NNN_version_VVV.
    # - Some workflows in github contain more than one run: 
    #   some additional inspection and annotation may be needed to determine which run(s) are used.
    return
}

function annotate_wf_inputs {
    # Add annotation via CURL to new RO describing inputs (Appendix B)
    return
}

for PACK in `cat Kegg-workflows.csv`; do
    # Split URI from following stuff separated by ','
    # For next, see: http://stackoverflow.com/a/6583589
    read URI OPT <<<$(IFS=","; echo $PACK)
    PACKID=$(cut -f 5 -d '/' <<<$(echo $URI))
    ROURI="$ROBASE/myexperiment_pack_$PACKID"

    # echo "$URI :: $OPT :: $PACKID"

    T2URI=$(retrieve_T2_URI $URI)

    make_workflow_pack $T2URI $ROURI

    WFINPUTS=$(get_workflow_inputs $PACKID)

    annotate_wf_inputs $ROURI $WFINPUTS

done
