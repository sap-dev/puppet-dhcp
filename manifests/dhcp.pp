define dhcp::dhcp (
  String        $interface,
  String        $subnet,
  Array[String] $subnet6 = [],
  String        $leasetime = '1h',
) {

  require dhcp
  require dhcp::params

  require network

  dnsmasq::dhcp { "dhcp-${title}":
    paramtag   => $interface,
    paramset   => 'dhcp',
    dhcp_start => ip_network($subnet, 2),
    dhcp_end   => ip_broadcast($subnet, 1),
    netmask    => ip_netmask($subnet),
    lease_time => $leasetime,
  }

  concat::fragment { "dhcp-${title}":
    target  => '/etc/radvd.conf',
    content => epp('dhcp/radvd.epp', { interface => $interface, subnet6 => $subnet6 }),
    order   => '20',
  }

}

