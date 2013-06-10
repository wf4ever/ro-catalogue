# chembox evaluation experiment

Converting a small part of Matthew Gamble's "chemmim" evaluation of chemical descriptions to use the RO checklist evaluation framework, with a view to making a concrete comparison between the approaches used.


## Content of the folder

chembox_evaluate.sh: the script for running the assessment locally or remotely

chembox-minim-samples.ttl: the checklist used for assessment

chembox-uris-100.txt: the 100 sample chemical compounds assessed

MIM-chembox-uris.100.results: the assessment result from the MIM assessment tool


## To reproduce the Minim assessment

    ./chembox_evaluate.sh

(This script is currently configured to use a checklist service deployed at andros.zoo.ox.ac.uk, evaluating ROs served by sandbox.wf4ever-project.org/rodl)