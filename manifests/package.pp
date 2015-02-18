class icinga::package {
  
  $packages=[$icinga::params::ido_db, $icinga::params::icinga2_name]

  package{ $packages:
    ensure => installed,    
  }
    
}
