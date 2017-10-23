FROM php:7.0-apache
MAINTAINER esassone@siu.edu.ar

#--------------------------------------------- ENCODIGN es_AR.URF-8 -----------------------------------------
RUN echo "es_AR.UTF-8 UTF-8" >> /etc/locale.gen
RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen es_AR.UTF-8
RUN update-locale LANG=es_AR.UTF-8
RUN localedef -i es_AR  -c -f UTF-8 -A /usr/share/locale/locale.alias es_AR.UTF-8
ENV LANG es_AR.UTF-8

#--------------------------------------------- PHP CONFIG -----------------------------------------
RUN printf "error_reporting = E_ALL\n" >> /usr/local/etc/php/php.ini
RUN printf "display_errors=On\n" >> /usr/local/etc/php/php.ini
RUN printf "output_buffering=4096\n" >> /usr/local/etc/php/php.ini

#--------------------------------------------- GIT y SVN -----------------------------------------
RUN apt-get install -y git-core
RUN apt-get install -y subversion

