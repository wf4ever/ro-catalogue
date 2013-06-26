#!/usr/bin/env python


import os, os.path
import sys
import logging
import json
import re
import StringIO
import httplib
import urlparse
import rdflib, rdflib.graph

if __name__ == "__main__":
    # Add RO-manager library directory to path
    sys.path.insert(0, "../../../wf4ever-ro-manager/src/rocommand")
    logging.basicConfig(level=logging.DEBUG)

from ro_namespaces import RDF, RDFS, ORE, RO, DCTERMS, AO
from ROSRS_Session import ROSRS_Error, ROSRS_Session, getResourceUri

# Logging object
log = logging.getLogger(__name__)

# Configuration

# RODL servicve:
ROSRS_API_URI = "http://sandbox.wf4ever-project.org/rodl/ROs/"

# Wf4Ever test user:
#ROSRS_ACCESS_TOKEN = "972850de-1d98-488d-bd34-a19c9b86eb76"
ROSRS_ACCESS_TOKEN = "3c7483ac-e157-4cb3-97d5-8cf6e129f8e9"

# Annotations to add

RO_NAME = "Kegg-workflow-evaluation-1"
RO_PATH = RO_NAME+"/"
RES_PATH = "."
ANNOTATION_PATH = "UpdateROAnnotations-extras.rdf"
ANNOTATION_BODY = """<?xml version="1.0" encoding="UTF-8"?>
    <rdf:RDF
       xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
       xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    >
      <rdf:Description rdf:about=".">
          <rdfs:comment>Test annotation</rdfs:comment>
      </rdf:Description>
    </rdf:RDF>
    """
ANNOTATION_EMPTY = """<?xml version="1.0" encoding="UTF-8"?>
    <rdf:RDF
       xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    >
    </rdf:RDF>
    """

# Function to add annotation

def updateAnnotation(rosrs, rouri, resuri, bodypath, bodycontent):
    bodyuri = getResourceUri(rouri, bodypath)
    log.info("UpdateAnnotation:")
    log.info("-- resuri:  %s"%(resuri))
    log.info("-- rouri:   %s"%(rouri))
    log.info("-- bodyuri: %s"%(bodyuri))
    # If annotation is not aggregated in RO, add it
    (status, reason, headers, uri, data) = rosrs.getROResource(bodyuri, rouri)
    log.debug("Get annotation %s: %03d %s"%(bodyuri, status, reason))
    if status == 404:
        (status, reason, proxyuri, newbodyuri) = rosrs.aggregateResourceInt(
            rouri, bodypath, ctype="application/RDF+XML", body=ANNOTATION_EMPTY)
        assert status == 201, "Aggregating annotation body %s - status %03d %s"%(bodyuri, status, reason)
        assert newbodyuri == bodyuri, (
            "Aggregated annotation URI mismatch %s (expected %s)"%(newbodyuri, bodyuri))
        log.info("-- Created empty annotation body (%s)"%(bodyuri))
    # If annotation stub does not exist, create new
    bodyuris = list(rosrs.getROAnnotationBodyUris(rouri, resuri))
    log.debug("--- bodyuris:\n"+"\n".join([repr(u) for u in bodyuris]))
    if not bodyuri in bodyuris:
        (status, reason, annuri) = rosrs.createROAnnotationExt(rouri, resuri, bodyuri)
        assert status == 201, "Creating annotation stub for %s - status %03d %s"%(bodyuri, status, reason)
        log.info("-- Created annotation stub for resource (%s) with body (%s)"%(resuri, bodyuri))
    # Replace annotation body
    (status, reason, headers, data) = rosrs.doRequest(bodyuri,
        method="PUT", ctype="application/RDF+XML", body=bodycontent)
    assert status in [200,201], "Updating annotation body %s - status %03d %s"%(bodyuri, status, reason)
    log.info("-- Updated annotation body (%s)"%(bodyuri))
    return

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
