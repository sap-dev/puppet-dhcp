class dhcp (
  Optional[String] $dnsserver1   = $dhcp::params::dnsserver1,
  Optional[String] $dnsserver2   = $dhcp::params::dnsserver2,
  Optional[String] $dnsserver6_1 = $dhcp::params::dnsserver6_1,
  Optional[String] $dnsserver6_2 = $dhcp::params::dnsserver6_2,
) inherits dhcp::params {

  class { 'dhcp::install': } ->
  class { 'dhcp::config': }

  contain dhcp::install
  contain dhcp::config

  create_resources('dhcp::dhcp', hiera('dhcp::dhcp', {}))

}

