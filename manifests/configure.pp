class icinga::configure {
  
  icinga::feature { $icinga::enabled_features:
    action => 'enable'
  }

  icinga::feature { $icinga::default_enabled_features:
    action => 'disable'
  }
  
  icinga::feature { "ido-${icinga::dbtype}":
    action => 'enable'
  }

  icinga::feature{ $icinga::disabled_features:
    action => 'disable'
  }
  
  file{"${icinga::params::features_avail_path}/ido-${::icinga::dbtype}.conf" :
    content => template("icinga/ido-${::icinga::dbtype}.erb"),
    notify  => Class['icinga::service'],
  }
}
