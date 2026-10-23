# Use the official Tomcat 9 image with Java 11
FROM tomcat:9.0-jdk11-corretto
 
# Remove the default Tomcat welcome applications (optional)
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/docs \
           /usr/local/tomcat/webapps/examples \
           /usr/local/tomcat/webapps/host-manager \
           /usr/local/tomcat/webapps/manager
 
# Copy the war file into Tomcat's webapps folder
COPY attendance.war /usr/local/tomcat/webapps/attendance.war
 
# Use an entry point that adapts the port to Render's PORT variable
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh
 
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
HEALTHCHECK --start-period=60s --timeout=120s --retries=3 \
CMD curl -f http://127.0.0.1:8080/attendance/ || exit 1