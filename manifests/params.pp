class icinga::params  {

  $features_avail_path = '/etc/icinga2/features-available'
  $features_enabled_path = '/etc/icinga2/features-enabled'
  $icinga2_name='icinga2'

  $ido_db = $::icinga::dbtype ? {
    'mysql' => 'icinga2-ido-mysql',
    default => 'icinga2-ido-pgsql',
  }
  
  
}
