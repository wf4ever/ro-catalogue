# Define configuration for running RO Manager
ROBASE="."
RO=ro

# Resolve any symlinks in $ROBASE
pushd $ROBASE
ROBASE=`pwd -P`
popd

# Define ROSRS access details
ROSRS_URI="http://sandbox.wf4ever-project.org/rodl/ROs/"
ROSRS_ACCESS_TOKEN="4d0cf8b6-0d4c-4150-9f29-0e2b9081ed18"

# Set RO Manager configuration
$RO config -v \
  -b $ROBASE \
  -r $ROSRS_URI \
  -t "$ROSRS_ACCESS_TOKEN" \
  -n "Test user" \
  -e "testuser@example.org"
