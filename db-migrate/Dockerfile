FROM store/oracle/database-enterprise:12.2.0.1

COPY ./check-db.sh /home/oracle/check-db.sh
COPY ./import-data.sh /home/oracle/import-data.sh
COPY ./start-import.sh /home/oracle/start-import.sh
COPY ./sql.sql /home/oracle/sql.sql

USER root 

RUN chmod +x /home/oracle/check-db.sh
RUN chmod +x /home/oracle/import-data.sh
RUN chmod +x /home/oracle/start-import.sh

USER oracle

WORKDIR /home/oracle

RUN ./start-import.sh

#ENTRYPOINT ./check-db.sh
ENTRYPOINT /home/oracle/setup/dockerInit.sh

