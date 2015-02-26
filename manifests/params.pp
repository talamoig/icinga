class icinga::params {
  $dbtype                = 'mysql'
  $dbhost                = 'localhost'
  $dbuser                = 'icinga'
  $dbpasswd              = 'icinga'
  $dbname                = 'icinga'
  $features              = []
  $no_features           = []
  $icinga2_name          = 'icinga2'  
  $features_avail_path   = '/etc/icinga2/features-available'
  $features_enabled_path = '/etc/icinga2/features-enabled'
  $with_repo             = True
}
