# Copilot Instructions for Facade

## Project Overview
Facade is a small, focused Ruby gem (~50 LOC) that implements the Facade design pattern by converting singleton/class methods into instance methods. The entire implementation lives in `lib/facade.rb` as a single module.

## Architecture
- **Single module pattern**: All functionality in `Facade` module via `facade()` method
- **Metaprogramming approach**: Uses `define_method` to dynamically create instance methods that wrap singleton methods
- **No-clobber design**: Existing instance methods are never overridden (see line 33: `methods -= instance_methods.map(&:to_sym)`)
- **Arity-aware forwarding**: Zero-arity methods call without args, others pass `self` (lines 38-43)

## Key Implementation Details

### The `facade()` Method
- **Default behavior**: If no methods specified, extends ALL singleton methods from the target class/module
- **Module vs Class handling**: Uses different reflection for classes (`klass.methods(false)`) vs modules (`public_instance_methods(false)`)
- **Module forwarding trick**: For modules, creates a temporary object with `Object.new.extend(klass)` to access methods

### Testing Patterns (spec/facade_spec.rb)
- Uses RSpec 3.9+
- Tests define anonymous classes inline using `Class.new` blocks
- Key test scenarios:
  - Partial method extension: `facade File, :basename, :dirname`
  - Full method extension: `facade Dir` (all Dir methods)
  - Module method extension: `facade FooModule`
  - No-clobber verification: predefined methods not overwritten

## Development Workflow

### Running Tests
```bash
rake spec          # Run specs (default task)
bundle exec rake   # CI uses this
```

### Building/Installing Gem
```bash
rake gem:create    # Build signed gem (requires signing key at ~/.ssh/gem-private_key.pem)
rake gem:install   # Build + install locally
```

### CI/CD
- Tests run on Ruby 2.7-3.4, JRuby, TruffleRuby
- All platforms: Ubuntu, macOS, Windows (except JRuby/TruffleRuby skip Windows)
- Triggered on push/PR to main, ignoring markdown changes

## Project Conventions
- **Frozen literals**: All files use `# frozen_string_literal: true`
- **Version location**: Single source of truth in `lib/facade.rb` as `FACADE_VERSION` constant
- **Documentation**: Inline examples in code > separate docs
- **Gemspec**: Signed gems with cert chain in `certs/` directory
- **Test naming**: Spec descriptions use "example" not "it"

## Critical Constraints
- Must support Ruby 2.7+ (legacy compatibility)
- Cannot break existing instance methods (no-clobber is core feature)
- Zero dependencies (stdlib only)
- Must handle both Class and Module targets differently
