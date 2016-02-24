class dhcp (
  
) inherits dhcp::params {

  class { 'dhcp::install': } ->
  class { 'dhcp::config': }

  contain dhcp::install
  contain dhcp::config

  create_resources('dhcp::dhcp', hiera('dhcp::dhcp', {}))

}

