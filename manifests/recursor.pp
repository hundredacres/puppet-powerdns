# the powerdns recursor
class powerdns::recursor ($package_ensure = $powerdns::params::default_package_ensure) inherits powerdns {
  package { $::powerdns::params::recursor_package:
    ensure => $package_ensure,
    before => File["/etc/resolv.conf"],
  }

  service { $::powerdns::params::recursor_service:
    ensure  => running,
    enable  => true,
    require => Package[$::powerdns::params::recursor_package],
  }
}
