#!/usr/bin/env sh

##############################################################################
##
##  Gradle wrapper script for UNIX
##
##############################################################################

# Determine the Java command to run.
if [ -n "" ] ; then
    JAVACMD=""
elif [ -n "$JAVA_HOME" ] ; then
    JAVACMD="$JAVA_HOME/bin/java"
else
    JAVACMD="java"
fi

# Determine the script path.
SCRIPT_DIR=$(dirname "$0")

# Determine the Gradle wrapper JAR file.
GRADLE_WRAPPER_JAR="$SCRIPT_DIR/gradle/wrapper/gradle-wrapper.jar"

# Execute the Gradle wrapper.
exec "$JAVACMD" -jar "$GRADLE_WRAPPER_JAR" "$@"
