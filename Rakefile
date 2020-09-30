require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'

CLEAN.include("**/*.gem", "**/*.rbc")

namespace :gem do
  desc 'Create the facade gem'
  task :create => [:clean] do
    require 'rubygems/package'
    spec = eval(IO.read('facade.gemspec'))
    spec.signing_key = File.join(Dir.home, '.ssh', 'gem-private_key.pem') 
    Gem::Package.build(spec)
  end

  desc 'Install the facade gem'
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install -l #{file}"
  end
end

desc "Run the test suite"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
