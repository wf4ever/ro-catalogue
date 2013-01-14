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
ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"

# End.
