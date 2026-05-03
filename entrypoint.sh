#!/bin/sh

# Dynamic port fix
sed -i "s/8080/${PORT}/g" /etc/xray/config.json

echo "Running on port: $PORT"

# Start Xray
xray run -c /etc/xray/config.json &
XRAY_PID=$!

# Health server (Cloud Run needs this)
python3 -m http.server ${PORT} --bind 0.0.0.0 >/dev/null 2>&1 &
HTTP_PID=$!

wait -n