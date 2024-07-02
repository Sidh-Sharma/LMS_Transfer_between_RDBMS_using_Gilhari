# Transfer_between_RDBMS_Local
 **Trial run of tranferring data between two RDBMS(MySQL to Postgres)**

 Created a source MySQL database (name: db1; username: testdb; password: software_source5). Filled with data using ```autoPopulate.py``` in ```sourcedb```.
 Reverse Engineered Java source files/container classes and ORM specification file(```sourcedb\config\gilhari5_source_mysql_local.revjdx```)for said database using Gilhari SDK (https://www.softwaretree.com) configured appropriately as in ```reveng``` folder.

```sourcedb``` contains scripts to compile Java source files, build Docker image and run it to have the first Gilhari instance listen at ```localhost:8081```.
Classname mapping file and .jdx file as mentioned in ```gilhari5_source_mysql_local.config``` can be found in ```sourcedb\config```.


