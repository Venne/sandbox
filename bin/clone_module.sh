#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")/.."
MODULE_DIR="$DIR/app"

cd $MODULE_DIR

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
}

if [ ! -z "$1" ]; then
	install_git $1 "git://github.com/Venne/$1.git"
fi





