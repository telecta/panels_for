$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "panels_for/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "panels_for"
  s.version     = PanelsFor::VERSION
  s.authors     = ["Ole J. Rosendahl"]
  s.email       = ["ole.johnny.rosendahl@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PanelsFor."
  s.description = "TODO: Description of PanelsFor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
