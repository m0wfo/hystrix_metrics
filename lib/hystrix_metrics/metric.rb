require 'hystrix_metrics_jars'

module HystrixMetrics
    import com.netflix.hystrix.HystrixCommand
    import com.netflix.hystrix.HystrixCommandKey
    import com.netflix.hystrix.HystrixCommandGroupKey

    class Metric < HystrixCommand

        attr_reader :command

        def initialize(name, work, group="Default")
            @work = work
            super(HystrixCommand::Setter
                .withGroupKey(HystrixCommandGroupKey::Factory.asKey(group))
                .andCommandKey(HystrixCommandKey::Factory.asKey(name)))
        end

        def run
            @work.call
        end
    end

end