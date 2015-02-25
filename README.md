# icinga

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with icinga](#setup)
    * [What icinga affects](#what-icinga-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with icinga](#beginning-with-icinga)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview


The [icinga2](https://www.icinga.org/) modules allows you to setup an icinga2 monitoring system.

## Module Description

This modules install [icinga2](https://www.icinga.org/). No user interface is provided (that's icinga not nagios!)
in this module, but icingaweb2 is available as a [separete module](https://github.com/talamoig/icingaweb2).

It currently supports only MySQL database and assumes the database schema and user have already been created.
To do it please follow information provided [here](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#setting-up-mysql-db).

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What icinga affects

* configuration files and directories (`/etc/icinga2`)
* a new yum repo will be installed.

### Setup Requirements

A MySQL database (local or remote) with proper credential must be available.

### Beginning with icinga

To install Icinga with default parameters 

     class {'::icinga':}

With default parameters a MySQL database will be accessed on localhost. Its name
must be `icinga` and the used credentials are `icinga` as username and `icinga` as password.
This is equivalent to:

  class {'::icinga':
    dbtype     => 'mysql',
    dbhost     => 'localhost',
    dbuser     => 'icinga',
    dbpasswd   => 'icinga',
    dbname     => 'icinga',
  }

The 


## Limitations

This module has been tested only on Scientific Linux 6. 
It should be compatible with any RedHat 6 based distribution.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
