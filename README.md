For any questions on the app, this is based on Wordpress:Apache Image please read the docker git repo https://github.com/docker-library/wordpress/tree/913115b209407ae0ed9d38a13e8e5d8b909b431f/php5.6/apache

Example of how to add AppDynamics PHP Agent to a Wordpress Apache container

Clone this repo; modify docker-compose.yml to setup your agent environment variables.

Download and rename the PHP agent to appdynamics.tar.bz2

Set the AppDynamics values, in docker-compose.yml. (Account, Tier, Application, Access Key, Controller, Controller Port)

If you want to change nodename, /usr/local/bin/docker-entrypoint.sh script. By default it will set the AppDynamics Node name to the first 12 characters of the containerid.

Note that I did not do any error handling in my script example.  I modified docker-entrypoint.sh to use environment variables passed in at runtime to overwrite the appdynamics_agent.ini before Wordpress starts. 

Build image docker build -t appd-php:latest .

Run Example: docker-compose up -d

If you need to inspect the logs, they will be located in /opt/appdynamics/php-agent/logs
