# Trial run of tranferring data between two RDBMS(MySQL to Postgres)
**Description**
 Created a source MySQL database (name: db1; username: testdb; password: software_source5). Filled with data using ```autoPopulate.py``` in ```sourcedb```.
 Reverse Engineered Java source files/container classes and ORM specification file(```sourcedb\config\gilhari5_source_mysql_local.revjdx```)for said database using Gilhari SDK (https://www.softwaretree.com) configured appropriately as in ```reveng``` folder.

```sourcedb``` contains scripts to compile Java source files, build Docker image and run it to have the first Gilhari instance listen at ```localhost:8081```.
Classname mapping file and .jdx file as mentioned in ```gilhari5_source_mysql_local.config``` can be found in ```sourcedb\config```.
```docs``` contains the ER diagram of the database which makes the details in the OR-Mapping file clearer. 
**Installation and Running**
1. Install Gilhari SDK from https://www.softwaretree.com. Follow README and Manual instructions for correct installation. 
2. Install and configure Java 8 compiler appropriately. Install database management applications as required. Note: If you are using MySQL 8.0 (anything above 5.7 really), pls install the corresponding newer JDBC driver and place it in the ```external_libs``` directory in the Gilhari SDK. Install and configure Docker engine appropriately.
3. Place the folders ```sourcedb``` and ```reveng``` in the ```examples``` directory of the Gilhari SDK.
4. To run ```autoPopulate.py```, first navigate to the parent directory and run ```pip install pymysql```. (Not necessary as database has now been populated with data already).
5. In the command terminal, navigate to ```sourcedb``` as in your configuration, and run the command files ```compile.cmd```, ```build.cmd``` and ```run_docker_app.cmd``` in order. 
6. To run curl commands as in ```curlPopulate.cmd``` and ```curlStreamData.cmd```, open a new terminal window, navigate to the directory and then run the command files. There should be corresponding activity on the earlier command terminal window below the confirmation message of Gilhari listening at some port (set here to 8081).
7. Postman can also be used to perfrom REST API calls. Refer to Gilhari_API manual as shipped with the SDK for more details. 

![Example output](<WhatsApp Image 2024-07-02 at 18.24.19_457771a6.jpg>)



