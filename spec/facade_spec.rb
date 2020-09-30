########################################################################
# facade_spec.rb
#
# Specs for the Facade module. This test suite should be run via the
# the 'rake spec' task.
########################################################################
require 'rspec'
require 'facade'

module Baz
  def testme(str)
    str
  end
end

class FooString < String
  extend Facade
  facade File, :basename, 'dirname'
  facade Dir
  facade Baz

  def blockdev?
    'test'
  end
end

RSpec.describe Facade do
  before do
    @str = FooString.new('/home/djberge')
  end

  example "facade_version" do
    expect(Facade::FACADE_VERSION).to eq('1.2.0')
    expect(Facade::FACADE_VERSION).to be_frozen
  end

=begin
  example "file_methods" do
    expect(@str).to respond_to(:basename)
    expect(@str).to respond_to(:dirname)
    expect{ @str.executable? }.to raise_error(NoMethodError)
    expect{ @str.chardev? }.to raise_error(NoMethodError)
  end

  example "file_method_return_values" do
    expect( @str.basename).to eq('djberge')
    expect( @str.dirname).to eq('/home')
  end

  example "dir_methods" do
    expect(@str).to respond_to(:pwd)
    expect(@str).to respond_to(:entries)
  end

  example "no_clobber" do
    expect(@str).to respond_to(:blockdev?)
    expect( @str.blockdev?).to eq('test')
  end

  example "module_methods" do
    expect(@str).to respond_to(:testme)
    expect( @str.testme).to eq('/home/djberge')
  end
=end
end
