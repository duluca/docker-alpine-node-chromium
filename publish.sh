#!/bin/sh
IMAGE_NAME=duluca/minimal-node-chromium
VERSION=lts
docker image build . -t $IMAGE_NAME:$VERSION-alpine
docker image tag $IMAGE_NAME:$VERSION-alpine duluca/minimal-node-chromium:latest
docker image push $IMAGE_NAME:$VERSION-alpine
docker image push $IMAGE_NAME:latest

git push origin :refs/tags/$VERSION
git tag -fa $VERSION
git push origin master --tags