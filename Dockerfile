# Start from a minimal secure base image
FROM debian:bullseye-slim

LABEL maintainer="cncf@example.com"

# Update and install vulnerable package (intentionally outdated)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        libssl1.1 && \
    rm -rf /var/lib/apt/lists/*

# Dummy application step (can be anything)
WORKDIR /app
COPY . /app

CMD ["/bin/bash"]

