Gem::Specification.new do |s|
  s.name = "jruby-rack-metrics-msp"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Dudziak", "Nick Griffiths"]
  s.date = "2015-04-15"
  s.description = "A simple rack app wrapper that gathers request metrics using Coda Hale's metrics library - MSP fork"
  s.email = "nicobrevin@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "jruby-rack-metrics-msp.gemspec",
    "lib/jruby-rack-metrics.rb",
    "lib/metrics-annotation.jar",
    "lib/metrics-core.jar",
    "lib/slf4j-api.jar"
  ]
  s.homepage = "http://github.com/nicobrevin/jruby-rack-metrics"
  s.licenses = ["ASL 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23.2"
  s.summary = "Metrics for jruby rack apps"

  s.add_development_dependency(%q<shoulda>, [">= 0"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0"])
  s.add_development_dependency(%q<rcov>, ["~> 0.9"])
  s.add_runtime_dependency(%q<rack>, ["~> 1.1"])
end

