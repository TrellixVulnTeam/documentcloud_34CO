#!/bin/bash

set -e

CODE_DIR=awsbin/info_and_image

# Clear the code directory if it already exists
[ -d "$CODE_DIR" ] && rm -Rf $CODE_DIR
# Make the code directory if it does not exist
[ -d "$CODE_DIR" ] || mkdir -p $CODE_DIR

# Copy the code from the Django app
cp -Lr ../../../documentcloud/documents/processing/info_and_image/* $CODE_DIR 2>/dev/null || :

# Set AWS requirements
cp info-and-image-requirements.txt $CODE_DIR/cloud-requirements.txt

# install fonts
mkdir $CODE_DIR/fonts
cat << EOF > $CODE_DIR/fonts/fonts.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <dir>/var/task/fonts/</dir>
  <cachedir>/tmp/fonts-cache/</cachedir>
  <config></config>
</fontconfig>
EOF
wget http://downloads.sourceforge.net/corefonts/andale32.exe
wget http://downloads.sourceforge.net/corefonts/arial32.exe
wget http://downloads.sourceforge.net/corefonts/arialb32.exe
wget http://downloads.sourceforge.net/corefonts/comic32.exe
wget http://downloads.sourceforge.net/corefonts/courie32.exe
wget http://downloads.sourceforge.net/corefonts/georgi32.exe
wget http://downloads.sourceforge.net/corefonts/impact32.exe
wget http://downloads.sourceforge.net/corefonts/times32.exe
wget http://downloads.sourceforge.net/corefonts/trebuc32.exe
wget http://downloads.sourceforge.net/corefonts/verdan32.exe
wget http://downloads.sourceforge.net/corefonts/webdin32.exe
cabextract *.exe
cp *.ttf *.TTF $CODE_DIR/fonts
