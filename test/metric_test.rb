require 'minitest/autorun'
require 'hystrix_metrics/metric'

class MetricTest < Minitest::Test

    def test_metric_instantiation
        m = HystrixMetrics::Metric.new('some_metric', -> { true })
        assert m != nil
    end

    def test_metric_execution
        m = HystrixMetrics::Metric.new('some_metric', -> { true })
        assert_equal m.execute, true
    end

end
