FROM hashtopolis/backend

USER root

RUN apache2ctl configtest

RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb; \
    a2ensite default-ssl
