#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")/.."
VENDORS="libs-all"
VENDORS_DIR="$DIR/$VENDORS"
LIBS_DIR="$DIR/libs"
WWW_DIR="$DIR/www"

mkdir $VENDORS_DIR
cd $VENDORS_DIR

##
# @param destination directory (e.g. "doctrine")
# @param URL of the git remote (e.g. git://github.com/doctrine/doctrine2.git)
# @param revision to point the head (e.g. origin/HEAD)
#
install_git()
{
	INSTALL_DIR=$1
	SOURCE_URL=$2
	REV=$3

	echo
	echo "Installing $INSTALL_DIR ..."

	if [ -z $REV ]; then
		REV=origin/master
	fi

	if [ ! -d $INSTALL_DIR ]; then
		git clone $SOURCE_URL $INSTALL_DIR
	fi

	cd $INSTALL_DIR
	git fetch origin
	git reset --hard $REV
	cd ..
}

# Nette Framework
install_git nette git://github.com/nette/nette.git 419443f3d5a6fde0607580f7b3dcc9987a51f1a0
ln -s "../$VENDORS/nette/Nette" "$LIBS_DIR/Nette"


# Venne:CMS
install_git venne git://github.com/Venne/Venne-CMS.git
ln -s "../$VENDORS/venne/Venne" "$LIBS_DIR/Venne"
ln -s "../$VENDORS/venne/App" "$LIBS_DIR/App"

# Doctrine
install_git doctrine git://github.com/doctrine/doctrine2.git 2.1.2
cd "$VENDORS_DIR/doctrine"
git submodule init
git submodule update
cd $VENDORS_DIR
ln -s "../$VENDORS/doctrine/lib" "$LIBS_DIR/Doctrine"

# elRTE
# install_git elrte git://github.com/Studio-42/elRTE.git stable
# install_git elfinder git://github.com/Studio-42/elFinder.git 2.x
# ln -s "../$VENDORS/elrte" "$WWW_DIR/elRTE"
# ln -s "../$VENDORS/elfinder" "$WWW_DIR/elFinder"

