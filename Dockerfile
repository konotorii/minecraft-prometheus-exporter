## Image from https://hub.docker.com/_/golang
#FROM golang:1.22.2 AS builder
## smoke test to verify if golang is available
#RUN go version
#
#COPY . /usr/bin/minecraft-exporter
#WORKDIR /usr/bin/minecraft-exporter
#RUN set -Eeux && \
#    go mod download && \
#    go mod verify
#
#RUN GOOS=linux GOARCH=amd64 \
#    go build \
#    -trimpath \
#    -o app cmd/minecraftexporter/main.go
#RUN go test -cover -v ./...
#
################################################################################
## Stage 2 (to create a downsized "container executable", ~5MB)                #
################################################################################
#
## If you need SSL certificates for HTTPS, replace `FROM SCRATCH` with:
##
##   FROM alpine:3.17.1
##   RUN apk --no-cache add ca-certificates
##
#FROM scratch
#WORKDIR /root/
#COPY --from=builder /usr/bin/minecraft-exporter .
#
#ENTRYPOINT ["./app"]
# Dockerfile
FROM cgr.dev/chainguard/static@sha256:288b818c1b3dd89776d176f07f5f671b118fe836c4d80ec2cc3299b596fe71b7
COPY minecraft-exporter \
	/usr/bin/minecraft-exporter
ENTRYPOINT ["/usr/bin/minecraft-exporter"]