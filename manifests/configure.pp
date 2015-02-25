class icinga::configure {
  
  icinga::feature { $icinga::enabled_features:
    ensure => link
  }
  icinga::feature { "ido-${icinga::dbtype}":
    ensure => link
  }

  icinga::feature{ $icinga::disabled_features:
    ensure => absent
  }
  
  file{"${icinga::params::features_avail_path}/ido-${::icinga::dbtype}.conf" :
    content => template("icinga/ido-${::icinga::dbtype}.erb"),
    notify  => Class['icinga::service'],
  }
}
