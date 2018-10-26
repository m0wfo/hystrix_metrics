require 'hystrix_metrics_jars'

module HystrixMetrics

    class MetricServer
        import com.netflix.hystrix.contrib.metrics.eventstream.HystrixMetricsStreamServlet
        import 'io.undertow.Handlers'
        import 'io.undertow.Undertow'
        import 'io.undertow.servlet.Servlets'

        attr_reader :server

        def initialize(port, path="/metrics")
            servlet = Servlets.servlet("EventStream", HystrixMetricsStreamServlet.java_class).addMapping('/*')
            classloader = java.lang.ClassLoader.getSystemClassLoader
            builder = Servlets.deployment
            .setDeploymentName("HystrixMetricServer")
            .setClassLoader(classloader)
            .setContextPath(path)
            .addServlets(servlet)
            manager = Servlets.defaultContainer.addDeployment(builder)
            manager.deploy
            path = Handlers.path(Handlers.redirect(path)).addPrefixPath(path, manager.start)

            @server = Undertow.builder
            .addHttpListener(port, "0.0.0.0")
            .setHandler(path)
            .build
        end

        def start
            @server.start
        end

        def stop
            @server.stop
        end
    end

end