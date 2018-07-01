# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/eloqua/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth'
  gem.add_dependency 'oauth2'
  gem.add_dependency 'omniauth-oauth2'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'

  gem.authors       = ["Waqas Ali"]
  gem.email         = ["wqsaali@gmail.com"]
  gem.description   = %q{An OmniAuth strategy for authenticating with the Eloqua REST API.}
  gem.summary       = %q{OmniAuth strategy for authenticating with Eloqua.}
  gem.homepage      = "https://github.com/wqsaali/eloqua-omniauth"
  gem.license       = "GPL v3"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-eloqua"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Eloqua::VERSION
end
