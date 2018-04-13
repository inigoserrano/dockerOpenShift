FROM jboss/wildfly:10.0.0.Final

ADD https://downloads.mariadb.com/Connectors/java/connector-java-1.5.9/mariadb-java-client-1.5.9.jar /wildfly/modules/system/layers/base/org/mariadb/jdbc/main/
COPY librerias/module.xml /wildfly/modules/system/layers/base/org/mariadb/jdbc/main/
COPY aplicacion/Aplicacion.war /wildfly/standalone/deployments/

RUN /wildfly/bin/add-user.sh admin Admin#123 --silent

EXPOSE 9990

VOLUME /wildfly/standalone/deployments/

CMD ["/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
