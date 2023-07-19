FROM openjdk:11
RUN mkdir -p /home/nive/dir1
WORKDIR /home/nive/dir1
COPY target/*.jar /home/nive/dir1
EXPOSE 80
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]


