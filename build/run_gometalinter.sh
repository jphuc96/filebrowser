#!/bin/sh

set -e

cd $(dirname $0)/..

dolint='gometalinter --exclude="rice-box.go" --exclude="vendor" --deadline=300s ./...'

if [ "$USE_DOCKER" != "" ]; then
  $(command -v winpty) docker run --rm -itv /$(pwd)://src -w //src filebrowser/dev:mod sh -c "\
    go get -v ./... && \
    $dolint"
else
  $dolint
fi
