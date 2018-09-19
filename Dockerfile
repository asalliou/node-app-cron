FROM node:carbon

RUN apt-get update && apt-get -y install cron

RUN mkdir /src

WORKDIR /src
ADD app/package.json /src/package.json
RUN npm install

# Add crontab file in the cron directory
ADD app/crontab /etc/cron.d/app-cron

# Give execution rights on the cron job
RUN chmod +x /etc/cron.d/app-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log