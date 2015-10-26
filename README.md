[travis]: https://travis-ci.org/blacktangent/panels_for
[codeclimate]: https://codeclimate.com/github/blacktangent/panels_for
[coveralls]: https://coveralls.io/r/blacktangent/panels_for
[rubygems]: https://rubygems.org/gems/panels_for

# PanelsFor

[![Build Status](https://travis-ci.org/blacktangent/panels_for.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/blacktangent/panels_for/badges/gpa.svg)][codeclimate]
[![Test Coverage](http://img.shields.io/coveralls/blacktangent/panels_for/master.svg)][coveralls]
[![Gem Version](http://img.shields.io/gem/v/panels_for.svg)][rubygems]

ActionView Helper for generating Bootstrap panels.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'panels_for'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install panels_for

## Usage

```erb
<%= panels_for @project do |b| %>
  <%= b.panel :managers, icon: 'users', id: :users do %>
    Content goes here!
  <% end %>
  <%= b.panel :graphs, icon: 'line-chart', collapse: true do %>
    Graphs here!
  <% end %>
  <%= b.panel :files, icon: 'file', collapse: true, collapsed: true %>
    Files here!
  <% end %>
<% end %>
```

## Options

* __:icon__ - Font Awesome icon to use..
* __:collapse__ - Make panel collapsable.
* __:collapsed__ - Draw panel collapsed.
* __:id__ - ID of HTML element.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blacktangent/panels_for. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

