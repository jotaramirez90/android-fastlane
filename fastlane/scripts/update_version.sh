#!/usr/bin/env bash
#Version setup whether its TAG or Branch
if [ -n "$BITRISE_GIT_TAG" ]; then
  export VERSION=$BITRISE_GIT_TAG
elif [ -n "$BITRISE_GIT_BRANCH" ]; then
  export VERSION=$BITRISE_GIT_BRANCH
fi

#Version auto-incremental setup for build number
BUILD_NUMBER=155000
BUILD_NUMBER=$(($BUILD_NUMBER + $BITRISE_BUILD_NUMBER))

sed -i -e s@versionName.*@versionName=$VERSION@ /bitrise/src/mb-version.properties
sed -i -e s@versionCode.*@versionCode=$BUILD_NUMBER@ /bitrise/src/mb-version.properties

envman add --key VERSION --value "$VERSION"

cat /bitrise/src/mb-version.properties
