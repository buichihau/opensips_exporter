FROM golang:1.16.3-alpine3.13 AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/VoIPGRID/opensips_exporter.git
WORKDIR /go/opensips_exporter
RUN go build

FROM alpine:3.13
COPY --from=builder /go/opensips_exporter/opensips_exporter /usr/local/bin/
