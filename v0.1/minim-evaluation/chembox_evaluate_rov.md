# Chembox evaluation using Overlay ROs

## Background

The original chembox evaluation was performed using a single Research Object containing information about all ~7.5K chemicals.  As a result, the RO contained about 28Mb of RDF data that had to be loaded each time a checklist evaluation is performed.

An altermnative approach would have been to create a separate RO for each chemical, in which case, only the RDF relating to that chemical woukld be needed for each checklist evaluation.  This would mean creating about 7.5K separate ROs to evaluate all chemicals.  Unfortunately, the overhead for creating an RO is significant, particularly in RODL, and the resulting large set of ROs would be very cumbersome to manage in any of the options available.

## Overlay ROs woth roverlay

With the implementation of `roverlay`, are have a very lightweight mechanism that can be used to create ROs on-the-fly from a supplied list of resources, and delete them once they have been processed.  In our case, we created a single-file RO for each chemical, and were able to radically improve the evaluation performance.

## Implementation

Evaluation of all ~7.5K chemicals is performed by the script `chembox_evaluate_rov.sh` in the `minim-evaluation` RO in the `ro-catalogue` project in github (https://github.com/wf4ever/ro-catalogue/blob/master/v0.1/minim-evaluation/chembox_evaluate_rov.sh).

Using linked data read directly using their assigned PURLs (http://purl.org/net/chembox/) which redirect to Matt Gamble's CXhemBox repository (http://sierra-nevada.cs.man.ac.uk/chembox/), and using a checklist service running on `andros.zoo.ox.ac.uk` we see in the resulting log file:

    RO evaluation run: Thu Aug 15 14:21:05 BST 2013
     :
    Total pass: 5106, fail: 2464 out of 7570
    RO evaluation run ended: Thu Aug 15 18:52:04 BST 2013

So we can see that 7570 chemical dfescriptions have been evaluated in about 4.5 hours, or a little over two seconds per chemical.  This is a massive improvement on the previous performance of over 2 minutes per chemical using a single RO for all chemicals.

Files used include:
* https://github.com/wf4ever/ro-catalogue/blob/master/v0.1/minim-evaluation/chembox_evaluate_rov.sh (script file)
* https://github.com/wf4ever/ro-catalogue/blob/master/v0.1/minim-evaluation/chembox-uris.txt (list of URIs for all chemicals)
* https://github.com/wf4ever/ro-catalogue/blob/master/v0.1/minim-evaluation/chembox_evaluate_rov_all.log (resulting log file)
