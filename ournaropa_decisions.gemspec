$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ournaropa_decisions/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ournaropa_decisions"
  s.version     = OurnaropaDecisions::VERSION
  s.authors     = ["Finn Woelm"]
  s.email       = ["finn.woelm@gmail.com"]
  s.homepage    = "http://www.thecushion.org/democracy"
  s.summary     = "A mountable engine for community-based direct democracy."
  s.description = "A mountable engine for community-based direct democracy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"  
  
  # Use postgres for development
  s.add_development_dependency "pg"
  
  # Testing with RSpec
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'  
  
  s.add_dependency 'jquery-rails'
  s.add_dependency 'turbolinks'
  s.add_dependency 'jquery-turbolinks'

  s.add_dependency 'sass-rails'
  s.add_dependency 'materialize-sass'
  s.add_dependency 'material_icons'
  
  s.test_files = Dir["spec/**/*"]
end
