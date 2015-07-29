FROM tomcat:7-jre8
MAINTAINER Jacob Tomlinson <jacob.tomlinson@informaticslab.co.uk>

RUN apt-get update \
 && apt-get install wget

RUN wget ftp://ftp.unidata.ucar.edu/pub/thredds/4.6/current/thredds.war -O ${CATALINA_HOME}/webapps/thredds.war

RUN catalina.sh start \
 && sleep 15 \
 && catalina.sh stop

EXPOSE 8080

CMD [ "catalina.sh", "run" ]
