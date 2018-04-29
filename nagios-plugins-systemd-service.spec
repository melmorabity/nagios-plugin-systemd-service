%global alt_name nagios-plugin-systemd-service
%global nagiospluginsdir %{_libdir}/nagios/plugins

# No binaries in this package
%global debug_package %{nil}

Name:           nagios-plugins-systemd-service
Version:        0.0.3
Release:        1%{?dist}
Summary:        Nagios plugin to check the status of a systemd service

Group:          Applications/System
License:        GPLv3+
URL:            https://github.com/melmorabity/nagios-plugin-systemd-service/
Source0:        https://github.com/melmorabity/%{alt_name}/archive/%{version}/%{name}-%{version}.tar.gz

Requires:       nagios-plugins

%description
%{summary}.


%prep
%setup -q -n %{alt_name}-%{version}


%build


%install
install -Dpm 0755 check_systemd_service.sh $RPM_BUILD_ROOT%{nagiospluginsdir}/check_systemd_service


%files
%doc README.md
%license LICENSE
%{nagiospluginsdir}/check_systemd_service


%changelog
* Sun Apr 29 2018 Mohamed El Morabity <melmorabity@fedoraproject.org> - 0.0.3-1
- Initial RPM release
