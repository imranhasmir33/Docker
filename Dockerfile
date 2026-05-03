FROM v2fly/v2fly-core:latest

WORKDIR /app

COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]