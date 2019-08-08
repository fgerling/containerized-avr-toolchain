FROM alpine
RUN apk add build-base
RUN apk add curl
WORKDIR /avr
COPY ./env.conf /avr/
COPY ./run.sh /avr/
ENTRYPOINT /bin/sh
