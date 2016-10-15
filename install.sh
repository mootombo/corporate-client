#!/bin/bash
#
#    install.sh - will be executed in the target system to prepare installation
#    Copyright (C) 2009-2016 devXive - research and development
#
#    Authors: Lahmizzar Valeryon
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Vars
SCRIPTDIR="$(dirname $0)"
MCCDIR="/usr/lib/mootombo-corporate-client"
MCCLOG="/var/log/mootombo-corporate-client"
MCCINSTALLDIR="${MCCDIR}/.installed"
MCCLATESTTAR="https://api.github.com/repos/mootombo/corporate-client/tarball"
MCCLATEST="mootombo-corporate-client.tar.gz"
MCCSETUP="mcc-setup.sh"

# Prepare the directories and download files
mkdir -p $MCCLOG
mkdir -p $MCCINSTALLDIR

wget -O /tmp/$MCCLATEST $MCCLATESTTAR
tar -xzf /tmp/$MCCLATEST -C /tmp
mv /tmp/mootombo-corporate-client*/* /usr/lib/mootombo-corporate-client/

# Success 1
echo "Installed the base os with desktop environment" >> $MCCINSTALLDIR/os_desktop

# Start the installer/setup if such a file is there
cd $MCCDIR
if [ -f $MCCSETUP ]
then
    echo "$MCCSETUP file found, lets go further!" >> $MCCLOG/install.log
    if [ -s $MCCSETUP ]
    then
		echo "The $MCCSETUP file is NOT empty. The download should have worked!" >> $MCCLOG/install.log
		echo "...starting installer" >> $MCCLOG/install.log
		echo "HINT: Further logs now will be find in $MCCLOG/setup.log" >> $MCCLOG/install.log
		./$MCCSETUP 2>&1 | while IFS= read -r line; do printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line"; done | tee $MCCLOG/setup.log
    else
		echo "An empty file has been downloaded. There may be a problem with the network connection" >> $MCCLOG/install.log
		echo "...installer has been canceled" >> $MCCLOG/install.log
    fi
else
	echo "$MCCSETUP has not been found!" >> $MCCLOG/install.log
fi