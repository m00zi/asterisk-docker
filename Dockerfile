FROM debian:jessie
COPY ./build.sh /tmp/
COPY ./start.sh /
COPY ./odbc_config /usr/bin/
ENV SIP_PORT 5061
ENV SIP_PORT_TCP 5061
ENV RTP_PORT_START 10000
ENV RTP_PORT_END 10150
RUN /bin/sh /tmp/build.sh
WORKDIR /root
COPY odbcinst.ini /etc/
COPY odbc.ini /etc/
CMD ["/bin/sh", "/start.sh"]
