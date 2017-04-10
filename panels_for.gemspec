$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "panels_for/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "panels_for"
  s.version     = PanelsFor::VERSION
  s.authors     = ["Ole J. Rosendahl"]
  s.email       = ["ole.johnny.rosendahl@gmail.com"]
  s.homepage    = "https://github.com/blacktangent/panels_for"
  s.summary     = "ActionView Helper for generating Bootstrap panels."
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = '>= 2.0'

  s.add_dependency "rails", ">= 3.2", "< 5.0"
  s.add_dependency 'font-awesome-rails', '~> 4.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "coveralls"
end
