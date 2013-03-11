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
    # Is sending wrong content-type
    # See: http://stackoverflow.com/questions/13484478/curl-per-file-content-type-for-multipart-post-youtube-api
    #
    rm 00*.tmp
    echo "make_workflow_pack"
    echo "  T2flow: $1"
    cat >00_wf_ro_post_data.tmp <<[[EOF]]
      {
       "resource": "$1",
       "format": "application/vnd.taverna.t2flow+xml",
       "ro": "$2",
       "token": "$ROSRS_ACCESS_TOKEN"
      }
[[EOF]]

    ###set -x
    ###echo "** curl command: **"
    curl $WF_RO_URI -X POST \
         --silent \
         --dump-header 00_wf_ro_headers.tmp --output 00_wf_ro_output.tmp \
         --header "Content-Type: application/json" --data @00_wf_ro_post_data.tmp
         ###--trace-ascii - \
    ###echo "** headers returned: **"
    ###cat 00_wf_ro_headers.tmp
    ###echo "**"
    JOBURI=`awk '/^Location:/ { gsub(/\r/,"") ; printf "%s", $2 }' <00_wf_ro_headers.tmp`
    echo "  Wf-RO JOB URI: $JOBURI"
    # Wait for conversion to be done
    curl --silent $JOBURI | grep "\"status\":\"RUNNING\"" > /dev/null
    while [ $? == 0 ]; do
      sleep 3s
      echo -n "."
      curl --silent $JOBURI | grep "\"status\":\"RUNNING\"" > /dev/null
    done
    echo
    curl --silent $JOBURI | grep "\"status\":\"DONE\"" > /dev/null
    if [ $? == 0 ]; then
      echo "  RO created: $2"
    else
      echo "  RO failed creation"
      curl --silent $JOBURI
    fi
    ###set +x
    return
}

function get_workflow_provenance {
    # Isolate details of WF inputs values and/or references and corresponding ports.
    # This information will be extracted from the provenance corpus saved in GitHub (see Appendix F).
    # - The Github data can be located by extracting the myExperiment pack number NNN and version VVV 
    #   from the incoming URI, and using that to construct a path to the provenance data 
    #   provenance-corpus/Taverna_kegg_wf/workflow_NNN_version_VVV.
    # - Some workflows in github contain more than one run: 
    #   some additional inspection and annotation may be needed to determine which run(s) are used.
    #
    # $1 = pack id (number from myExperiment)
    # $2 = version number in pack URI in Github
    # $3 = option for selection of W/F run to use
    #
    # Provenance URI is returned in stdout
    #
    # echo "get_workflow_provenance ($@)"
    PACKID=$1
    VERNUM=$2
    #KEGG_PROV_PAG_BASE="http://github.com/wf4ever/provenance-corpus/tree/master/Taverna_kegg_wf"
    #KEGG_PROV_RAW_BASE="https://raw.github.com/wf4ever/provenance-corpus/master/Taverna_kegg_wf"
    KEGG_PROV_PAG_BASE="http://github.com/wf4ever/provenance-corpus/tree/fixprov/Taverna_kegg_wf"
    KEGG_PROV_RAW_BASE="https://raw.github.com/wf4ever/provenance-corpus/fixprov/Taverna_kegg_wf"
    # ${KEGG_PROV_PAG_BASE}/workflow_${PACKID}_version_1/run${RUNNUM}/workflowrun.prov.ttl
    # ${KEGG_PROV_RAW_BASE}/workflow_${PACKID}_version_1/run${RUNNUM}/workflowrun.prov.ttl
    # May reference other files in the same directory; e.g. tavernaprov:content <pathway_descriptions.txt>
    RUNNUM=run_1
    if [ "${3:0:3}" == "run" ]; then
      RUNNUM=$3
    fi
    PROVURI="${KEGG_PROV_RAW_BASE}/workflow_${PACKID}_version_${VERNUM}/${RUNNUM}/workflowrun.prov.ttl"
    curl --silent --head $PROVURI | grep "HTTP/1.1 200 OK" >/dev/null
    if [ $? != 0 ]; then
      echo "** No provenance found for pack $PACKID ($PROVURI) **"
    else
      echo $PROVURI
    fi
    return
}

function get_workflow_inputs {
    # Isolate details of WF inputs values and/or references and corresponding ports.
    # This information will be extracted from the provenance corpus saved in GitHub (see Appendix F).
    #
    # $1 = pack id (number from myExperiment)
    # $2 = version number in pack URI in Github
    # $3 = option for selection of W/F run to use
    #
    # Returns via stdout a list of lines containing:
    #   portname contenturi
    #
    # echo "get_workflow_inputs ($@)"
    PROVURI=$(get_workflow_provenance $1 $2 $3)
    asq -r $PROVURI -p provenance.prefixes -f TURTLE,"%(portname)s %(valueuri)s\n" \
      " SELECT ?portname ?valueuri ?portname WHERE \
          { ?wfrun a wfprov:WorkflowRun ; \
            prov:used [ tavernaprov:content ?valueuri ; wfprov:describedByParameter ?porturi ] . \
            ?porturi rdfs:label ?portname } " \
      | grep "^Workflow input" \
      | cut -d " " -f 3,4
    return
}

function annotate_wf_inputs {
    # Add annotation via CURL to new RO describing inputs (Appendix B)
    #
    # $1 = URI OF ROP top annotate
    # $2 = name of file containing 'portname inputuri' for each WF input
    #
    echo "annotate_wf_inputs ($@)"
    # cat $2
    while read PORTNAME INPUTURI; do
      echo "Port: $PORTNAME, Value: $(curl --silent $INPUTURI)"
    done <$2
    return
}

echo "New run" >00-trace.log

# for PACK in `cat Kegg-workflows.csv | head -n 1`; do
# for PACK in `cat Kegg-workflows.csv`; do
while read PACK; do
    # Split URI from following stuff separated by ','
    # For next, see: http://stackoverflow.com/a/6583589
    read URI OPT <<<$(IFS=","; echo $PACK)
    PACKID=$(cut -f 5 -d '/' <<<$(echo $URI))
    VERNUM=$(cut -f 7 -d '/' <<<$(echo $URI))
    ROURI="$ROBASE/myexperiment_pack_$PACKID/"

    echo "----- $URI :: $OPT :: $PACKID -----"

    if [ "${OPT:0:4}" != "skip" ]; then

      # T2URI=$(retrieve_T2_URI $URI)

      # make_workflow_pack $T2URI $ROURI

      # For testing...
      PROVURI=$(get_workflow_provenance $PACKID $VERNUM $OPT)
      # echo "--- $PROVURI"

      #WFINPUTS=$(get_workflow_inputs $PACKID $VERNUM $OPT)
      #echo "--- $WFINPUTS"
      get_workflow_inputs $PACKID $VERNUM $OPT >00-wfinputs.tmp

      annotate_wf_inputs $ROURI 00-wfinputs.tmp

      # echo "--- $ROURI" >>00-trace.log
      # echo "$WFINPUTS"  >>00-trace.log
      # echo "--- --- --- ---"

      # break

    fi

done <Kegg-workflows-3108.csv 
