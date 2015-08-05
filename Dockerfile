FROM tomcat:7-jre8
MAINTAINER Jacob Tomlinson <jacob.tomlinson@informaticslab.co.uk>

# Download Thredds
RUN wget ftp://ftp.unidata.ucar.edu/pub/thredds/4.3/4.3.23/thredds.war -O ${CATALINA_HOME}/webapps/thredds.war

# Start and stop tomcat once to expand the Thredds war file
RUN catalina.sh start \
 && while ! grep "INFO: Server startup in" logs/catalina* > /dev/null; do echo "Waiting for Tomcat..."; sleep 5; done \
 && catalina.sh stop \
 && rm ${CATALINA_HOME}/webapps/thredds.war

EXPOSE 8080

CMD [ "catalina.sh", "run" ]
