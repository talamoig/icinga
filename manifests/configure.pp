class icinga::configure {

  define icinga_feature {
    file{$title:
      ensure => link,
      path   => "${icinga::params::features_enabled_path}/${title}.conf",
      target => "${icinga::params::features_avail_path}/${title}.conf",
      notify => Class['icinga::service']
    }    
  }

  icinga_feature{ $icinga::params::features: }

  if $icinga::params::dbtype=='mysql' {
    file{"${icinga::params::features_avail_path}/ido-mysql.conf" :
      content => template('icinga/ido-mysql.erb'),
      notify  => Class['icinga::service'],
    }
  }
  
}
