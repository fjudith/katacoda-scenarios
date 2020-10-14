# Step 1 - Explore Kiali

## Introduction

Kiali is a management console for **Istio-based** service mesh.
It provides dashboards, observability and lets you to operate your mesh with robust configuration and validation capabilities.
It shows the structure of your service mesh by inferring traffic topology and displays the health of your mesh.

> Notice that Kiali relies on following backends:
> * **Monitoring**: [Prometheus](https://prometheus.io) who leverage the [OpenMetrics](https://openmetrics.io) standard format
> * **Monitoring**: [Grafana](https://grafana.com) for metrics visualisation
> * **Tracing**: [Jaeger](https://jaegertracing.io) who leverage the [OpenTracing](https://opentracing.io) standard format

## Navigating

* Select the **Kiali** tab.
* In the left panel, select the **Graph** tab.
* Click on the **Select a namespace** drop-list, then select `default`.

At this point not much is happening because we did in the UI because we did not generated trafic on the application.

* Refresh the **Bookinfo** tab 10-20 times.

After approximatly _15 seconds_ the graph will progressively display the application microservices dependencies.

## Generate load

* Select the **Terminal** tab, then run the load generator

```bash
docker container run --rm  -p 8089:8089 --name 'loadgenerator' cncfexercices/bookinfo-load-test  -d 5 -h http://$(hostname) -u 250 -r 60
```{{ exectute }}