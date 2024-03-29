[![Ruby](https://github.com/djberg96/facade/actions/workflows/ruby.yml/badge.svg)](https://github.com/djberg96/facade/actions/workflows/ruby.yml)

## Synopsis
An easy way to implement the facade pattern in your classes. In short,
this library wraps singleton methods from another class as instance
methods of the current class.

## Installation
`gem install facade`

## Adding the trusted cert
`gem cert --add <(curl -Ls https://raw.githubusercontent.com/djberg96/facade/main/certs/djberg96_pub.pem)`
   
## Usage
```ruby
require 'facade'

class MyString < String
  extend Facade
  facade Dir                       # extend all methods
  facade File, :dirname, :basename # extend only specified methods
end

f = MyString.new('/home/djberge')
puts f.basename # 'djberge'
puts f.dirname  # '/home'
```

## Acknowledgements
Eero Saynatkari, Eric Hodel and Michael Granger for ideas and code which I
shamelessly plagiarized.

## Copyright
Copyright (c) 2005-2023 Daniel J. Berger
   
## License
Apache-2.0

## Warranty
This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose

## Author
Daniel J. Berger
