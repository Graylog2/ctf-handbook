FROM python:3-alpine

ARG USER=1001
ARG REPO=https://github.com/Graylog2/ctf-handbook.git
RUN adduser -h /usr/src/mkdocs -D -u $USER mkdocs \
&& apk add bash \
&& apk add git 

ENV PATH="${PATH}:/usr/src/mkdocs/.local/bin"
ENV REPO=$REPO

USER mkdocs
RUN mkdir -p /usr/src/mkdocs/build
WORKDIR /usr/src/mkdocs/build

RUN pip install --upgrade pip \
&& pip install pymdown-extensions \
&& pip install mkdocs \
&& pip install mkdocs-material \
&& pip install mkdocs-rtd-dropdown \
&& pip install mkdocs-git-revision-date-plugin \
&& pip install mkdocs-git-revision-date-localized-plugin \ 
&& pip install pip install mkdocs-dracula-theme

USER root

COPY ./scripts/update.sh update.sh
COPY ./scripts/launch.sh launch.sh
COPY ./scripts/update.cron /etc/cron.d/update


RUN chmod 0644 /etc/cron.d/update \
&& chmod 0744 /usr/src/mkdocs/build/update.sh \
&& crontab /etc/cron.d/update \
&& touch /var/log/cron.log \
&& chmod 0744 /usr/src/mkdocs/build/launch.sh \
&& git clone $REPO /build/ \
&& chown mkdocs:mkdocs -R /build

USER mkdocs

EXPOSE 10080

ENTRYPOINT ["/usr/src/mkdocs/build/launch.sh"]