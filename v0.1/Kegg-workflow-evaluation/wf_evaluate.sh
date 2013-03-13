CHECKLIST_URI=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation/Runnable-workflow-checklist.rdf
RO_URI=http://sandbox.wf4ever-project.org/rodl/ROs/Pack390/

EVAL_URI=
EVAL_JSON=
EVAL_HTML="http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_html?minim=$CHECKLIST_URI&purpose=wf-runnable&RO=$RO_URI"

echo "Evaluation as HTML: $EVAL_HTML"

# See: http://johnattebury.com/blog/2011/06/spidermonkey-jsawk-resty-on-snow-leopard/

while read PACK; do
    # Split URI from following stuff separated by ','
    # For next, see: http://stackoverflow.com/a/6583589
    read URI OPT <<<$(IFS=","; echo $PACK)
    PACKID=$(cut -f 5 -d '/' <<<$(echo $URI))
    ROURI="$ROBASE/myexperiment_pack_$PACKID/"
    MINIMURI=http://sandbox.wf4ever-project.org/rodl/ROs/Kegg-workflow-evaluation/Runnable-workflow-checklist.rdf

    echo "----- $ROURI :: $OPT :: $PACKID -----"

    echo "RO evaluation run: $(date)" >00-evaluate-ROs

    if [ "${OPT:0:4}" != "skip" ]; then

      # checklist eval ...
      curl --dump-header 00_eval_ro_headers.tmp --output 00_eval_ro_output.tmp \
           "http://sandbox.wf4ever-project.org/roevaluate/evaluate/trafficlight_json?RO=$ROURI&minim=$MINIMURI&purpose=wf-runnable"

      grep ""

    fi
