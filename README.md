# Observability Studies

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

## Running
- Run infra: ```docker-compose up -d```
- GET App topics: ```localhost/topicos```
- Prometheus UI: ```localhost:9090```
