FROM openjdk:17
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY target/SpringBoot-HelloWorld.jar app.jar

COPY src/react-app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

#EXPOSE 8080
EXPOSE 80
ENTRYPOINT ["java", "-jar", "app.jar"]

CMD ["cmd", "/c", "start C:\\nginx\\sbin\\nginx.exe && java -jar app.jar"]



