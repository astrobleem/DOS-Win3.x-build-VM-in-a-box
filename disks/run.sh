#!/usr/bin/env bash
set -euo pipefail
docker build -t tandy-build .
docker run --rm \
  -p 5901:5901 \
  -v "$(pwd)/shared:/app/shared" \
  tandy-build
# connect your VNC client to localhost:5901 to watch the build if needed
