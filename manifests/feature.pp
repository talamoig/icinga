define icinga::feature(
  $ensure
) {
  
  file{$title:
    ensure => $ensure,
    path   => "${icinga::params::features_enabled_path}/${title}.conf",
    target => "${icinga::params::features_avail_path}/${title}.conf",
    notify => Class['icinga::service']
  }    
}
