#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")/.."
VENDORS_DIR="$DIR/libs-all"
LIBS_DIR="$DIR/libs"
TARGET_DIR="$DIR/bin/website"

echo 
echo "----- Permissions -----"
chmod -R 0777 "$DIR/flags"
chmod -R 0777 "$DIR/log"
chmod -R 0777 "$DIR/temp"
chmod -R 0777 "$DIR/data"
chmod -R 0777 "$DIR/www/public"
chmod -R 0777 "$DIR/www/cache"
chmod -R 0777 "$DIR/www/resources"
