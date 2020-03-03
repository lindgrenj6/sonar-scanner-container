FROM openjdk:8
MAINTAINER jlindgre@redhat.com

# Install sonar-scanner to /opt/
RUN cd /opt && \
    curl -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip | \
    jar xvf /dev/stdin && \
    mv sonar-scanner-4.3.0.2102-linux sonar-scanner

CMD ["bash", "-c", "java -Dsonar.projectBaseDir=/work -Dproject.settings=/work/sonar-scanner.properties -jar /opt/sonar-scanner/lib/sonar-scanner-cli-4.3.0.2102.jar"]
