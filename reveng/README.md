This directory demonstrates the reverse-engineering feature of Gilhari and JDX ORM such that given a template file identifying some existing tables in a database, JDX can generate the corresponding class definitions and the mapping specification.

This directory specifically demonstrates reverse engineering of relational schema for a JSON object data model.

Please see the Reverse Engineering section of JDX User Manual shipped with Gilhari SDK for more details.

- It is assumed that the environment variable JX_HOME is set to the top level directory where JDX ORM SDK has been installed.

- setEnvironment.bat file contains the setting of the classpath environment variable including that of an appropriate JDBC driver. Please change it as per your local setup.

- The .config file in the config directory is the template mapping file that includes the name of the tables to be reverse engineered along with some other optional configuration information like name of a package and a super class. Please change the JDX_DATABASE URL and the JDBC_DRIVER name appropriately as per your local setup.

- JDXReverseEngineer.bat file runs the JDX reverse engineering tool from the command line.

- The reverse engineered classes will be generated in this directory. The corresponding mapping file, with an extension of .revjdx, will be generated in the config directory.

- The reverse-engineered mapping file may also create/contain mapping specifications for any relationships (one-to-one or one-to-many) amongst the reverse engineered classes based on the relational schema for the specified tables. 

- You may manually modify the reverse engineered files as per your needs. For example, you may remove/modify some attributes of the generated class and their mappings.

- You may compile the reverse engineere classes with a script like compile.cmd file.
