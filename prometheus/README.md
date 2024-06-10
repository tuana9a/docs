# prometheus

# docker-compose

prepare bind mounts

```bash
mkdir -p data/grafana
mkdir -p data/prometheus
sudo chown 472:0 data/grafana
sudo chown 65534:65534 data/prometheus
```

# send test alert

```bash
curl -H 'Content-Type: application/json' -d '[{"labels":{"alertname":"test"}}]' http://127.0.0.1:9093/api/v1/alerts
```
