# puppet-dhcp

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with dhcp](#setup)
    * [Beginning with dhcp](#beginning-with-dhcp)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manages DHCP service for the Freifunk Nordwest network.

## Setup

### Beginning with dhcp

```puppet
dhcp::dhcp { 'ol-nord':
  interface => 'bat-ol-nord',
  subnet    => '10.18.8.0/21',
  subnet6   => '2a03:2260:1001:0800::/53',
}
```

## Usage

```puppet
dhcp::dhcp { 'ol-nord':
  interface => 'bat-ol-nord',
  subnet    => '10.18.8.0/21',
  subnet6   => '2a03:2260:1001:0800::/53',
}
```

## Reference

* define dhcp::dhcp
  * $interface
  * $subnet
  * $subnet6
  * $leasetime (optional, default '1h')

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.
