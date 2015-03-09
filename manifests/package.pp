class icinga::package {

  $ido_db= "icinga2-ido-${::icinga::dbtype}"

  $packages=[$ido_db, $icinga::params::icinga_name]

  package{ $packages:
    ensure => installed,
  }
    
}
