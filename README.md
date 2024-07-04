# Library Management System using Gilhari microservice
## Overview ##
This project is an example of how Gilhari microservice framework can be used to transfer (JSON) data between two relational databases of different kinds (MySQL and Postgres).
The project shows:
* Reverse-engineering of a JSON object model (and its object relational mapping) from the first relational database having an existing schema (by using the JDX ORM).
* Populating the first database DB1 with x number of JSON objects by using Java/Python program or by configuring and using the Gilhari microservice framework (curl commands to perform POST requests). (Optional if DB1 already has the data that needs to be transferred)
* Using a Java/Python/GUI program to retrieve the existing data from the first database (DB1 of kind MySQL) using one instance of the Gilhari microservice and then to transfer the data to a second database (DB2 of kind Postgres) using another instance of the Gilhari microservice configured for the second database.

## Description ##

* The project simulates a library management system. On the "server" side, there is a MySQL source database with tables with data of Books, Authors, Members and Loans. On the "client" side, there is a Postgres destination database with a table to store loan history (in a chronological order). 
* There are two gilhari instances (one each for server and client). The first instance (listening on 8082) uses GET requests to stream data from the MySQL database. The second instance (listening on 8083) then uses a POST request to send the retrieved data to the second database.
* The database agnostic property of Gilhari allows for switching between the two databases in a very simple and straightforward manner.

## Setting up Gilhari ##

* Download Gilhari SDK from [SoftwareTree](https://www.softwaretree.com/v1/products/gilhari/gilhari_introduction.php)

* Read the documentation shipped with the SDK for more information about Gilhari

## Configuring the project ##

* It is recommended to use Java JDK-8 (install from official sources) while using JDX related tasks with Gilhari.

* Set environment variables for jdk, databases. Install Docker engine. 

* Clone the repository and place your local repository in the ```examples``` folder of your local installation of Gilhari SDK.

* Install jq, a command line JSON processor, from the official [source](https://jqlang.github.io/jq/). jq will help treatment of retrieved JSON data before tranfer to second database.

## Running the project

* ```curlTranfer.cmd``` can be used to automate the retrieval and transfer process. A record of operations performed is stored in ```curl.txt```.
      1. curl commands are used to send GET request to Gilhari on localhost8082.
      2. This JSON data is then stored in the ```bin``` directory as ```loans.json```.
      3. Subsquent jq commands allow for sorting of the data on the command line itself. Here, the return_date attribute is used to sort the data, stored as ```bin/sorted_loans.json```.
      4. Next step is to clear any pre-existing data in the Postgres database by using Gilhari to send DELETE request on 8083.
      5. jq is again used to wrap the data with the "entity" keyword and the file ```bin/to_post.json``` is ready to be transferred using a POST request sent by Gilhari on 8083.

* On separate command terminal windows, navigate to ```sourcedb``` and ```targetdb```. Follow README in ```sourcedb``` and ```targetdb``` to run a Gilhari instance each. Now, open a new command terminal window, navigate to this parent directory and run ```curlTransfer.cmd```.


>[!NOTE]
>Gilhari is a product of Software Tree, LLC. Use is permitted only with a valid license as issued by Software Tree, LLC. FOr more information, please refer to Software Tree's [website](https://www.softwaretree.com)
