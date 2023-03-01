FROM alpine

ARG VERSION
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH:-amd64}

WORKDIR /app

ADD https://github.com/layou233/NeverIdle/releases/download/${VERSION}/NeverIdle-linux-${TARGETARCH} /app/NeverIdle

RUN chmod a+x /app/NeverIdle

# Usage of /app/NeverIdle:
#   -c duration
#     	Interval for CPU waste
#   -m int
#     	GiB of memory waste
#   -n duration
#     	Interval for network speed test
CMD ["/app/NeverIdle", "-c", "1h7m", "-m", "2", "-n", "2h1m"]
