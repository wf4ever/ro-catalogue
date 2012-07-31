@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\uk\org\taverna\scufl2\scufl2-api\0.10-SNAPSHOT\scufl2-api-0.10-SNAPSHOT.jar;"%REPO%"\uk\org\taverna\scufl2\scufl2-ucfpackage\0.10-SNAPSHOT\scufl2-ucfpackage-0.10-SNAPSHOT.jar;"%REPO%"\uk\org\taverna\scufl2\scufl2-t2flow\0.10-SNAPSHOT\scufl2-t2flow-0.10-SNAPSHOT.jar;"%REPO%"\uk\org\taverna\scufl2\scufl2-scufl\0.10-SNAPSHOT\scufl2-scufl-0.10-SNAPSHOT.jar;"%REPO%"\junit\junit\4.4\junit-4.4.jar;"%REPO%"\commons-beanutils\commons-beanutils\1.7.0\commons-beanutils-1.7.0.jar;"%REPO%"\commons-logging\commons-logging\1.0.3\commons-logging-1.0.3.jar;"%REPO%"\org\openrdf\elmo\elmo-api\1.5\elmo-api-1.5.jar;"%REPO%"\javax\persistence\persistence-api\1.0\persistence-api-1.0.jar;"%REPO%"\org\openrdf\elmo\elmo-sesame\1.5\elmo-sesame-1.5.jar;"%REPO%"\org\openrdf\elmo\elmo-core\1.5\elmo-core-1.5.jar;"%REPO%"\jboss\javassist\3.7.ga\javassist-3.7.ga.jar;"%REPO%"\org\openrdf\elmo\elmo-repository\1.5\elmo-repository-1.5.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-event\2.2.4\sesame-repository-event-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-http\2.2.4\sesame-repository-http-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-turtle\2.2.4\sesame-rio-turtle-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-manager\2.2.4\sesame-repository-manager-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-http-client\2.2.4\sesame-http-client-2.2.4.jar;"%REPO%"\commons-httpclient\commons-httpclient\3.1\commons-httpclient-3.1.jar;"%REPO%"\commons-codec\commons-codec\1.3\commons-codec-1.3.jar;"%REPO%"\org\openrdf\sesame\sesame-http-protocol\2.2.4\sesame-http-protocol-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-contextaware\2.2.4\sesame-repository-contextaware-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryparser-sparql\2.2.4\sesame-queryparser-sparql-2.2.4.jar;"%REPO%"\info\aduna\commons\aduna-commons-net\2.2\aduna-commons-net-2.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-text\2.2\aduna-commons-text-2.2.jar;"%REPO%"\org\openrdf\sesame\sesame-runtime\2.2.4\sesame-runtime-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryparser-serql\2.2.4\sesame-queryparser-serql-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryresultio-api\2.2.4\sesame-queryresultio-api-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryresultio-binary\2.2.4\sesame-queryresultio-binary-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryresultio-sparqljson\2.2.4\sesame-queryresultio-sparqljson-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryresultio-sparqlxml\2.2.4\sesame-queryresultio-sparqlxml-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-queryresultio-text\2.2.4\sesame-queryresultio-text-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-dataset\2.2.4\sesame-repository-dataset-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-ntriples\2.2.4\sesame-rio-ntriples-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-n3\2.2.4\sesame-rio-n3-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-trix\2.2.4\sesame-rio-trix-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-trig\2.2.4\sesame-rio-trig-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-sail-nativerdf\2.2.4\sesame-sail-nativerdf-2.2.4.jar;"%REPO%"\org\openrdf\sesame\sesame-sail-rdbms\2.2.4\sesame-sail-rdbms-2.2.4.jar;"%REPO%"\commons-dbcp\commons-dbcp\1.2.2\commons-dbcp-1.2.2.jar;"%REPO%"\commons-pool\commons-pool\1.3\commons-pool-1.3.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-rdfxml\2.2.4\sesame-rio-rdfxml-2.2.4.jar;"%REPO%"\info\aduna\commons\aduna-commons-xml\2.2\aduna-commons-xml-2.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-platform-info\2.2\aduna-commons-platform-info-2.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-lang\2.2\aduna-commons-lang-2.2.jar;"%REPO%"\org\slf4j\slf4j-api\1.5.0\slf4j-api-1.5.0.jar;"%REPO%"\org\slf4j\slf4j-log4j12\1.4.3\slf4j-log4j12-1.4.3.jar;"%REPO%"\log4j\log4j\1.2.13\log4j-1.2.13.jar;"%REPO%"\org\openrdf\elmo\elmo-dynabean\1.5\elmo-dynabean-1.5.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-sail\2.3.2\sesame-repository-sail-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-repository-api\2.3.2\sesame-repository-api-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-sail-api\2.3.2\sesame-sail-api-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-queryparser-api\2.3.2\sesame-queryparser-api-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-queryalgebra-model\2.3.2\sesame-queryalgebra-model-2.3.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-collections\2.7.0\aduna-commons-collections-2.7.0.jar;"%REPO%"\org\openrdf\sesame\sesame-query\2.3.2\sesame-query-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-rio-api\2.3.2\sesame-rio-api-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-model\2.3.2\sesame-model-2.3.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-i18n\1.3.0\aduna-commons-i18n-1.3.0.jar;"%REPO%"\info\aduna\commons\aduna-commons-iteration\2.8.0\aduna-commons-iteration-2.8.0.jar;"%REPO%"\org\openrdf\sesame\sesame-sail-memory\2.3.2\sesame-sail-memory-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-sail-inferencer\2.3.2\sesame-sail-inferencer-2.3.2.jar;"%REPO%"\org\openrdf\sesame\sesame-queryalgebra-evaluation\2.3.2\sesame-queryalgebra-evaluation-2.3.2.jar;"%REPO%"\info\aduna\commons\aduna-commons-concurrent\2.6.0\aduna-commons-concurrent-2.6.0.jar;"%REPO%"\info\aduna\commons\aduna-commons-io\2.8.0\aduna-commons-io-2.8.0.jar;"%REPO%"\org\openrdf\elmo\elmo-codegen\1.5\elmo-codegen-1.5.jar;"%REPO%"\org\openrdf\elmo\elmo-owl\1.5\elmo-owl-1.5.jar;"%REPO%"\org\openrdf\elmo\elmo-rdfs\1.5\elmo-rdfs-1.5.jar;"%REPO%"\commons-cli\commons-cli\1.0\commons-cli-1.0.jar;"%REPO%"\commons-lang\commons-lang\1.0\commons-lang-1.0.jar;"%REPO%"\org\codehaus\jackson\jackson-mapper-asl\1.9.3\jackson-mapper-asl-1.9.3.jar;"%REPO%"\org\codehaus\jackson\jackson-core-asl\1.9.3\jackson-core-asl-1.9.3.jar;"%REPO%"\com\sun\jersey\jersey-client\1.11\jersey-client-1.11.jar;"%REPO%"\com\sun\jersey\jersey-core\1.11\jersey-core-1.11.jar;"%REPO%"\org\purl\wf4ever\scufl2-wfdesc\0.3-SNAPSHOT\scufl2-wfdesc-0.3-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="scufl2-to-wfdesc" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" org.purl.wf4ever.wfdesc.scufl2.ConvertToWfdesc %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
