#!/bin/bash
# This is run at the end of each buildroot stage for each package
# It run the script support/scripts/bear which creates a compilation database
# for the current package, based on the files found in the directory in $INTERCEPT_BUILD_TARGET_DIR

die() {
  echo -e "$1"
  exit 1
}

# we only run this script at the end of each buildroot stage
if [[ $1 == "end" ]]; then

  SCRIPTS_DIR=$(dirname "$0")
  STEP=$2
  PKG=$3
  PKG_BUILD_DIR=$4

  if [[ $(echo -n "$PKG_BUILD_DIR" | wc -l) != 0 ]]; then
    die "$0: duplicate packages?\n$PKG_BUILD_DIR"
  fi
  "$SCRIPTS_DIR/bear" -a -o "${PKG_BUILD_DIR}${PKG}_${STEP}_compile_commands.json" --buildroot "${PKG_BUILD_DIR}"
fi
