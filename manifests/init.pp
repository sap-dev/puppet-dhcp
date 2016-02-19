class dhcp (
  
) inherits dhcp::params {

  contain dhcp::install
  contain dhcp::config

  class { 'dhcp::install': } ->
  class { 'dhcp::config': }

  create_resources('dhcp::dhcp', hiera('dhcp::dhcp', {}))

}

