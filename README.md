# wf4ever/ro-catalogue

A collection of Research Objects for development and testing.

## Directory and file structure

./ro.sh - editable file defines symbols for running ro-manager on local system.
    This is not included in the git index, so that each local system can maintain
    its own copy.  A sample file from which a local copy of ro.sh may be derived
    is ro.sh.gk-eskarina

    make.sh in the individual ROs do a "source ../../ro.sh".

    Best practice is to add your .sh file here with a similar naming style
    reflecting your username and hostname, then symlink on the local
    checkout:

        ln -s ro.sh-stain-ralph ro.sh


./v0.1/ - ROs conforming to RO specification version 0.1

./v0.2/ - ROs conforming to RO specification version 0.2

## Publication direct to web

This project is also published directly to the web via its `gh-pages` branch, accessible at
[http://wf4ever.github.io/ro-catalogue/...](http://wf4ever.github.io/ro-catalogue/...).

To update the published datya from the master branch, assuming the master branch is locally up-to-date and fully committed:

    git checkout gh-pages
    git merge master
    git checkout master
    git push
