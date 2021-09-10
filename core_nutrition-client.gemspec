# frozen_string_literal: true

require_relative "lib/core_nutrition/client/version"

Gem::Specification.new do |spec|
  spec.name          = "core_nutrition-client"
  spec.version       = CoreNutrition::Client::VERSION
  spec.authors       = ["Nate Klaiber"]
  spec.email         = ["nate@deviceindependent.com"]

  spec.summary       = "Client for the CORE Nutrition API"
  spec.description   = "Client for the CORE Nutrition API"
  spec.homepage      = "https://github.com/nateklaiber/core-nutrition-client-ruby.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nateklaiber/core-nutrition-client-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/nateklaiber/core-nutrition-client-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("bundler", ">= 2.2.10")
  spec.add_development_dependency("rake", ">= 12.3.3")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("yard")
  spec.add_development_dependency("webmock")

  spec.add_dependency('jwt')
  spec.add_dependency('ruby-units')
  spec.add_dependency('timezone')
  spec.add_dependency('faraday')
  spec.add_dependency('mimemagic')
  spec.add_dependency('mime-types')
  spec.add_dependency('faraday_middleware')
  spec.add_dependency('multi_json')
  spec.add_dependency('dotenv')
  spec.add_dependency('addressable')
  spec.add_dependency('restless_router')
  spec.add_dependency("terminal-table")
end
