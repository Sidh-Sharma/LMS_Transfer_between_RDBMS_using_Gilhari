dir /s /B *.java > sources.txt
set classpath=..;.\bin;
javac -d .\bin -cp ".;%JX_HOME%\config;%JX_HOME%\libs\jxclasses.jar;%JX_HOME%\libs\jdxtools.jar;%JX_HOME%\external_libs\json-20160212.jar @sources.txt
