define dhcp::dhcp (
  String $interface,
  String $subnet,
  String $subnet6,
  String $leasetime = '1h',
) {

  require dhcp
  require dhcp::params

  require network

  $self = ip_network($subnet, 1)
  $self6 = ip_network($subnet6, 1)

  dnsmasq::dhcp { "dhcp-${title}":
    paramtag   => $interface,
    paramset   => 'dhcp',
    dhcp_start => ip_network($subnet, 2),
    dhcp_end   => ip_broadcast($subnet, 1),
    netmask    => ip_netmask($subnet),
    lease_time => $leasetime,
  }

  network::inet::loopback::post_up { "dhcp_${title}":
    cmd => "/bin/ip addr add ${self} dev \$IFACE",
  }

  $prefix = ip_network($subnet6, 0)

  concat::fragment { "dhcp-${title}":
    target  => '/etc/radvd.conf',
    content => epp('dhcp/radvd.epp'),
    order   => '20',
  }

  network::inet6::loopback::post_up { "dhcp_${title}":
    cmd => "/bin/ip -6 addr add ${self6} dev \$IFACE",
  }

}

