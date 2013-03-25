# Nerv - Environment Variables for Humans. Ruby Edition!

[![Build Status](https://travis-ci.org/kavu/nerv.png)](https://travis-ci.org/kavu/nerv)

Nerv is a tiny gem, inspired by [@kennethreitz](https://raw.github.com/kennethreitz/)'s [env](https://raw.github.com/kennethreitz/env/). So, it provides a mapping interface for Environment Variables, too.

## Installation

Add this line to your application's Gemfile:

    gem 'nerv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nerv

## Usage

Let's assume that we have `ENV` like this:

```ruby
ENV = {
  'RUBY_FREE_MIN' => 0,
  'RUBY_GC_MALLOC_LIMIT' => 0,
  'RBENV_SOME' => 0,
  'ZSH-HOME' => 0
}
```

```ruby
ruby_env = Nerv.prefix('RUBY')
# ruby_env == { 'FREE_MIN' => 0, 'GC_MALLOC_LIMIT' => 0 }
```

`Nerv.prefix` has the second optional argument — a separator for ENV 'namespaces':

```ruby
ruby_env = Nerv.prefix('ZSH', '-')
# ruby_env == { 'HOME' => 0 }
```

Also, there is a shorthand for `Nerv.prefix` with default separator:

```ruby
ruby_env = Nerv['RUBY']
# ruby_env == { 'FREE_MIN' => 0, 'GC_MALLOC_LIMIT' => 0 }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 Max Riveiro. See LICENSE.txt for further details.
