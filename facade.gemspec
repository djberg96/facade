require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'facade'
  spec.version    = '1.2.1'
  spec.author     = 'Daniel J. Berger'
  spec.license    = 'Apache-2.0'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/facade'
  spec.summary    = 'An easy way to implement the facade pattern in your class'
  spec.test_file  = 'spec/facade_spec.rb'
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = ['certs/djberg96_pub.pem']

  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec', '~> 3.9')

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/djberg96/facade',
    'bug_tracker_uri'       => 'https://github.com/djberg96/facade/issues',
    'changelog_uri'         => 'https://github.com/djberg96/facade/blob/main/CHANGES.md',
    'documentation_uri'     => 'https://github.com/djberg96/facade/wiki',
    'source_code_uri'       => 'https://github.com/djberg96/facade',
    'wiki_uri'              => 'https://github.com/djberg96/facade/wiki',
    'rubygems_mfa_required' => 'true'
  } 

  spec.description = <<-EOF
    The facade library allows you to mixin singleton methods from classes
    or modules as instance methods of the extending class.
  EOF
end
