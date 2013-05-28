#!/usr/bin/env python

import sys
import logging

if __name__ == "__main__":
    # Add RO-manager library directory to path
    sys.path.insert(0, "../../../wf4ever-ro-manager/src/rocommand")
    logging.basicConfig(level=logging.INFO)

from ROSRS_Session import ROSRS_Error, ROSRS_Session, getResourceUri

from UpdateROAnnotations import ROSRS_API_URI, ROSRS_ACCESS_TOKEN, updateAnnotation

# Logging object
log = logging.getLogger(__name__)

# Annotations to add

RO_NAME = "myexperiment_pack_980"
RO_PATH = RO_NAME+"/"
RES_PATH = "."
ANNOTATION_PATH = "wfdesc-extras.rdf"
ANNOTATION_BODY = """<?xml version="1.0" encoding="UTF-8"?>

    <!DOCTYPE rdf:RDF [
        <!ENTITY BUNDLE "http://ns.taverna.org.uk/2010/workflowBundle/48e5ac9d-6f92-467e-b901-da2c14c4b886/" >
    ]>

    <rdf:RDF
       xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
       xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
       xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
       xmlns:owl="http://www.w3.org/2002/07/owl#"
       xmlns:cnt="http://www.w3.org/2011/content#"
       xmlns:rdfg="http://www.w3.org/2004/03/trix/rdfg-1/"
       xmlns:skos="http://www.w3.org/2004/02/skos/core#"
       xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:dcterms="http://purl.org/dc/terms/"
       xmlns:cc="http://web.resource.org/cc/"
       xmlns:foaf="http://xmlns.com/foaf/0.1/"
       xmlns:sioc="http://rdfs.org/sioc/ns#"
       xmlns:ore="http://www.openarchives.org/ore/terms/"
       xmlns:ao="http://purl.org/ao/"
       xmlns:doap="http://usefulinc.com/ns/doap#"
       xmlns:prov="http://www.w3.org/ns/prov#"
       xmlns:ro="http://purl.org/wf4ever/ro#"
       xmlns:roterms="http://purl.org/wf4ever/roterms#"
       xmlns:rouser="http://purl.org/wf4ever/rouser#"
       xmlns:wfdesc="http://purl.org/wf4ever/wfdesc#"
       xmlns:wfprov="http://purl.org/wf4ever/wfprov#"
       xmlns:scufl2="http://ns.taverna.org.uk/2010/scufl2#"
       xmlns:tavernaprov="http://ns.taverna.org.uk/2012/tavernaprov/"
       xmlns:wf4ever="http://purl.org/wf4ever/wf4ever#"
    >
      <rdf:Description
        rdf:about="&BUNDLE;workflow/Workflow17/processor/KEGG_namespaces/">
          <wf4ever:wsdlURI rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">http://soap.genome.jp/KEGG.wsdl</wf4ever:wsdlURI>
      </rdf:Description>
      <rdf:Description
        rdf:about="&BUNDLE;workflow/Workflow17/processor/Query_KEGG_by_namespace/">
          <wf4ever:wsdlURI rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">http://soap.genome.jp/KEGG.wsdl</wf4ever:wsdlURI>
      </rdf:Description>
    </rdf:RDF>
    """

# Main program script

if __name__ == "__main__":
    # Set up ROSRS session and key values
    rosrs   = ROSRS_Session(ROSRS_API_URI, accesskey=ROSRS_ACCESS_TOKEN)
    rouri   = getResourceUri(ROSRS_API_URI, RO_PATH)
    resuri  = getResourceUri(rouri, RES_PATH)
    # Add annotation
    updateAnnotation(rosrs, rouri, resuri, ANNOTATION_PATH, ANNOTATION_BODY)
    # Finish up
    rosrs.close()
