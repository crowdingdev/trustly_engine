$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trustly_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trustly_engine"
  s.version     = TrustlyEngine::VERSION
  s.authors     = ["Linus Lundevall"]
  s.email       = ["linus@crowding.se"]
  s.homepage    = "https://crowding.se"
  s.summary     = "Summary of TrustlyEngine."
  s.description = "Description of TrustlyEngine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
  
  s.add_dependency "rails", "~> 3.2.16"
  # s.add_dependency "jquery-rails"


  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'

end
