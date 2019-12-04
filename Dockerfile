FROM golang:1.8 AS builder
WORKDIR /go/src/app
COPY ./app .
RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/app/main /root
CMD ["./main"]
