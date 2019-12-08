FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/springbootapp-0.0.1-SNAPSHOT.jarr springbootapp.jar
RUN sh -c 'touch /employee-service.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/springbootapp.jar"]
EXPOSE 8089
