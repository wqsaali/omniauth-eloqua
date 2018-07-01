require 'bundler/gem_tasks'

desc "Build the gem"
task :build do
  system "gem build eloqua-omniauth.gemspec"
end

desc "Build and release the gem"
task :release => :build do
  system "gem push eloqua-omniauth-#{OmniAuth::Eloqua::VERSION}.gem"
end
