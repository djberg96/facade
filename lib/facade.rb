# frozen_string_literal: true

module Facade
  # The version of the facade library
  FACADE_VERSION = '1.2.0'

  # The facade method will forward a singleton method as an instance
  # method of the extending class. If no arguments are provided, then all
  # singleton methods of the class or module become instance methods.
  #
  # Existing instance methods are NOT overridden, but are instead ignored.
  #
  # Example:
  #
  #  require 'facade'
  #
  #  class MyString < String
  #    extend Facade
  #    facade File, :dirname, :basename
  #  end
  #
  #  s = MyString.new('/home/djberge')
  #  s.basename # => 'djberge'
  #  s.dirname  # => '/home'
  #
  def facade(klass, *methods)
    methods = methods.flatten

    if methods.empty? # Default to all methods
      methods = klass.is_a?(Class) ? klass.methods(false) : klass.public_instance_methods(false)
    end

    methods -= instance_methods.map(&:to_sym) # No clobber

    methods.each do |methname|
      define_method(methname) do
        meth = klass.is_a?(Class) ? klass.method(methname) : Object.new.extend(klass).method(methname)

        if meth.arity.zero? # Zero or one argument
          meth.call
        else
          meth.call(self)
        end
      end
    end
  end
end
