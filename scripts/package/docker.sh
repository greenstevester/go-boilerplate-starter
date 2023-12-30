#!/usr/bin/env bash
clear
set -e

# Resolve absolute path to this script, so it can be called within an editor or outside of it.
RELATIVE_DIR="."
if [[ $PWD == *"package"* ]]; then
   RELATIVE_DIR="../.."
fi

if [ ! -d "$RELATIVE_DIR/dist/" ]; then
  echo "$RELATIVE_DIR/dist/ does not exist and therefore cannot create docker image"
  echo "try running:  goreleaser release --snapshot --clean from project root dir"
  exit 1
fi

FILE="$RELATIVE_DIR/dist/metadata.json"
if [ -f "$FILE" ]; then
   echo "$FILE exists."
else
   echo "dist metadata:[$FILE] does not exist and therefore cannot create docker image"
   exit 1
fi

# VERSION (based on "VERSION" with prefix for dev)
MB_VERSION=$(jq -r '.tag' "$FILE")
SOURCE_DIRECTORY="$RELATIVE_DIR/dist/go-boilerplate-starter_linux_amd64_v1"
TARGET_DIRECTORY="$RELATIVE_DIR/dist/go-boilerplate-starter_linux_amd64_docker"

echo version=$MB_VERSION
if [ ! -d "$TARGET_DIRECTORY" ]; then
  mkdir "$TARGET_DIRECTORY"
fi

if [ -d "$SOURCE_DIRECTORY" ]; then
  cp "$SOURCE_DIRECTORY/go-boilerplate-starter" "$TARGET_DIRECTORY"
  echo "copied $SOURCE_DIRECTORY to $TARGET_DIRECTORY"
else
  echo "directory:[$SOURCE_DIRECTORY] does not exist and therefore cannot create docker image"
  exit 1
fi

DOCKER_FILE="$RELATIVE_DIR"
FILE="$TARGET_DIRECTORY/go-boilerplate-starter"
if [ -f "$FILE" ]; then
    echo "$FILE exists - proceeding with docker build"
    cd $RELATIVE_DIR &&  echo current dir: ${PWD} &&  docker build -t "greensill.net/go-boilerplate-starter:${MB_VERSION}" .
else
    echo "Binary executable:[$FILE] does not exist and therefore cannot create docker image"
fi

