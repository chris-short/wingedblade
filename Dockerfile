FROM usefathom/fathom:version-1.2.1

ARG fdbstrg
ARG fsecret

ENV FDBSTRG $fdbstrg
ENV FSECRET $fsecret

COPY env.sh /app/env.sh
RUN /app/env.sh

EXPOSE 8080/tcp

HEALTHCHECK --retries=10 CMD ["wget", "-qO-", "http://localhost:8080/health"]

CMD [ "./fathom","--config","/app/fathom.env","server" ]