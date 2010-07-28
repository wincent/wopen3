require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'
require File.expand_path('lib/wopen3/version.rb', File.dirname(__FILE__))

desc 'Run specs with coverage'
Spec::Rake::SpecTask.new('coverage') do |t|
  t.spec_files  = FileList['spec/**/*_spec.rb']
  t.rcov        = true
end

desc 'Run specs'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files  = FileList['spec/**/*_spec.rb']
end

desc 'Verify that test coverage is above minimum threshold'
RCov::VerifyTask.new(:verify => :spec) do |t|
  t.threshold   = 100.0 # never adjust expected coverage down, only up
  t.index_html  = 'coverage/index.html'
end

desc 'Generate specdocs for inclusions in RDoc'
Spec::Rake::SpecTask.new('specdoc') do |t|
  t.spec_files  = FileList['spec/**/*_spec.rb']
  t.spec_opts   = ['--format', 'rdoc']
  t.out         = 'specdoc.rd'
end

desc 'Build gem ("gem build")'
task :build do
  system 'gem build wopen3.gemspec'
end

desc 'Publish gem ("gem push")'
task :push => :build do
  system "gem push pkg/#{Wopen3::VERSION}.gem"
end
