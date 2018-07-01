require 'bundler/gem_tasks'

desc "Build the gem"
task :build do
  system "gem build omniauth-eloqua.gemspec"
end

desc "Build and release the gem"
task :release => :build do
  system "gem push omniauth-eloqua-#{OmniAuth::Eloqua::VERSION}.gem"
end
