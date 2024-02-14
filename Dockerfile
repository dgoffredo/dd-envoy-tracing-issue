FROM golang:1.22-bullseye AS builder

WORKDIR /src

COPY . .
RUN go build -o sidecar ./cmd/sidecar.go

FROM gcr.io/distroless/base as sidecar

COPY --from=builder /src/sidecar /ingress-sidecar