FROM ubuntu 
RUN apt update 
RUN apt-get update && apt-get -y install gnupg  && apt-get install -y lsb-release && apt-get clean all
RUN apt install -y wget
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-key add -
RUN  apt-get update
RUN apt clean 
ARG TZ=Etc/UTC
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install postgresql-12 postgresql-contrib -f -y
RUN apt-get -y install mysql-client
EXPOSE 80
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
CMD ["/bin/bash"]



