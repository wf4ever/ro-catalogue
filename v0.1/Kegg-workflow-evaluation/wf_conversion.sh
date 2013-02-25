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

ROSRS_URI="http://sandbox.wf4ever-project.org/rodl/ROs/"
ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"
# WF_RO_URI="http://sandbox.wf4ever-project.org/wf-ro/translate/jobs"
WF_RO_URI="http://sandbox.wf4ever-project.org/wf-ro/jobs/"
ROBASE=http://sandbox.wf4ever-project.org/rodl/ROs

function retrieve_T2_URI {
    # Use CURL to retrieve RDF for myExperiment referenced by URI (Appendix D)
    # @@NOTE: Rather than use CURL, have just appended .rdf to the pack URI
    # Use ASQ to extract URI of T2Flow resource in myExperiment (Appendix D)
    #
    # $1  is URI of myExperiment pack to query
    #
    # echo "retrieve_T2_URI ($1)"
    asq -r $1.rdf \
          -p myExperiment.prefixes \
          -f "%(t2flow)s" \
          "SELECT * WHERE { ?myexp rdf:type mecontrib:WorkflowVersion ; mebase:content-url ?t2flow }"
    return
}

function make_workflow_pack {
    # Use Wf-RO service via CURL to convert Taverna WF to new style pack in alpha.myExperiment (Appendix C)
    #
    # $1  Taverna workflow (.t2flow) URI
    # $2  Research Object URI
    #
    rm 00*.tmp
    echo "make_workflow_pack ($1 $2)"
    cat >00_wf_ro_post_data.tmp <<[[EOF]]
      {
       "resource": "$1"
       "format": "application/vnd.taverna.t2flow+xml"
       "ro": "$2"
       "token": "$ROSRS_ACCESS_TOKEN"
      }
[[EOF]]
    cat >00_curl_command.tmp <<[[EOF]]
    curl $WF_RO_URI -X POST \
         --silent --dump-header 00_wf_ro_headers.tmp --output 00_wf_ro_output.tmp \
         --data-binary 00_wf_ro_post_data.tmp --header "Content-type: application/json"
[[EOF]]
    echo "** curl command: **"
    cat 00_curl_command.tmp
    echo "**"
    `cat 00_curl_command.tmp`
    echo "** headers returned: **"
    cat 00_wf_ro_headers.tmp
    echo "**"
    JOBURI=`awk '/^Location:/ {print $2}' <00_wf_ro_headers.tmp`
    echo "** JOB URI: $JOBURI **"
    # Wait for conversion to be done
    #while [ $? == 0 ]; do
    #  sleep 2s
    #  curl $JOBURI | grep "\"status\":.*\"running\""
    #done
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
    echo "get_workflow_inputs ($@)"
    return
}

function annotate_wf_inputs {
    # Add annotation via CURL to new RO describing inputs (Appendix B)
    echo "annotate_wf_inputs ($@)"
    return
}

for PACK in `cat Kegg-workflows.csv | head -n 1`; do
    # Split URI from following stuff separated by ','
    # For next, see: http://stackoverflow.com/a/6583589
    read URI OPT <<<$(IFS=","; echo $PACK)
    PACKID=$(cut -f 5 -d '/' <<<$(echo $URI))
    ROURI="$ROBASE/myexperiment_pack_$PACKID"

    echo "$URI :: $OPT :: $PACKID"

    T2URI=$(retrieve_T2_URI $URI)

    make_workflow_pack $T2URI $ROURI

    WFINPUTS=$(get_workflow_inputs $PACKID)

    annotate_wf_inputs $ROURI $WFINPUTS

done
