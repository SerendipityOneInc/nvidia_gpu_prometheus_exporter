FROM golang:latest AS build
RUN go install github.com/plazonic/nvidia_gpu_prometheus_exporter@latest

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=build /go/bin/nvidia_gpu_prometheus_exporter /usr/local/bin/
CMD ["nvidia_gpu_prometheus_exporter"]

