define icinga::common::initdb (
  $dbtype,
  $test_table,
  $schema,
  $dbuser,
  $dbpasswd,
  $dbhost,
  $dbname,
  ){
  $dbclient=$icinga::params::dbclient[$dbtype]
  $connection_string="${dbclient} --user=${dbuser} --password=${dbpasswd} --host=${dbhost} ${dbname}"
  
  exec{"icinga::initdb_${title}":
    command  => "/bin/bash -c '${connection_string} < $schema'",
    unless   => "/bin/bash -c 'echo \"describe $test_table\"|${connection_string} >/dev/null 2>&1'",
  }
}
