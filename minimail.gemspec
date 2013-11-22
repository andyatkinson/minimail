# -*- encoding: utf-8 -*-
require File.expand_path('../lib/minimail', __FILE__)

Gem::Specification.new do |s|
  s.name        = "minimail"
  s.version     = Minimail::VERSION
  s.authors     = ["Andy Atkinson"]
  s.email       = ["andy@webandy.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "minitest", "4.7.5"
end
