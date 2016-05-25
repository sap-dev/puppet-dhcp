define dhcp::dhcp (
  String           $interface,
  String           $subnet,
  Array[String]    $subnet6   = [],
  String           $leasetime = '1h',
) {

  include dhcp
  include dhcp::params

  include network
  include dnsmasq

  dnsmasq::dhcp { "dhcp-${title}":
    paramtag   => $interface,
    paramset   => 'dhcp',
    dhcp_start => ip_address(ip_network($subnet, 2)),
    dhcp_end   => ip_address(ip_broadcast($subnet, 1)),
    netmask    => ip_netmask($subnet),
    lease_time => $leasetime,
  }

  if $dhcp::dnsserver1 {
    $dnsserver1 = "${dhcp::dnsserver1}"
    if $dhcp::dnsserver2 {
      $dnsserver2 = ",${dhcp::dnsserver2}"
    } else {
      $dnsserver2 = ''
    }
    dnsmasq::dhcpoption { '6':
      content  => "${dnsserver1}${dnsserver2}",
      paramtag => 'dhcp',
    }
  } else {
    $dnsserver1 = ''
    $dnsserver2 = ''
  }

  concat::fragment { "dhcp-${title}":
    target  => '/etc/radvd.conf',
    content => epp('dhcp/radvd.epp', {
      interface  => $interface,
      subnet6    => $subnet6,
      dnsserver1 => $dhcp::dnsserver6_1,
      dnsserver2 => $dhcp::dnsserver6_2
    }),
    order   => '20',
  }

}

