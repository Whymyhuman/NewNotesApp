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
GRADLE_WRAPPER_PROPERTIES="$SCRIPT_DIR/gradle/wrapper/gradle-wrapper.properties"

# Check if the wrapper JAR exists, if not, download it.
if [ ! -f "$GRADLE_WRAPPER_JAR" ]; then
    echo "Downloading Gradle wrapper JAR..."
    if [ -f "$GRADLE_WRAPPER_PROPERTIES" ]; then
        DISTRIBUTION_URL=$(grep "^distributionUrl" "$GRADLE_WRAPPER_PROPERTIES" | cut -d'=' -f2- | sed 's/\\://g')
        if [ -n "$DISTRIBUTION_URL" ]; then
            # Extract the wrapper JAR URL from the distribution URL
            WRAPPER_JAR_URL=$(echo "$DISTRIBUTION_URL" | sed 's/-bin.zip/-wrapper.jar/')
            if [ -n "$WRAPPER_JAR_URL" ]; then
                mkdir -p "$(dirname "$GRADLE_WRAPPER_JAR")"
                wget -q "$WRAPPER_JAR_URL" -O "$GRADLE_WRAPPER_JAR"
                if [ $? -ne 0 ]; then
                    echo "Failed to download Gradle wrapper JAR from $WRAPPER_JAR_URL"
                    exit 1
                fi
            else
                echo "Could not determine wrapper JAR URL from distributionUrl: $DISTRIBUTION_URL"
                exit 1
            fi
        else
            echo "distributionUrl not found in $GRADLE_WRAPPER_PROPERTIES"
            exit 1
        fi
    else
        echo "$GRADLE_WRAPPER_PROPERTIES not found."
        exit 1
    fi
fi

# Execute the Gradle wrapper.
exec "$JAVACMD" -jar "$GRADLE_WRAPPER_JAR" "$@"