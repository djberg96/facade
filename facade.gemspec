require 'rubygems'

Gem::Specification.new do |spec|
  spec.name      = 'facade'
  spec.version   = '1.0.5'
  spec.author    = 'Daniel J. Berger'
  spec.license   = 'Artistic 2.0'
  spec.email     = 'djberg96@gmail.com'
  spec.homepage  = 'http://www.rubyforge.org/projects/shards'
  spec.platform  = Gem::Platform::RUBY
  spec.summary   = 'An easy way to implement the facade pattern in your class'
  spec.test_file = 'test/test_facade.rb'
  spec.has_rdoc  = true
  spec.files     = Dir['**/*'].reject{ |f| f.include?('git') }

  spec.rubyforge_project = 'shards'
  spec.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  spec.description = <<-EOF
    The facade library allows you to mixin singleton methods from classes
    or modules as instance methods of the extending class.
  EOF
end
