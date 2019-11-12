Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = 'spree_handling_fees'
  s.version     = '2.4.0'
  s.authors    = ["McSweeney's"]
  s.email     = 'admin@mcsweeneys.net'
  s.homepage  = 'https://www.mcsweeneys.net'
  s.summary     = 'Adds handling fee functionality to Spree'
  s.description = 'Adds handling fee functionality to Spree'

  s.required_ruby_version = '>= 2.2.2'

  solidus_version =  ['>= 2.0', '< 3']
  s.add_dependency 'solidus_api', solidus_version
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'deface'

  s.add_development_dependency 'solidus_frontend'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'solidus_extension_dev_tools'
end
