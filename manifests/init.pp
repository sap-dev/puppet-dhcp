class dhcp (
  
) inherits dhcp::params {

  require dhcp::install
  require dhcp::config

  create_resources('dhcp::dhcp', hiera('dhcp::dhcp', {}))

}

