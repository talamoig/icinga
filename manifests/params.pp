class icinga::params {
  $dbtype   = 'mysql'
  $dbhost   = 'localhost'
  $dbuser   = 'icinga'
  $dbpasswd = 'icinga'
  $dbname   = 'icinga'
  $features = []
  $icinga2_name='icinga2'  
  $features_avail_path = '/etc/icinga2/features-available'
  $features_enabled_path = '/etc/icinga2/features-enabled'

  case $::icinga::params::dbtype {
    'mysql' : {
      $ido_db = 'icinga2-ido-mysql'
      $features_all+='ido-mysql'
    }
    'pgsql' : {
      $ido_db = 'icinga2-ido-pgsql'
      $features_all+='ido-pgsql'
    }
    default : { fail("${::icinga::params::dbtype} database not supported") }
  }  
  
}
