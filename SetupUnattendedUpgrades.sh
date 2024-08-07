#! /bin/bash
#
# ./SetupUnattendedUpgrades.sh
#
# Sets up unattended upgrades to run as a low-priorties deamon. Runs as root.
#
# Prints the type of the system (so that vendor-specific code can be executed).
# "?" is returned if this script can not determine the system's type.
#

echo "SetupUnattendedUpgrades started at $( date '+%Y%m%d%H%M%S' ) "


USAGE="Usage: command -ihv args"

# --- Options processing -------------------------------------------
#if [ $# == 0 ] ; then
#    echo "$USAGE"
#    exit 1;
#[fi

while getopts ":i:vh" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "i")
        echo "-i argument: $OPTARG"
        ;;
      "h")
        echo "$USAGE"
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

shift $((OPTIND - 1))

param1=$1
param2=$2

# --- Locks -------------------------------------------------------
LOCK_FILE=/tmp/$SUBJECT.lock
if [ -f "$LOCK_FILE" ]; then
   echo "Script is already running"
   exit
fi

trap 'rm -f $LOCK_FILE' EXIT
touch "$LOCK_FILE"

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
echo "$param1"
echo "$param2"
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

# -----------------------------------------------------------------

echo "SetupUnattendedUpgrades ended at $( date '+%Y%m%d%H%M%S') "