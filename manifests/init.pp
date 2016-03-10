class dhcp (
  Optional[String] $dnsserver1 = $dhcp::params::dnsserver1,
  Optional[String] $dnsserver2 = $dhcp::params::dnsserver2,
) inherits dhcp::params {

  class { 'dhcp::install': } ->
  class { 'dhcp::config': }

  contain dhcp::install
  contain dhcp::config

  create_resources('dhcp::dhcp', hiera('dhcp::dhcp', {}))

}

