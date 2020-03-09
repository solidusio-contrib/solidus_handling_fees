# frozen_string_literal: true

require_relative 'lib/solidus_handling_fees/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_handling_fees'
  spec.version = SolidusHandlingFees::VERSION
  spec.authors = ["McSweeney's (https://www.mcsweeneys.net)"]
  spec.email = 'admin@mcsweeneys.net'

  spec.summary = 'Adds handling fee functionality to Spree'
  spec.description = 'Adds handling fee functionality to Spree'
  spec.homepage = 'https://github.com/solidusio-contrib/solidus_handling_fees#readme'
  spec.license = 'BSD-3-Clause'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/solidusio-contrib/solidus_handling_fees/'
  spec.metadata["changelog_uri"] = 'https://github.com/solidusio-contrib/solidus_handling_fees/commits/master'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'deface'
  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 3']
  spec.add_dependency 'solidus_api'
  spec.add_dependency 'solidus_backend'
  spec.add_dependency 'solidus_support', '>= 0.4', '< 0.6'

  spec.add_development_dependency 'coffee-rails'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'sass-rails'
  spec.add_development_dependency 'solidus_dev_support'
  spec.add_development_dependency 'solidus_frontend'
end
