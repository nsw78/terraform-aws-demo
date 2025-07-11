#!/bin/bash

# Atualiza pacotes e instala dependências
apt-get update
apt-get install -y apt-transport-https software-properties-common wget

# Definindo versão fixa do Prometheus
PROM_VERSION="2.47.0"

# Instalando Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz
tar xvfz prometheus-${PROM_VERSION}.linux-amd64.tar.gz
cp prometheus-${PROM_VERSION}.linux-amd64/prometheus /usr/local/bin/
cp prometheus-${PROM_VERSION}.linux-amd64/promtool /usr/local/bin/
mkdir -p /etc/prometheus
cp -r prometheus-${PROM_VERSION}.linux-amd64/consoles /etc/prometheus
cp -r prometheus-${PROM_VERSION}.linux-amd64/console_libraries /etc/prometheus

# Aqui você pode configurar o prometheus.yml via script ou template se necessário

# Instalando Grafana
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
apt-get update
apt-get install -y grafana

# Resetando senha do admin do Grafana
grafana-cli admin reset-admin-password ${grafana_admin_password}

# Iniciando serviços
systemctl enable grafana-server
systemctl start grafana-server

# (Opcional) Rodar Prometheus como serviço em produção — você pode criar um systemd unit depois
