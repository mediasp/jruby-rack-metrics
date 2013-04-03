require 'rubygems'
require 'uri'
require 'java'
require 'rack'

java_import 'java.lang.System'
java_import 'java.util.concurrent.TimeUnit'
java_import 'com.yammer.metrics.Metrics'
java_import 'com.yammer.metrics.core.MetricName'
java_import 'com.yammer.metrics.reporting.JmxReporter'

module JrubyRackMetrics
  class Monitor
    attr_reader :options

    def self.start_default_jmx_reporter(metrics_registry=default_metrics_registry)
      JmxReporter.startDefault(metrics_registry)
    end

    def self.default_metrics_registry
      Metrics.defaultRegistry
    end

    def initialize(app, opts = {})
      @app = app
      @options = default_options.merge(opts)
      @timing_unit = TimeUnit::NANOSECONDS
    end

    def default_options
      { :default_duration_unit => TimeUnit::MILLISECONDS,
        :default_rate_unit => TimeUnit::SECONDS,
        :metrics_registry => self.class.default_metrics_registry }
    end

    def metrics_registry
      @options[:metrics_registry]
    end

    def call(env = nil)
      if env.nil?
        @app.call(env)
      else
        start_time = System.nanoTime()
        begin
          status, headers, body = @app.call(env)
        ensure
          elapsed = System.nanoTime() - start_time
          # some web servers give us the full url, some only the path part
          uri = URI.parse(env['REQUEST_URI'])
          if defined? uri.path && !uri.path.nil?
            if uri.path == "/"
              group = "_root"
            else
              group = uri.path.gsub(/[\/|\s|,|;|#|!|:]/, "_")
              group = group[1..-1] if group.start_with?("_")
            end
            type = env['REQUEST_METHOD'].downcase
            name = (status || 500).to_s
            metric_name = MetricName.new(group, type, name)
            metrics_registry.newTimer(metric_name,
                                      @options[:default_duration_unit],
                                      @options[:default_rate_unit]).update(elapsed, @timing_unit)
          end
        end
      end
    end
  end
end

