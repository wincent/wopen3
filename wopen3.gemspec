require File.expand_path('lib/wopen3/version.rb', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name              = 'wopen3'
  s.version           = Wopen3::VERSION
  s.author            = 'Wincent Colaiuta'
  s.email             = 'win@wincent.com'
  s.homepage          = 'https://wincent.com/products/wopen3'
  s.platform          = Gem::Platform::RUBY
  s.summary           = 'Wopen3 is a simple replacement for Open3'
  s.description       = <<-ENDDESC
    Unlike Open3, Wopen3 does not throw away the exit code of the executed
    (grandchild) process. Only a child process is spawned and the exit
    status is returned in $? as normal.
  ENDDESC
  s.require_paths     = ['lib']
  s.rubyforge_project = 'walrus'
  s.has_rdoc          = false
  s.files             = Dir['{lib,spec}/**/*']
  s.add_development_dependency 'rspec', '>= 2.0.0.beta'
end
