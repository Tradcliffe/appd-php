FROM wordpress:apache

#APPD Copy Appdynamics agent zip and extract to directory
RUN mkdir /opt/appdynamics
COPY appdynamics.tar.bz2 /tmp
RUN tar -xvjf /tmp/appdynamics.tar.bz2 &&  rm /tmp/appdynamics.tar.bz2 && \
mv appdynamics-php-agent-linux_x64 /opt/appdynamics/php-agent
RUN chmod -R 755 /opt/appdynamics/php-agent
RUN chmod -R 777 /opt/appdynamics/php-agent/logs

#APPD Run agent installation
COPY setup.sh /opt/appdynamics
RUN chmod 755 /opt/appdynamics/setup.sh
RUN /opt/appdynamics/setup.sh

#APPD Modified Entrypoint Script to include AppD
#APPD Added Entrypoint and CMD 
WORKDIR /var/www/html
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]