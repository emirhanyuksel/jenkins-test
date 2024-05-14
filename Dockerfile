FROM amazoncorretto:11-alpine3.16
COPY ./target/my-app-1.0-SNAPSHOT.jar /home/helloworld.jar
WORKDIR /home
CMD ["java", "-jar", "helloworld.jar"]
