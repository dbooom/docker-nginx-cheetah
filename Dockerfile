FROM nginx

# Install gettext
RUN apt-get update \
    && apt-get install -y python-cheetah \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY templates /etc/nginx/templates
WORKDIR /usr/share/nginx/html

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
