class icinga::webgui::configure {

  file{$icinga::webgui::params::db_config_file:
    ensure  => present,
    content => template('icinga/webgui/databases.erb'),
  }

  if $icinga::webgui::db_overwrite_defaults {
    file{$icinga::webgui::params::db_default_config_file:
      ensure  => present,
      content => template('icinga/webgui/databases_default.erb'),
    }
  }
  
  if $icinga::webgui::initdb {

    $schema = '/usr/share/doc/icinga-web-1.12.0/schema/mysql.sql'

    icinga::common::initdb{'icinga::webgui::configure::init-db':
      dbtype     => $icinga::dbtype,
      test_table => 'cronk',
      schema     => $schema,
      dbuser     => $icinga::webgui::dbuser,
      dbpasswd   => $icinga::webgui::dbpasswd,
      dbhost     => $icinga::webgui::dbhost,
      dbname     => $icinga::webgui::dbname,
    }
  }
  
}
