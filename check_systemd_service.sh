#!/bin/bash

# Copyright © 2016, 2017 Mohamed El Morabity <melmorabity@fedoraproject.com>
#
# This module is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This software is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.


PLUGINDIR=$(dirname $0)
LIBEXEC="$PLUGINDIR"

for i in ${LIBEXEC} ; do
  [ -r ${i}/utils.sh ] && . ${i}/utils.sh
done

if [ -z "$STATE_OK" ]; then
  echo "nagios utils.sh not found" &>/dev/stderr
  exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0##*/} <service name>"
    exit $STATE_UNKNOWN
fi

service=$1


status=$(systemctl is-enabled $service 2>/dev/null)
r=$?
if [[ -z "$status" ]]; then
    echo "ERROR: service $service doesn't exist"
    exit $STATE_CRITICAL
fi

if [[ $r -ne 0 ]]; then
    echo "ERROR: service $service is $status"
    exit $STATE_CRITICAL
fi


systemctl --quiet is-active $service
if [[ $? -ne 0 ]]; then
    echo "ERROR: service $service is not running"
    exit $STATE_CRITICAL
fi

echo "OK: service $service is running"
exit $STATE_OK
