require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'facade'
  spec.version    = '1.1.0'
  spec.author     = 'Daniel J. Berger'
  spec.license    = 'Apache-2.0'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/facade'
  spec.summary    = 'An easy way to implement the facade pattern in your class'
  spec.test_file  = 'test/test_facade.rb'
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = ['certs/djberg96_pub.pem']

  spec.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']
  spec.add_development_dependency('rake')

  spec.metadata = {
    'homepage_uri'      => 'https://github.com/djberg96/facade',
    'bug_tracker_uri'   => 'https://github.com/djberg96/facade/issues',
    'changelog_uri'     => 'https://github.com/djberg96/facade/blob/master/CHANGES',
    'documentation_uri' => 'https://github.com/djberg96/facade/wiki',
    'source_code_uri'   => 'https://github.com/djberg96/facade',
    'wiki_uri'          => 'https://github.com/djberg96/facade/wiki'
  } 

  spec.description = <<-EOF
    The facade library allows you to mixin singleton methods from classes
    or modules as instance methods of the extending class.
  EOF
end
