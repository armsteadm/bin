#!/bin/bash
#
# $TOOLS/getsyi
#
# Prints the type of the system (so that vendor-specific code can be executed).
# "?" is returned if this script can not determine the system's type.
#
# Last Change 12/14/97 by Brian Lomasky
#	      21/09/01 Michael Armstead
#
sysname=`uname -s`
if [ "$sysname" = "AIX" ]; then
	echo "AIX"
elif [ "$sysname" = "Linux" ]; then
	echo "LINUX"
elif [ "$sysname" = "SMP_DC_OSx" ]; then
	echo "PYRAMID"
elif [ "$sysname" = "HP-UX" ]; then
	echo "HP"
elif [ "$sysname" = "OSF1" ]; then
	echo "DECOSF"
elif [ "$sysname" = "ULTRIX" ]; then
	echo "ULTRIX"
elif [ "$sysname" = "SunOS" ]; then
	case `uname -r` in
		4*) echo "SUNBSD";;
		5*) echo "SOLARIS";;
		*)  echo "?";;
	esac;;
else
	echo "?"
fi
