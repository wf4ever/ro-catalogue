#!/usr/bin/env python

"""
Return result of checklist evaluation

Exit status: 0 = pass, 1 = fail SHOULD, 2 = fail MUST
"""

import sys
import os
import os.path
import StringIO
import json
import re
import optparse
import logging

# Logging object
log = logging.getLogger(__name__)

def run(configbase, options, args):
    """
    Main logic
    """
    status   = 0
    expr = json.load(sys.stdin)
    #log.debug("JSON expr: %s"%(repr(expr)))
    resultclass = expr["evalresultclass"]
    log.debug("JSON resultclass: %s"%(repr(resultclass)))
    for k in resultclass:
        if k == "pass":   break
        if k == "should": status = 1
        if k == "must":   status = 2
    print expr["evalresultlabel"]
    for item in expr["checklistitems"]:
        if not item["itemsatisfied"]:
            print "  %(itemlabel)s"%(item)
    return status

def runCommand(configbase, argv):
    """
    Run program with supplied configuration base directory, Base directory 
    from which to start looking for research objects, and arguments.
    
    Returns exit status.
    """
    logging.basicConfig(level=logging.INFO)
    log.debug("runCommand: configbase %s, argv %s"%(configbase, repr(argv)))
    #(options, args) = parseCommandArgs(argv)
    #if not options or options.debug:
    #    logging.basicConfig(level=logging.DEBUG)
    #status = 2
    #if options:
    #    status  = run(configbase, options, args)
    status = run(configbase, {}, argv)
    return status

def runMain():
    """
    Main program transfer function for setup.py console script
    """
    configbase = os.path.expanduser("~")
    return runCommand(configbase, sys.argv)

if __name__ == "__main__":
    """
    Program invoked from the command line.
    """
    # main program
    status = runMain()
    sys.exit(status)

#--------+---------+---------+---------+---------+---------+---------+---------+
