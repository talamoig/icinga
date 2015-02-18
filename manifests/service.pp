class icinga::service {
  service{"icinga2":
    ensure => running,
    hasstatus => true,    
  }
}
