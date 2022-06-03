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
wget https://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz
tar -xzf webfonts.tar.gz
cd msfonts/
cabextract *.exe
cd ../
cp msfonts/*.ttf msfonts/*.TTF $CODE_DIR/fonts
