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
