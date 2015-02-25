class icinga::package {

  case $::icinga::dbtype {
    'mysql' : {
      $ido_db        = 'icinga2-ido-mysql'
    }
    'pgsql' : {
      $ido_db        = 'icinga2-ido-pgsql'
    }    
    default : { fail("${::icinga::dbtype} database not supported") }
  }  

  
  $packages=[$ido_db, $icinga::params::icinga2_name]

  package{ $packages:
    ensure => installed,    
  }
    
}
