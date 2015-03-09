class icinga::webgui::params {
  $dbtype                   = 'mysql'
  $dbhost                   = 'localhost'
  $dbuser                   = 'icinga_web'
  $dbpasswd                 = 'icinga_web'
  $dbname                   = 'icinga_web'
  $backend_dbtype           = 'mysql'
  $backend_dbhost           = 'localhost'
  $backend_dbuser           = 'icinga'
  $backend_dbpasswd         = 'icinga'
  $backend_dbname           = 'icinga'
  $db_overwrite_defaults    = false
  $db_config_file           = '/etc/icinga-web/conf.d/databases.xml'
  $db_default_config_file   = '/usr/share/icinga-web/app/config/databases.xml'
  $initdb                   = false
  $packages                 = ['icinga-web', 'icinga-web-mysql', 'icinga-web-module-pnp' ]
}
