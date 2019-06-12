FROM alpine:latest

# RUN apk add g++ make cmake boost-dev gtest-dev
RUN apk add g++ make cmake boost-dev

WORKDIR /root/watchdog
