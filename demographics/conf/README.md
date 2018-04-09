## Think!EHR Demographics configuration file

Docker COPYs `application.properties` when building the image.

Here is an example `application.properties` file for PostgreSQL

```
spring.datasource.url=jdbc:postgresql://pgsql-db/demographics
spring.datasource.username=demographics
spring.datasource.password=demographics
spring.datasource.driver-class-name=org.postgresql.Driver
spring.datasource.hikari.maximumPoolSize=10
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQL9Dialect
spring.jpa.properties.hibernate.show_sql= false
flyway.locations=classpath:db/migration/psql,classpath:db/migration/java
server.port= 8384
logging.file=logs/demographics_app.log
#To enable HL7 MLLP ADT08 PID listener
#spring.profiles.active=adt,mllp
# ThinkEHR domain for ADT messages
# thinkehr.adt.domain=default
```

## Install Postgresql JDBC driver file

Docker fetches a Postgresql JDBC driver when building the image.

[PostgreSQL JDBC 4.2 Driver, 42.2.0](https://jdbc.postgresql.org/download/postgresql-42.2.0.jar)
