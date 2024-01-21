FROM python:3-alpine

ARG USER=1001
ARG REPO=https://github.com/Graylog2/ctf-handbook.git
RUN adduser -h /usr/src/mkdocs -D -u $USER mkdocs \
&& apk add bash \
&& apk add git 

ENV PATH="${PATH}:/usr/src/mkdocs/.local/bin"
ENV REPO=$REPO

EXPOSE 1234

USER mkdocs
RUN mkdir -p /usr/src/mkdocs/build
WORKDIR /usr/src/mkdocs/build

RUN pip install --upgrade pip

RUN pip install pymdown-extensions \
&& pip install mkdocs \
&& pip install mkdocs-material \
&& pip install mkdocs-rtd-dropdown \
&& pip install mkdocs-git-revision-date-plugin \
&& pip install mkdocs-git-revision-date-localized-plugin \ 
&& pip install pip install mkdocs-dracula-theme

USER root

COPY ./scripts/update.sh /usr/src/mkdocs/build/update.sh
RUN chmod 0744 /usr/src/mkdocs/build/update.sh

# Build Auto-update hack mess.  Jeeebus this is ugly.  
# As we always say in golf, there are no pictures in a Dockerfile

# Copy hello-cron file to the cron.d directory
COPY ./scripts/update.cron /etc/cron.d/update
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/update

# Apply cron job
RUN crontab /etc/cron.d/update
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log

COPY ./scripts/launch.sh /usr/src/mkdocs/build/launch.sh

# Run the command on container startup
RUN chmod 0744 /usr/src/mkdocs/build/launch.sh
RUN git clone $REPO /build/
RUN chown mkdocs:mkdocs -R /build

USER mkdocs

ENTRYPOINT ["/usr/src/mkdocs/build/launch.sh"]