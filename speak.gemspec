# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "speak/version"

Gem::Specification.new do |s|
  s.name        = "speak"
  s.version     = Speak::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Enrico Pilotto"]
  s.email       = ["enrico@megiston.it"]
  s.homepage    = "http://github.com/pioz/speak"
  s.summary     = %q{Text 2 speech}
  s.description = %q{Text 2 speech using Google Translate service.}
  s.executables = ["speak"]
  s.rubyforge_project = "speak"

  s.add_dependency('pkg-config', '>= 1.1.1')
  s.add_dependency('glib2', '>= 0.90.8')
  s.add_dependency('gstreamer', '>= 0.90.8')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

