# nagios-plugin-systemd-service

Nagios plugin to check the status of a systemd service.

## Authors

Mohamed El Morabity <melmorabity -(at)- fedoraproject.org>

## Installation

This plugin requires the `utils.sh` file provided by the [Nagios Plugins project](https://github.com/nagios-plugins). Such a file is available in the `nagios-plugins` package provided by RHEL-based Linux distributions. As a result, the plugin should be installed in the same directory (`/usr/lib*/nagios/plugins` on RHEL-based Linux distributions).

## Usage

    check_systemd_service.sh <service name>

## Examples

    $ ./check_systemd_service.sh sshd
    OK: service sshd is running

    $ sudo systemctl stop sshd
    $ ./check_systemd_service.sh sshd
    ERROR: service sshd is not running

    $ ./check_systemd_service.sh foo
    ERROR: service foo doesn't exist
