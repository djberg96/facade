## Synopsis
An easy way to implement the facade pattern in your classes. In short,
this library wraps singleton methods from another class as instance
methods of the current class.

## Installation
`gem install facade`
   
## Usage
```
require 'facade'

class MyString < String
  extend Facade
  facade File, :dirname, :basename
end

f = MyString.new('/home/djberge')
puts f.basename # 'djberge'
puts f.dirname  # '/home'
```

## Acknowledgements
Eero Saynatkari, Eric Hodel and Michael Granger for ideas and code which I
shamelessly plagiarized.

## Copyright
Copyright (c) 2005-2020 Daniel J. Berger
   
## License
Apache-2.0

## Warranty
This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose

## Author
Daniel J. Berger
