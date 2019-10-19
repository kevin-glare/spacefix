# Spacefix
Simple gem for validate and removing whitespace into string fields.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spacefix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spacefix

## Usage

```
class Model < ApplicationRecord
  include Spacefix
  validate_spasefix :field_one, :field_two, validate: true, squish: false, message: 'Please removing excess whitespace'
end
```

squish, validate, message - optional

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kgoryachev/spacefix.
