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

This icinga module allows you to setup an [Icinga 2](https://www.icinga.org/) monitoring system.

Available at 
[Puppet Forge](https://forge.puppetlabs.com/talamoig/icinga) and 
[GitHub](https://github.com/talamoig/icinga).

## Module Description

This module installs Icinga 2 backend by default and can optionally install the Classic UI and the Icinga Web 1.x interface.

The web interface `icingaweb2` is available as a separate module at
([github](https://github.com/talamoig/icingaweb2) and [puppet
forge](https://forge.puppetlabs.com/talamoig/icingaweb2).

Both MySQL and PostgreSQL database are supported and is assumed that database schema and user have already been created.
If it has not been done, after the puppet module has been installed you should run
the following command for MySQL:

    mysql -u root -p icinga < /usr/share/icinga2-ido-mysql/schema/mysql.sql

and the following for PostgreSQL:

    psql -U icinga -d icinga < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql

For further information please read the  
[MySQL](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#setting-up-mysql-db)
and 
[PostgreSQL](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#installing-database-postgresql-server)
on the official Icinga 2 documentation.

## Setup

### What icinga affects

* configuration files and directories (`/etc/icinga2`)
* a new yum repository will be installed by default

The yum repository installation can be disabled passing `with_repo => False` to the `icinga` class.

### Setup Requirements

A database (local or remote) with proper credential must be available.

### Beginning with icinga

To install Icinga with default parameters 

     class {'::icinga': }

With default parameters icinga will connect to a MySQL database on localhost named `icinga`.
The used credentials are `icinga`/`icinga` as username/password.
This is equivalent to:

     class {'::icinga':
	   dbtype     => 'mysql',
	   dbhost     => 'localhost',
	   dbuser     => 'icinga',
	   dbpasswd   => 'icinga',
	   dbname     => 'icinga',
	   }

The parameters names are self-explainatory. `dbtype` can be `mysql` of `pgsql` for PostgreSQL database.
Other two available parameters are `enabled_features` and `disabled_features`, eg:

	enabled_features => ['api', 'syslog']

The list of available/disabled features can be obtained with the `icinga2 feature list` command from command line.
The `ido-mysql` or `ido-pgsql` (for database interface) feature is installed automatically according
to the `dbtype` parameter.

For using the Icinga Web 1.x interface you will need at least the following features: 'statusdata', 'compatlog', 'command'.

#### Installing the Classic UI

To install the Classic UI set `with_classicui => true` as parameter to the `icinga` class or with:

   class{'::icinga::classicui':}

If you also want to create the initial database schema you can add the parameter:

    initdb => true,    

Please note that this features has not been carefully tested so use it at your own risk.

You can also create users to the Classic UI with eg:
    icinga::classicui::user {'username':
       passwd => 'HashPa22worD',
    }

The `HashPa22worD` is a typical `htpasswd` hash and can be generated with `htpasswd -n username`.
This features requires this [htpasswd](https://forge.puppetlabs.com/leinaddm/htpasswd) puppet module to be installed.

##### Installing the Icinga Web 1.x

To install the Icinga Web 1.x set `with_webgui => true` as parameter to the `icinga` class or

   class{'::icinga::webgui':}

Also this class sopports the `initdb` parameters.

### Typical Scenarios

Here we describe some typical setups for Icinga.

#### Scenario 1: All-in-one

In this setup we have a node called `monitoring-host` that will have:

 * a MySQL database for Icinga 2 monitoring;
 * Icinga 2 monitoring;
 * Classic UI interface;
 * Web 1.x interface.

This installation requires the following puppet modules installed:

 * [mysql](https://forge.puppetlabs.com/puppetlabs/mysql);
 * [epel](https://forge.puppetlabs.com/stahnma/epel);
 * [apache](https://forge.puppetlabs.com/puppetlabs/apache).

A node like this can be configured with the following puppet code:

  class{'::epel':}
  
  class{'::icinga':
    initdb           => true,
    enabled_features => ['statusdata', 'compatlog', 'command'],
  }

  class{'::icinga::classicui':
    initdb              => true,    
  }
  
  class{'::icinga::webgui':
    initdb              => true,    
  }
  
  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
    override_options        => $override_options
  }
  
  class { 'apache':
    purge_configs => false,   
  }
  class {'::apache::mod::php': }
  
  mysql::db { 'icinga':
    user     => 'icinga',
    password => 'icinga',
    host     => 'localhost',
    grant    => ['ALL'],
  }
  mysql::db { 'icinga_web':
    user     => 'icinga_web',
    password => 'icinga_web',
    host     => 'localhost',
    grant    => ['ALL'],
  }


## Limitations

This module has been tested on Scientific Linux 6 and CentOS 6 with Puppet 3.1.1 and 3.7.4.
It should be compatible with any RedHat 6 based distribution.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
