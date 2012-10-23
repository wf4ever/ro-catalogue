#!/bin/bash
#
# Definitions to run RO manager
#

# Resolve any symlinks in $ROBASE

pushd $ROBASE
ROBASE=`pwd -P`
popd

ROPATH=$ROBASE/v0.1
ROSRS_URI="http://sandbox.wf4ever-project.org/rodl/ROs/"
ROSRS_ACCESS_TOKEN="32801fc0-1df1-4e34-b"

# End.
