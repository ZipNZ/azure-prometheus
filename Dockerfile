FROM prom/prometheus:v2.12.0
USER root
COPY new-entry-point.sh /new-entry-point.sh
RUN chmod +x /new-entry-point.sh

USER nobody
ENTRYPOINT [ "sh", "/new-entry-point.sh" ]
CMD [ "/bin/prometheus", \
        "--config.file=/etc/prometheus/prometheus.yml", \
        "--web.console.libraries=/usr/share/prometheus/console_libraries", \
        "--web.console.templates=/usr/share/prometheus/consoles" ]