FROM amazoncorretto
COPY ./target/my-app-1.0-SNAPSHOT.jar /home/helloworld.jar
WORKDIR /home
CMD ["java", "-jar", "helloworld.jar"]