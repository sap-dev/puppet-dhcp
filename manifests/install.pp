class dhcp::install {

  package { 'radvd':
    ensure => installed,
  }

}

