# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minimail/version"

Gem::Specification.new do |s|
  s.name        = "minimail"
  s.version     = Minimail::VERSION
  s.authors     = ["Andy Atkinson"]
  s.email       = ["andy@webandy.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""

  s.rubyforge_project = "minimail"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
