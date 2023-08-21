FROM eclipse-temurin:8

#RUN addgroup --system spring && newgrp spring
#RUN useradd -ms /bin/bash spring -g spring

#USER spring:spring

ARG JAR_FILE=target/*jar
COPY ${JAR_FILE} app.jar

CMD ["java","-Xms128M","-Xmx128M","-Dspring.profiles.active=prod","-jar","/app.jar"]
