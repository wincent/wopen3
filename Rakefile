# Copyright 2007 Wincent Colaiuta
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'

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

SPEC = Gem::Specification.new do |s|
  s.name          = 'wopen3'
  s.version       = '0.1'
  s.author        = 'Wincent Colaiuta'
  s.email         = 'win@wincent.com'
  s.homepage      = 'http://wincent.com/a/products/walrus/wopen3/'
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'Wopen3 is a simple replacement for Open3.'
  s.description   = <<-ENDDESC
    Unlike Open3, Wopen3 does not throw away the exit code of the executed
    (grandchild) process. Only a child process is spawned and the exit 
    status is returned in $? as normal.
  ENDDESC
  s.require_paths = ['lib']
  s.autorequire   = 'wopen3'
  s.has_rdoc      = false
  s.files         = FileList['{lib,spec}/**/*'].to_a
end

Rake::GemPackageTask.new(SPEC) do |t|
  t.need_tar      = true
end
