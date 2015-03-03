class icinga::yumrepo {

  if $icinga::with_repo {
    yumrepo {'icinga-stable-release':
      baseurl => 'http://packages.icinga.org/epel/$releasever/release/',
      enabled => '1',
      gpgcheck => '1',
      gpgkey => 'http://packages.icinga.org/icinga.key',
    }
  } 
}
