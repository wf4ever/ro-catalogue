#!/bin/bash

# This shell script contains an example of how to invoke the checklist REST service
#
# This is the full HATEOAS interaction 
# (http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven)
#
# For simplicity, many of the test scripts used 
# short-circuit the service document and use prior knowledge of the service URI 
# structure.  Applicatiuons are recommended to use the full procedure shown here
# (coded in the appropriate language, of course).
#

# Timbus-demo version

# CHECKLIST_SERVICE="http://localhost:8080"
CHECKLIST_SERVICE="http://sandbox.wf4ever-project.org/roevaluate"
CHECK_RO="http://alpha2.myexperiment.org/rodl/ROs/Pack5/"
# CHECK_MINIM="file:///usr/workspace/wf4ever-ro-catalogue/v0.1/Timbus-demo-test/Timbus-demo-minim.ttl"
CHECK_MINIM="http://wf4ever.github.io/ro-catalogue/v0.1/Timbus-demo-test/Timbus-demo-minim.rdf"
CHECK_PURPOSE="complete"

# Retrieve service description and extract the URI template

echo "==== Retrieve URI template for evaluate checklist ===="

# Use the ASQC utility (https://pypi.python.org/pypi/asqc) to extract a
# service URI template from the service description
TEMPLATE_EVAL=`asq -r $CHECKLIST_SERVICE/ -f "%(urit)s" \
          "SELECT ?urit WHERE {?s roe:checklist ?urit}"`

TEMPLATE_HTML=`asq -r $CHECKLIST_SERVICE/ -f "%(urit)s" \
          "SELECT ?urit WHERE {?s roe:trafficlight_html ?urit}"`

TEMPLATE_JSON=`asq -r $CHECKLIST_SERVICE/ -f "%(urit)s" \
          "SELECT ?urit WHERE {?s roe:trafficlight_json ?urit}"`

# This is an alternative approximate method that uses curl and sed to 
# extract the URI template
TEMPLATE_ALT=`curl -H "accept: text/turtle" $CHECKLIST_SERVICE/ | \
              sed -n 's/^.*roe:checklist[ ]*"\([^"]*\)".*$/\1/p'`

echo "==== EVAL Template: <$TEMPLATE_EVAL>"
echo "==== HTML template: <$TEMPLATE_HTML>"
echo "==== JSON template: <$TEMPLATE_JSON>"

# URI template expansion
# This is performed using an auxilliary service provide by the 
# checklist evaluation server
echo "==== Request URI-template expansion ===="
cat >00-sample-params.tmp <<END
{
  "template": "$TEMPLATE_HTML",
  "params":
  {
    "RO":      "$CHECK_RO",
    "minim":   "$CHECK_MINIM",
    "purpose": "$CHECK_PURPOSE"
  }
}
END
# Just the URI path is returned: append it to the service URI
CHECK_EVALURI=$CHECKLIST_SERVICE`curl -X POST --data @00-sample-params.tmp $CHECKLIST_SERVICE/uritemplate`
rm 00-sample-params.tmp

echo "==== URI: $CHECK_EVALURI"

# Now invoke the checklist evaluation service.

# echo "==== Request evaluation result with parameters, as RDF/Turtle ===="
# curl -H "accept: text/turtle" $CHECK_EVALURI

# echo "==== Request evaluation result with parameters, as RDF/XML ===="
# curl -H "accept: application/rdf+xml" $CHECK_EVALURI

# End.
