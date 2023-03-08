FROM golang:latest@sha256:74a382917f6eaa7cc2d000dc2cd412a7f823f343b3b6268b20d84d057bc56718
MAINTAINER bhaavanmerchant@gmail.com

RUN apt-get -y update && apt-get install -y openjdk-7-jre-headless

RUN go get -d -u github.com/google/battery-historian
WORKDIR /go/src/github.com/google/battery-historian
RUN go run setup.go

EXPOSE 9999
CMD go run cmd/battery-historian/battery-historian.go --port 9999
