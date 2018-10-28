require 'minitest/autorun'
require 'hystrix_metrics/metric_server'
require 'hystrix_metrics/metric'

class MetricServerTest < Minitest::Test

    def test_server_starts_and_stops
        server = HystrixMetrics::MetricServer.new(0, "/metrics")
        server.start
        server.stop
    end

end
