FROM alpine
RUN apk add build-base
RUN apk add curl
WORKDIR /app
COPY ./run.sh /app/
VOLUME ["/avr-toolchain"]
ENTRYPOINT /app/run.sh
