# encoding: utf-8

require 'rubygems'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "jruby-rack-metrics-msp"
  gem.homepage = "http://github.com/nicobrevin/jruby-rack-metrics"
  gem.license = "ASL 2.0"
  gem.summary = %Q{Metrics for jruby rack apps}
  gem.description = %Q{A simple rack app wrapper that gathers request metrics using Coda Hale's metrics library - MSP fork}
  gem.email = "nicobrevin@gmail.com"
  gem.authors = ["Thomas Dudziak", "Nick Griffiths"]
  gem.add_runtime_dependency 'rack', '~> 1.1'
  gem.add_development_dependency "shoulda", ">= 0"
  gem.add_development_dependency "bundler", "~> 1.0.0"
  gem.add_development_dependency "jeweler", "~> 1.6.4"
  gem.add_development_dependency "rcov", "~> 0.9.11"
end
Jeweler::RubygemsDotOrgTasks.new

task :default => :build

