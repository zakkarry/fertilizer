FROM python:3.11-slim-bookworm

WORKDIR /app

COPY docker_start ./

RUN echo "----- Installing build dependencies" \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    gcc
    
# Install build dependencies
RUN echo "----- Installing fertilizer Python package" \
  && pip install fertilizer \
  && echo "----- Preparing directories" \
  && mkdir /config /data /torrents \
  && echo "----- Cleanup" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 9713

ENTRYPOINT ["./docker_start"]
