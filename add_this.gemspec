# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "add_this/version"

Gem::Specification.new do |s|
  s.name        = "add_this"
  s.version     = AddThis::VERSION
  s.authors     = ["Christopher Hein", "Ryan Van Niekerk", "Nick Hodulik"]
  s.email       = ["chris@generalthings.com", "rvanniekerk@generalthings.com", "nick@generalthings.com"]
  s.homepage    = ""
  s.summary     = %q{Simple API connector for getting analytic data from AddThis}
  s.description = %q{Simple API connector for getting analytic data from AddThis}

  s.rubyforge_project = "add_this"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "typhoeus"
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  # s.add_runtime_dependency "rest-client"
end
