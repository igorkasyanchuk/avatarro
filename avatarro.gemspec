require_relative "lib/avatarro/version"

Gem::Specification.new do |spec|
  spec.name        = "avatarro"
  spec.version     = Avatarro::VERSION
  spec.authors     = ["Igor Kasyanchuk"]
  spec.email       = ["igorkasyanchuk@gmail.com"]
  spec.homepage    = "https://github.com/igorkasyanchuk/avatarro"
  spec.summary     = "Generate avatars (gmail-like) in your apps"
  spec.description = "Generate avatars (gmail-like) in your apps"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"
  spec.add_development_dependency "pry"
end
