FROM amd64/openjdk:20
WORKDIR /app
ADD target/myapp-spring-mysql.jar myapp-spring-mysql.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/myapp-spring-mysql.jar"]