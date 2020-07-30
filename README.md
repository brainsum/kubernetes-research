# K8S Demo

Demo app for testing Drupal deployment on K8s.
This project has been based on the <https://github.com/brainsum/damo-project> repo. This is due to it being an in-house project, but it's also quiet complex.

## Roadmap

- Create a composer project using the <https://github.com/wunderio/drupal-project> project (or rather) forking <https://github.com/drupal/recommended-project> and setting it up for K8s-native mode. 
- Supporting helm charts would be a plus, too.

## Setup
### Grafana

- Use the kubernetes/tunnel-grafana.sh and navigate to <http://localhost:3000>
    - Or grafana.kubernetes-research.docker.localhost:8000 when using it locally with docker-compose
- Add a new data source for Loki
- Add a new dashboard for logs with loki as the source 
