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

This modules installs [icinga2](https://www.icinga.org/) backend only, so without any user interface.
The webinterface icingaweb2 is available as a [separete module](https://github.com/talamoig/icingaweb2).

It supports both MySQL and PostgreSQL database and assumes the database schema and user have already been created.
If you need to do it, please follow informations provided 
[here](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#setting-up-mysql-db)
for MySQL and 
[here](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#installing-database-postgresql-server)
for PostgreSQL.

## Setup

### What icinga affects

* configuration files and directories (`/etc/icinga2`)
* a new yum repo will be installed.

### Setup Requirements

A database (local or remote) with proper credential must be available.

### Beginning with icinga

To install Icinga with default parameters 

     class {'::icinga': }

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

The parameters names are self-explainatory. `dbtype` can be `pgsql` for PostgreSQL database.
Another parameter is `features` that contains the list of features to install, eg.:

	features => ['graphite', 'api']

The list of available/disabled features can be obtained with the `icinga2 feature list` command from command line.
Consider that the `ido-mysql` or `ido-pgsql` feature is installed automatically according
to the `dbtype` parameter.


## Limitations

This module has been tested only on Scientific Linux 6. 
It should be compatible with any RedHat 6 based distribution.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
