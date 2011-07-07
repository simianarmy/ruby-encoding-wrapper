# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the ruby_encoding_wrapper plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the ruby_encoding_wrapper plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RubyEncodingWrapper'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


# build gem with jeweler's help
require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "ruby-encoding-wrapper"
  gem.description = %Q{Simple wrapper for encoding.com API based on ruby.}
  gem.email = "info@antonzaytsev.com"
  gem.homepage = "https://github.com/mikhailov/ruby-encoding-wrapper"
  gem.authors = ["Mikhailov Anatoly", "Tsech Edward", "Anton Zaytsev"]
  gem.summary = %Q{Simple wrapper for encoding.com API based on ruby.}
  gem.license = "MIT"
end
Jeweler::RubygemsDotOrgTasks.new
