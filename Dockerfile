FROM golang:alpine AS builder
RUN apk add --no-cache git && CGO_ENABLED=0 go get github.com/openrdap/rdap

FROM scratch
COPY --from=builder /go/bin/rdap /rdap

ENTRYPOINT ["./rdap"]
CMD ["-h"]
