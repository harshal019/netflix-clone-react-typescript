#!/bin/bash
set -e

PROM_VERSION="2.47.1"

echo "Creating Prometheus user..."
sudo useradd --system --no-create-home --shell /bin/false prometheus || true

echo "Downloading Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz

tar -xvf prometheus-${PROM_VERSION}.linux-amd64.tar.gz
cd prometheus-${PROM_VERSION}.linux-amd64

echo "Installing Prometheus binaries..."
sudo mv prometheus promtool /usr/local/bin/
sudo mkdir -p /etc/prometheus /data
sudo mv consoles console_libraries /etc/prometheus/

sudo chown -R prometheus:prometheus /etc/prometheus /data

cd ..
rm -rf prometheus*

echo "Creating Prometheus systemd service..."
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target
[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/data \
  --web.listen-address=0.0.0.0:9090 \
  --web.enable-lifecycle

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

echo "Prometheus installed successfully"
