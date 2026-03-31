#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Jivanshi Rajput | Reg: 24BCE10609

PACKAGE="git"

if dpkg -l "$PACKAGE" &>/dev/null; then
  echo "$PACKAGE is installed."
  echo "--- Package details ---"
  dpkg -s "$PACKAGE" | grep -E 'Version|Status|Maintainer|Homepage'
else
  echo "$PACKAGE is NOT installed."
fi

echo ""
echo "--- Open Source Philosophy Note ---"
case $PACKAGE in
  git) echo "Git: built in a crisis, open-sourced by principle." ;;
  httpd|apache2) echo "Apache: the web server that built the open internet." ;;
  *) echo "Unknown package." ;;
esac
