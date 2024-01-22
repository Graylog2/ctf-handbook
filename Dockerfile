FROM python:3-alpine

ENV REPO=https://github.com/Graylog2/ctf-handbook
RUN pip install --upgrade pip

RUN pip install pymdown-extensions \
&& pip install mkdocs \
&& pip install mkdocs-material \
&& pip install mkdocs-rtd-dropdown \
&& pip install mkdocs-git-revision-date-plugin \
&& pip install mkdocs-git-revision-date-localized-plugin \
&& pip install mkdocs-dracula-theme \
&& mkdocs new /mk
COPY mkdocs.yml /mk/mkdocs.yml
WORKDIR /mk

ENTRYPOINT mkdocs serve --dev-addr 0.0.0.0:8000