FROM ubuntu:latest
RUN apt update
RUN apt install -y build-essential curl
WORKDIR /app
COPY ./run.sh /app/
VOLUME ["/avr-toolchain"]
ENTRYPOINT /app/run.sh
