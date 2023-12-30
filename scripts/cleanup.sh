#!/usr/bin/env bash

set -e

# Resolve absolute path to this script, so it can be called within an editor or outside of it.
RELATIVE_DIR="."
if [[ $PWD == *"scripts"* ]]; then
   RELATIVE_DIR="./.."
fi

if [ -d "$RELATIVE_DIR/dist" ]; then
  echo "cleaning dist folder"
  rm -r "$RELATIVE_DIR/dist"
else
  echo "no $RELATIVE_DIR/dist folder found, nothing to cleanup"
fi


