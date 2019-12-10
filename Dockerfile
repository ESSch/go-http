FROM golang:1.8 AS builder
WORKDIR /go/src/app
COPY ./app .
RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM alpine:latest
WORKDIR /root/
RUN apk add --update curl \
    && rm -rf /var/cache/apk/*
COPY --from=builder /go/src/app/main /root
EXPOSE 80
CMD ["./main"]
