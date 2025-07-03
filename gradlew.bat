@rem
@rem Copyright 2017 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @set DEBUG=false

@if "%OS%" == "Windows_NT" @setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
@set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"

@rem Find Java
@if defined JAVA_HOME goto findJavaFromJavaHome

@for %%i in (java.exe) do @if "%%~$PATH:i" NEQ "" @set JAVA_EXE=%%~$PATH:i
@if defined JAVA_EXE goto execute

@echo.
@echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
@echo.
@echo Please set the JAVA_HOME variable in your environment to match the
@echo location of your Java installation.
@echo.
goto fail

:findJavaFromJavaHome
@set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
@if exist %JAVA_EXE% goto execute
@echo.
@echo ERROR: JAVA_HOME is set to an invalid directory. --^>
@echo JAVA_HOME = "%JAVA_HOME%"
@echo Please set the JAVA_HOME variable in your environment to match the
@echo location of your Java installation.
@echo.
goto fail

:execute
@set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Set "user.dir" to the root of the project
@set DIR=%CD%
@for %%i in (%0) do @set APP_HOME=%%~dpi
@set APP_HOME=%APP_HOME:~0,-1%
@for %%i in (%APP_HOME%) do @set APP_HOME=%%~dpi
@set APP_HOME=%APP_HOME:~0,-1%

@rem Execute Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

:fail
@if "%OS%" == "Windows_NT" @endlocal
@exit /b 1
