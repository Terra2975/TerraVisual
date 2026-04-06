#!/bin/bash

GRADLE_VERSION=8.8
JAR_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

echo "Downloading Gradle wrapper..."
mkdir -p gradle/wrapper
curl -L "$JAR_URL" -o gradle/wrapper/gradle-wrapper.zip
unzip -o gradle/wrapper/gradle-wrapper.zip -d gradle/wrapper/
mv gradle/wrapper/gradle-${GRADLE_VERSION}/bin gradle/wrapper/
mv gradle/wrapper/gradle-${GRADLE_VERSION}/lib gradle/wrapper/

echo "#!/bin/sh" > gradlew
echo 'exec java -cp gradle/wrapper/lib/gradle-wrapper.jar org.gradle.wrapper.GradleWrapperMain "$@"' >> gradlew
chmod +x gradlew

./gradlew build
