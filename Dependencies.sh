#!/bin/sh

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
CHECK="✅"
MAINTENCE="🤖"

# Check if it's a Circle build
IS_CIRCLE=false
if [[ $1 = "circle" ]]; then
   IS_CIRCLE=true
fi

# Install tools
# If on circle don't run certain parts because they could come preinstalled. (Eg. Carthage)
if [[ ${IS_CIRCLE} == false ]]; then

  {
    brew update
    brew install carthage
    brew upgrade carthage
  } &> /dev/null

fi

# Check if carthage needs to be updated
# This compares the resolved files
DELETE_CARTHAGE_FOLDER=false
if ! cmp -s Cartfile.resolved Carthage/Cartfile.resolved; then
  echo "${MAINTENCE}${RED}    Carthage.resolved files don't match. Will bootstrap again.${RESET}"
  DELETE_CARTHAGE_FOLDER=true
fi

# Reset system when on Mac (non-circle) or if carthage.resolved files don't match
if [ ${IS_CIRCLE} == false ] || [ ${DELETE_CARTHAGE_FOLDER} == true ] ; then
  echo "${MAINTENCE}${GREEN}    Let's first remove all previous carthages...${RESET}"
  rm -rf ${DIR}/Carthage
  echo "${MAINTENCE}${GREEN}    Done removing all previous carthages...${RESET}"
  echo "${CHECK}${GREEN}    Start carthaging...${RESET}"
  carthage bootstrap --no-build
fi

# Save the resolved file in the carthage directory so
# later we can compare it to check if there are changes needed
if [[ ${IS_CIRCLE} == true ]]; then
  cp Cartfile.resolved Carthage
fi

echo "${CHECK}${GREEN}   Finished installing...${RESET}"
