$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "validators/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "validators"
  s.version     = Validators::VERSION
  s.authors     = ["Yashchuk Oleg"]
  s.email       = ["oazoer@gmail.com"]
  s.summary     = "Custom validators for rails"
  s.description = "Custom validators for rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "activemodel"
  s.add_runtime_dependency "carrierwave"
end
