class httpd::packages {
  file { '/etc/apt/sources.list.d/non-free.list':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apt/sources.list.d/non-free.list',
    mode => 644
  }

  exec { 'apt-get update':
    path => ['/usr/bin'],
    require => File['/etc/apt/sources.list.d/non-free.list']
  }

  package {[
      'apache2',
      'libapache2-mod-fastcgi'
    ]:
    ensure => present,
    require => Exec['apt-get update']
  }
}
