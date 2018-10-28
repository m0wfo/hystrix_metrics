# Hystrix Metrics

Capture [hystrix metrics](https://medium.com/netflix-techblog/hystrix-dashboard-turbine-stream-aggregator-60985a2e51df) from your Ruby apps

## Usage

`gem install hystrix_metrics`

Record some metrics:

```
require 'hystrix_metrics/metric'

# the lambda represents the work wrapped in a Hystrix command
m = HystrixMetrics::Metric.new("api_call-#{i}", -> { true })
# Invoke the lambda inside a Hystrix command
m.execute
```

Spin up a metric server:

```
require 'hystrix_metrics/metric_server'

server = HystrixMetrics::MetricServer.new(9999, "/metrics")
server.start
```

You can watch the metric event stream by firing a `curl` at `localhost:9999/metrics`.
