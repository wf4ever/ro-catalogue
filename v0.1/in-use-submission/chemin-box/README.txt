chembox evaluation experiment

Converting a small part of Matthew Gamble's "chemmim" evaluation of chemical descriptions to use the RO checklist evaluation framework, with a view to making a concrete comparison between the approaches used.

@@NOTE:  at the present time (28-May-2013) I am having problems running this evaluation against the chembox data in sandbox.wf4ever-project.org/rodl, due to a problem uploading and/or retrieving the RO.  The tests have been performed using a local instance of the RO checklist service, which requires installing the RO Manager and Pyramid web framework software to the local computer.

== Content of the folder ==

chembox_evaluate.sh: the script for running the assessment locally or remotely

chembox-minim-samples.ttl: the checklist used for assessment

chembox-uris-100.txt: the 100 sample chemical compounds assessed

chembox-test-run-100-log.txt: the assessment result from the Minim checklist

MIM-chembox-uris.100.results: the assessment result from the MIM assessment tool

== To reproduce the Minim assessment ==

    ./chembox_evaluate.sh

Expected results:


