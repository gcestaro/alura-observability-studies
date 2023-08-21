# Observability Studies

## Requisites:
- Docker
- docker-compose

## Running
- Run infra: ```docker-compose up -d```
  - Check container status: ```docker ps -a```
  - Check app logs: ```docker logs -f --details app-forum-api```
- GET App topics: ```localhost/topicos```
- Prometheus UI: ```localhost:9090```
- Metrics: ```localhost/metrics```

## Pillars
- Metrics
- Distributed tracing
- Logs

## Some Tools
- Metrics:
  - Prometheus (Metrics DB)
  - Grafana (Front-end)
- Distributed tracing
  - Jaeger
  - Service Mesh (Istio)
  - Proxy (Envoy, Traefik, Kong)
- Log
  - stdout -> File
  - Sidecar
  - Logging agent installed at host
  - Shell script

More tools
- ELK
- Graylog
- Datadog
- Splunk
- Dynatract
- New Relic

## Observability
Consists of tracking the execution state of a system by externalizing its behavior at runtime.

## Monitoring
Consists of tracking the state of a system through recorded events and executing actions in response to these events.

- Proactive response: trigger alerts from metrics
- Reactive response: manually check for issues or wait for your customer report an error.

## Metrics
Service level indicator (SLI*) collected within a time series. Metrics are used to measure performance, availability, saturation, errors and any useful information for the business. A metric has a specific objective, for each point of attention in a system, there must be a corresponding metric.

*[SLA vs SLO vs SLI](https://www.atlassian.com/incident-management/kpis/sla-vs-slo-vs-sli)

## Mac OS - M1 users
- Set default platform linux/amd64: ```export DOCKER_DEFAULT_PLATFORM=linux/amd64```

## Prometheus
- [Metric types](https://prometheus.io/docs/concepts/metric_types/):
  - Counter: ascending cumulative counter. Resets when app restarts.
  - Gauge: numerical values that usually vary (increment, decrement).
  - [Histogram](https://prometheus.io/docs/practices/histograms/):
    - cumulative counters for buckets
    - total sum
    - count of observed events
  - Summary: similar to histogram, normally used for things like request duration and response sizes.
    - streaming fi-quantiles
    - total sum
    - count

- [Sample queries](https://prometheus.io/docs/prometheus/latest/querying/basics/):
  - Stand vector: ```logback_events_total{application="app-forum-api", instance="app-forum-api:8080", job="app-forum-api", level="info"}```
  - Range vector: ```logback_events_total[5m:30s]```
  - Scalar (can see graphs): ```hikaricp_connections_idle``` 
  - Count success auth: ```auth_user_success_total```
  - Success http requests with response time less than 50ms to "/topicos/{id}": ```http_server_requests_seconds_bucket{status="200", uri="/topicos/{id}", le="0.05"}```
  - ```http_server_requests_seconds_count{application="app-forum-api", method=~"GET|POST", status=~"2..|3..", uri!~"/actuator/prometheus|/actuator/health"}```
  - ```sum(increase(http_server_requests_seconds_count{application="app-forum-api", uri!~"/actuator/prometheus|/actuator/health"} [1m]))```
  - ```irate(http_server_requests_seconds_count{application="app-forum-api", uri!~"/actuator/prometheus|/actuator/health"} [5m])```
