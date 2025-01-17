REM A script to insert 50 Employee JSON objects into a running container image 
REM of the app-specific Gilhari microservice gilhari5_source_mysql_local:3.0.
REM
REM The responses are recorded in a log file (curl.log).
REM
REM This script assumes the default port number is 80, but you can 
REM specify a different port number as the first command line argument.
REM Example: curlCommands 8899

IF %1.==. GOTO DefaultPort
SET port=%1
GOTO Proceed

:DefaultPort
SET port=8082
GOTO Proceed

:Proceed

echo ** BEGIN OUTPUT ** > curl.log
echo. >> curl.log

echo Using PORT number %port% >> curl.log
echo. >> curl.log

for i in $(seq 100 110)
do
	# create loan object 
	loanid=$i
	bookid=$ (i-100)
	memberid=$ (((i-100)%5)+1)
	ldate=$ (2024-07-(i-109))
	rdate=$ (2024-08-($i-99))
	# Add the curl command to the log file and execute it
	echo "** Inserting Loan $ID" »> curl. log curl -X POST "http://localhost:80/gilhari/v1/Loan" -H 'Content Type: application/json' -d "{\"entity\":{\"loan_id\": $loanid, \"book_id"\: $bookid, \"member_id"\: $memberid, \"loan_date"\: $ldate, \"return_date"\: $rdate}}"
	echo "" >> curl. log
done

echo "**Completed inserting Loans**" >> curl. log
echo "" >> curl. log


echo ** Query all Loan objects ** >> curl.log
curl -X GET "http://localhost:%port%/gilhari/v1/Loan" -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo. >> curl.log

echo ** END OUTPUT ** >> curl.log
echo. >> curl.log

type curl.log
