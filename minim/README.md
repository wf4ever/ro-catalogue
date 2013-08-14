# Minim checklist collection

This directory contains a collection of minim checklist definitions.  These are provided as examples of minim-based checklists, and may also form the basis of a checklist catalogue that can be used to create new checklists by mixing and matching elements from existing checklists.

The primary source for each checklist is an Excel spreadsheet, which can be converted to RDF or Turtle by the `mkminim` utlity.

PDFs of the Excel spreadsheets are provided for human readable copies that can be viewed withoutn using Excel.

Also included here is a shell script that performs invocation of the checklist service via its REST interface, and which may be useful as an example of how the service may be invoked.

## Summary of contents

* minim-skeleton.xls - an Excel spreadsheet that can be used as a starting point for creating a new checklist.  It includes examples of the different kinds of checklist irtems that can be used.

* minim-workflow-runnable.xls - a checklist that has been used as the basis for detecting workflow decay due to required services becoming unavailable.  This checklist assumes annotations that use the workflow description vocabulary that is part of the Wf4Ever Research Object model (http://wf4ever.github.io/ro/).

* minim-workflow-demo.xls - checklist that has been used to demonstrate the use of checklists in conjucntion with workflow authoring and sharing tools, to create a workflow that is supported by by additional information considered necessary to make the workflow re-useable and re-purposable by other researchers.

* minim-simple-requirements.xls - defines a number of checklists that were used to evaluate a semi-automatic tool chain for requirements analysis and reporting.  It was one of the first checklists to be created for use with the Minim based tooling, and as such uses some constructions (such as named target resources) that would now be considered unnecessarily restrictive.  

    This file does, however, show how multiple checklists can be defined using different combinations of underlying check items.

    The checklist items that examine RO metadata assume that the wfdesc and wfprov vocabularies, defined as part of the Wf4Ever RO model (http://wf4ever.github.io/ro/), but some of the wfdesc vocabulary usage here is not in line with current usage recommendations.

* minim-chembox-samples.xls - This file contains a checklist to test presence of some key attributes in chembox chemical data extracted from dbpedia.  The checklist is not currently a complete assessment of chemmim completeness (@@ref), but has been constructed to illustrate the key testing patterns.  It was used as part of evaluation work to compare with results produced by the Minim checklist tool with those reported by Matthew Gamble using his SPIN-based MIM framework. 

* REST-invoke-checklist.sh - a shell script that uses command line tools to invoke the checklist service REST API to obtain an evaluation of a research object or resource for a given purpose.
