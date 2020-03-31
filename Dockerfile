FROM alpine:latest

RUN apk add --no-cache bash curl drill

ENV CRON_INTERVAL="0 */6 * * *"

VOLUME /config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY nsupdate /opt/nsupdate
RUN rm -rf /opt/nsupdate/nsupdate.d && \
    ln -s /config /opt/nsupdate/nsupdate.d

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail","-fn0","/var/log/nsupdate.log"]