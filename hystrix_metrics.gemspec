Gem::Specification.new do |s|
    s.name = 'hystrix_metrics'
    s.version = '0.0.1'
    s.author = 'Chris Mowforth'
    s.email = 'chris@mowforth.com'
    s.license = 'Apache-2.0'
    s.homepage = 'https://github.com/m0wfo/hystrix_metrics'
    s.summary = 'Easily capture & expose Hystrix metrics in JRuby'
    s.platform = 'java'

    s.files = Dir.glob('lib/**/*') + ['hystrix_metrics.gemspec']

    s.add_runtime_dependency 'jar-dependencies', '~> 0.3.0'

    s.requirements << 'jar com.netflix.hystrix:hystrix-core, 1.4.10'
    s.requirements << 'jar com.netflix.hystrix:hystrix-metrics-event-stream, 1.4.10'
    s.requirements << 'jar io.undertow:undertow-servlet, 2.0.14.Final'

end
