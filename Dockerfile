FROM tomcat:9.0-jdk11-corretto
COPY attendance.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["shturl.cc/J", "run"]