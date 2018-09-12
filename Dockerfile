FROM node:carbon

RUN apt-get update && apt-get -y install cron

RUN mkdir /app
ADD app.js /app

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/app-cron

# Give execution rights on the cron job
RUN chmod +x /etc/cron.d/app-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log