#!/bin/bash
# Script 1: System Identity Report
# Author: Jivanshi Rajput | Reg: 24BCE10609
# Course: Open Source Software | Chosen Software: Git

STUDENT_NAME="Jivanshi Rajput"
REG_NO="24BCE10609"
SOFTWARE_CHOICE="Git"
OS_LICENSE="GNU General Public Licence v2 (GPL v2)"

KERNEL=$(uname -r)
DISTRO=$(lsb_release -d | cut -f2)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATETIME=$(date '+%d %B %Y %H:%M:%S')
GIT_VER=$(git --version 2>/dev/null || echo 'not installed')

echo "======================================"
echo " Open Source Audit --- $STUDENT_NAME"
echo " Registration: $REG_NO"
echo "======================================"
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home         : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date/Time    : $DATETIME"
echo "-----------------------------------"
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "OS Licence      : $OS_LICENSE"
echo "Git Version     : $GIT_VER"
echo "======================================"
