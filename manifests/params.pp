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

  $ido_db = $::icinga::params::dbtype ? {
    'mysql' => 'icinga2-ido-mysql',
    'pgsql' => 'icinga2-ido-pgsql',
    default => fail("${::icinga::params::dbtype} database not supported")
  }
  
  
}
