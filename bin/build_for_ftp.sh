#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")/.."
VENDORS_DIR="$DIR/libs-all"
LIBS_DIR="$DIR/libs"
TARGET_DIR="$DIR/bin/website"

echo 
echo "Removing old target dir $TARGET_DIR"
rm -fr "$TARGET_DIR"

echo 
echo "Creating target dir $TARGET_DIR";
mkdir "$TARGET_DIR"

echo 
echo "Copying files";
cp -RPds "$DIR/www" "$TARGET_DIR/"
cp -R "$DIR/libs" "$TARGET_DIR/"
cp -R "$DIR/app" "$TARGET_DIR/"
cp -R "$DIR/temp" "$TARGET_DIR/"
cp -R "$DIR/log" "$TARGET_DIR/"
cp -R "$DIR/data" "$TARGET_DIR/"
cp -R "$DIR/flags" "$TARGET_DIR/"
cp -R "$DIR/license.txt" "$TARGET_DIR/"
cp -R "$DIR/readme.txt" "$TARGET_DIR/"

echo 
echo "Removing symlinks"
rm -fr "$TARGET_DIR/libs/Venne"
rm -fr "$TARGET_DIR/libs/Nette"
rm -fr "$TARGET_DIR/libs/App"
rm -fr "$TARGET_DIR/libs/Doctrine"
rm -fr "$TARGET_DIR/libs/DoctrineMigrations"
rm -fr "$TARGET_DIR/www/elRTE"
rm -fr "$TARGET_DIR/www/elFinder"
cp -R "$VENDORS_DIR/nette/Nette" "$TARGET_DIR/libs/Nette"
cp -R "$VENDORS_DIR/venne/Venne" "$TARGET_DIR/libs/Venne"
cp -R "$VENDORS_DIR/venne/App" "$TARGET_DIR/libs/App"
cp -R "$VENDORS_DIR/doctrine/lib" "$TARGET_DIR/libs/Doctrine"
#cp -R "$VENDORS_DIR/elrte" "$TARGET_DIR/www/elRTE"
#cp -R "$VENDORS_DIR/elfinder" "$TARGET_DIR/www/elFinder"

echo 
echo "Removing caches, temps,..."
rm -fr "$TARGET_DIR/app/proxies/"
mkdir "$TARGET_DIR/app/proxies"
rm -fr "$TARGET_DIR/log/"
mkdir "$TARGET_DIR/log"
cp -R "$DIR/log/web.config" "$TARGET_DIR/log/"
cp -R "$DIR/log/.htaccess" "$TARGET_DIR/log/"
rm -fr "$TARGET_DIR/temp/"
mkdir "$TARGET_DIR/temp/"
cp -R "$DIR/temp/web.config" "$TARGET_DIR/temp/"
cp -R "$DIR/temp/.htaccess" "$TARGET_DIR/temp/"
mkdir "$TARGET_DIR/temp/cache"
mkdir "$TARGET_DIR/temp/sessions"

echo 
echo "Removing .git directories"
cd "$TARGET_DIR";
rm -rf `find . -type d -name .git`

echo 
echo "Building is finished"



