class icinga::configure {
  
  icinga::icinga_feature{ $icinga::features: }
  icinga::icinga_feature{ "ido-${icinga::dbtype}": }

  file{"${icinga::params::features_avail_path}/ido-${::icinga::dbtype}.conf" :
    content => template("icinga/ido-${::icinga::dbtype}.erb"),
    notify  => Class['icinga::service'],
  }
}
