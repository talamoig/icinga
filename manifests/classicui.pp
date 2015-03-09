class icinga::classicui
inherits icinga::classicui::params {
  Class[icinga::yumrepo] -> Class[icinga::classicui::package]

  class { 'icinga::classicui::package': }
  }
