class icinga::yumrepo {

  yumrepo {'icinga-stable-release':
    ensure => present,
    baseurl => 'http://packages.icinga.org/epel/$releasever/release/',
    enabled => true,
    gpgcheck => '1',
    gpgkey => 'http://packages.icinga.org/icinga.key',
  }

}
