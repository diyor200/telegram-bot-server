FROM golang:1.21.1 AS builder

RUN go version

COPY . /telegram-bot-server

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o ./.bin/app ./main.go

FROM alpine:latest

WORKDIR /root/
COPY -- from=builder /telegram-bot-server/.bin/app .
CMD ["app"]