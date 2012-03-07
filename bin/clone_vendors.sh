#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")/.."
VENDORS="libs-all"
VENDORS_DIR="$DIR/$VENDORS"
LIBS_DIR="$DIR/libs"
WWW_DIR="$DIR/www"
APP="$DIR/app"

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
install_git nette git://github.com/nette/nette.git v2.0
ln -s "../$VENDORS/nette/Nette" "$LIBS_DIR/Nette"


# Venne:CMS
install_git venne git://github.com/Venne/Venne-CMS.git
ln -s "../$VENDORS/venne/Venne" "$LIBS_DIR/Venne"
ln -s "../$VENDORS/venne/App" "$LIBS_DIR/App"

# Doctrine
install_git doctrine git://github.com/doctrine/doctrine2.git 2.2.0
cd "$VENDORS_DIR/doctrine"
git submodule init
git submodule update
cd $VENDORS_DIR
ln -s "../$VENDORS/doctrine/lib" "$LIBS_DIR/Doctrine"

# Modules
cd $APP
install_git CoreModule git://github.com/Venne/CoreModule.git
install_git PagesModule git://github.com/Venne/PagesModule.git
install_git NavigationModule git://github.com/Venne/NavigationModule.git




