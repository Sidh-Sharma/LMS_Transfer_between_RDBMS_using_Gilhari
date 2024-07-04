## Reverse Engineering files of source database ##
```reveng``` contains files to Reverse Engineer java container classes and declare the Object Relational Mapping (ORM) specification file.
The structure and execution is very similar to ```examples/JDX_ReverseEngineeringJSONExample``` as shipped with the Gilhari SDK. Refer to said example for better understanding. 

This directory specifically demonstrates reverse engineering of relational schema for a JSON object data model.

* It is assumed that the environment variable JX_HOME is set to the top level directory where JDX ORM SDK has been installed.

* setEnvironment.bat file contains the setting of the classpath environment variable including that of an appropriate JDBC driver. Please change it as per your local setup.

* The .config file in the config directory is the template mapping file that includes the name of the tables to be reverse engineered along with some other optional configuration information like name of a package and a super class. Please change the JDX_DATABASE URL and the JDBC_DRIVER name appropriately as per your local setup.

* JDXReverseEngineer.bat file runs the JDX reverse engineering tool from the command line.

* The reverse engineered classes will be generated in this directory. The corresponding mapping file, with an extension of .revjdx, will be generated in the config directory.

* The reverse-engineered mapping file may also create/contain mapping specifications for any relationships (one-to-one or one-to-many) amongst the reverse engineered classes based on the relational schema for the specified tables. 

* You may manually modify the reverse engineered files as per your needs. For example, you may remove/modify some attributes of the generated class and their mappings.

* You may compile the reverse engineere classes with a script like compile.cmd file.
