########################################################################
# facade_spec.rb
#
# Specs for the Facade module. This test suite should be run via the
# the 'rake spec' task.
########################################################################
require 'rspec'
require 'facade'

RSpec.describe Facade do
  let(:facade) do
    module FooModule
      def testme(str); str; end
    end

    Class.new(String) do |klass|
      klass.extend Facade
      facade File, :basename, 'dirname'
      facade Dir
      facade FooModule

      def blockdev?
        'test'
      end
    end
  end

  let(:string) { facade.new('/home/whatever') }

  example "facade module has expected version set and it's frozen" do
    expect(Facade::FACADE_VERSION).to eq('1.2.0')
    expect(Facade::FACADE_VERSION).to be_frozen
  end

  example "facade instance responds only to specified singleton methods" do
    expect(string).to respond_to(:basename)
    expect(string).to respond_to(:dirname)
    expect{ string.executable? }.to raise_error(NoMethodError)
    expect{ string.chardev? }.to raise_error(NoMethodError)
  end

  example "File singleton methods are implemented as instance methods and return the expected value" do
    expect(string.basename).to eq('whatever')
    expect(string.dirname).to eq('/home')
  end

  example "all Dir singleton methods are implemented as instance methods" do
    expect(string).to respond_to(:pwd)
    expect(string).to respond_to(:entries)
  end

  example "facade does not clobber predefined methods" do
    expect(string).to respond_to(:blockdev?)
    expect(string.blockdev?).to eq('test')
  end

  example "module_methods" do
    expect(string).to respond_to(:testme)
    expect(string.testme).to eq('/home/whatever')
  end
end
