# freeezer

fre"e"ezer is a gem which provides a `deep_freeze` method for Hash and Array object. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freeezer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freeezer

## Usage
All you need to do is just to call `using Freeezer` and you can use `deep_freeeze` method for Hash and Array object.

```ruby
using Freeezer
  
HASH_CONST = { first: 'one', second: 'two' }.deep_freeze
HASH_CONST.all?{|_key, value| value.frozen? } # => true

ARRAY_CONST = ['first', 'second', 'third'].deep_freeze
ARRAY_CONST.all?{|value| value.frozen? } # => true
```

Of course you can call `using Freeezer` inside a class.

```ruby
class TestClass
  using Freeezer
  
  HASH_CONST = { first: 'one', second: 'two' }.deep_freeze
  ARRAY_CONST = ['first', 'second', 'third'].deep_freeze
end

TestClass::HASH_CONST.all?{|_key, value| value.frozen? } # => true
TestClass::ARRAY_CONST.all?{|value| value.frozen? } # => true
```

Also, it will freeze Hash, or Array even if it is nested. Please be aware that the name is not `freezer` but `freeezer`.
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shuheiktgw/freeezer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Freeezer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freeezer/blob/master/CODE_OF_CONDUCT.md).
