class icinga::configure {

  icinga::icinga_feature{ $icinga::params::features_all: }

  file{"${icinga::params::features_avail_path}/ido-${::icinga::params::dbtype}.conf" :
    content => template("icinga/ido-${::icinga::params::dbtype}.erb"),
    notify  => Class['icinga::service'],
  }
}
