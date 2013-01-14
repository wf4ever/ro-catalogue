Y2 review feature test research object

This is a simple Research Object that embeds a simple "Hello World" workflow, 
along with a number of annotations that exemplify features that will be used
in the Wf4Ever Y2 review demo.

NOTE that this is NOT the RO that will be used for the demo, but a simplified
RO that instantiates the features that will be used by the demo, providing a basis
for discussion and testing.  The actual RO used will likely be more complex, and
as such will probably be harder to review and discuss.  Also, this simple RO
should make it easier to isolate and fix faults that arise in testing.

NOTE the terms used for annotations have been invented for demo purposes, and are
not necessarily the terms we should be using for actual live ROs.  For the purposes
of preparing a demo, I want to bypass long discussions about the best terms: those
discussions are still needed, but may be scheduled as and when the project schedule 
permits. This RO should be updated as better terms are chosen.

...

To run this workflow in Taverna, first edit the fileurl_value and outputFile_value to 
reflect paths on the local system to the Research Object directory.

Research Object files are:

* README.txt - this file
* make.sh - sample script to create Research Object structure using RO Manager
* HelloWorld-wfdesc.rdf - Workflow description using WFDesc vocabulary terms
  (http://wf4ever.github.com/ro/)
* Workflows/TavernaHelloWorld.t2flow - Taverna "Hello world" workflow
* Inputs/InputName.txt - sample input file
* Outputs/HelloOutput.txt - result from running workflow with sample input file
* Notes/* - various files used to exemplify different user annotations

