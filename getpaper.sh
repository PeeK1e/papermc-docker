#/usr/bin/env sh

set -euxo pipefail

FILE=".dotenv"

rm $FILE || true
touch $FILE

PAPER_VERSION="$(curl --silent -X 'GET' 'https://fill.papermc.io/v3/projects/paper/versions' -H 'accept: application/json' | jq '.versions[0].version.id' -r)"

PAPER_LATEST_INFO="$(curl --silent -X 'GET' -H 'accept: applications/json' https://fill.papermc.io/v3/projects/paper/versions/${PAPER_VERSION}/builds/latest)"

PAPER_BUILD_ID="$(echo ${PAPER_LATEST_INFO} | jq '.id' -r)"
PAPER_BUILD_SHA="$(echo ${PAPER_LATEST_INFO} | jq '.downloads."server:default".checksums.sha256' -r)"
PAPER_BUILD_URL="$(echo ${PAPER_LATEST_INFO} | jq '.downloads."server:default".url' -r)"

CONTAINER_TAG="${PAPER_VERSION}" #-${PAPER_BUILD_ID}"

echo "PAPER_URL=${PAPER_BUILD_URL}" >> $FILE
echo "IMAGE_TAG=${CONTAINER_TAG}" >> $FILE
