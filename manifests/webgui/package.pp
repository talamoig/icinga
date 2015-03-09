class icinga::webgui::package {

  package{ $icinga::webgui::params::packages:
    ensure => installed,
  }

}
