REM  A script to invoke some sample curl commands on a Unix based machine
REM  against running container images of the app-specific Gilhari microservice 
REM  gilhari5_source_mysql_local:3.0 and gilhari5_dest_postgres_local:2.0 .
REM
REM  The responses are recorded in a log file (curl.log).
REM

:DefaultPorts
SET port1=8082
SET port2=8083
GOTO Proceed

:Proceed

echo ** BEGIN OUTPUT ** > curl.log
echo. >> curl.log

echo **First Gilhari instance is used to retrieve data from MySQL database**
echo Using PORT number %port1% >> curl.log
echo. >> curl.log

echo  *"Query Loan records"* >> curl.log
curl -X GET "http://localhost:%port1%/gilhari/v1/Loan"  -H "Content-Type: application/json" > ./bin/loans.json
echo Succesful! >> curl.log
echo. >> curl.log
echo. >> curl.log


echo  "Sort loans data by return date (most immediate to latest) and save in new file">> curl.log
jq "sort_by(.return_date)" ./bin/loans.json > ./bin/sorted_loans.json
echo Succesful! >> curl.log
echo. >> curl.log
echo. >> curl.log

echo *"Clear all pre-existing Loan History objects to start fresh"* >> curl.log
echo Using PORT number %port2%>> curl.log
curl -X DELETE "http://localhost:%port2%/gilhari/v1/LoanH" >> curl.log
echo Succesful! >> curl.log
echo. >> curl.log
echo. >> curl.log


echo *"Insert sorted loan records in Postgres database"* >> curl.log
jq "{entity: .}" ./bin/sorted_loans.json > ./bin/to_post.json
echo Wrapping complete! >> curl.log
echo Using PORT number %port2% >> curl.log
curl -X POST "http://localhost:%port2%/gilhari/v1/LoanH"  -H "Content-Type: application/json"  -d "@./bin/to_post.json" >> curl.log
echo Succesful! >> curl.log
echo. >> curl.log
echo. >> curl.log


echo *"Query all loan records to confirm"* >> curl.log
curl -X GET "http://localhost:%port2%/gilhari/v1/LoanH"  -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo Succesful! >> curl.log
echo. >> curl.log

echo ** END OUTPUT ** >> curl.log
echo. >> curl.log

cat curl.log
