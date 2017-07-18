$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "async_controls/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "async_controls"
  s.version     = AsyncControls::VERSION
  s.authors     = ["Daniel Pierce"]
  s.email       = ["dlpierce@indiana.edu"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "Apache2"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"
  s.add_dependency "hyrax", "~> 1.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "engine_cart"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "bixby"
  s.add_development_dependency "fcrepo_wrapper"
  s.add_development_dependency "solr_wrapper"
end
