# -*- encoding: utf-8 -*-
require File.expand_path("../lib/minitest/rails/shoulda/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "minitest-rails-shoulda"
  s.version     = MiniTest::Rails::Shoulda::VERSION
  s.authors     = ["Robert Bousquet", "Rafal Wrzochol"]
  s.email       = ["robert@robertbousquet.com", "rafal@wrzochol.net"]
  s.homepage    = ""
  s.summary     = %q{Making shoulda-matchers available for minitest-rails}
  s.description = %q{Making shoulda-matchers available for minitest-rails}

  s.rubyforge_project = "minitest-rails-shoulda"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "minitest-rails",    "~> 0.9.2"
  s.add_runtime_dependency "minitest-matchers", "~> 1.2.0"
  s.add_runtime_dependency "shoulda-matchers",  "~> 2.0.0"
end
