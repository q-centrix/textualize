# Textualize

A documentation template written in RAML and thor tasks to turn documentation
into so much more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'textualize'
```

## Usage

Textualize comes with the following generators:

### New

```bash
textualize new <folder-name>
```

The ``textualize new`` command creates sample documentation with the folder
structure needed for the other commands.

## TODO Tasks
### Server

```bash
textualize server
```

The ``textualize server`` command creates a folder structure of JSON in the
``server`` folder.

### Request Specs

```bash
textualize request_specs
```

The ``textualize request_specs`` command creates a folder of request specs
using [rack-test](https://github.com/brynary/rack-test) and
[rspec](https://github.com/rspec/rspec).

### Seeds

```bash
textualize seeeds
```

The ``textualize seeds`` command creates a file that can be used as the
``db/seeds.rb`` file in a rails app. It depends on ActiveRecord.

### Angular Factories

```bash
textualize angular_factories
```

The ``textualize angular_factories`` command creates a folder of Angular JS
factories namespaced to a ``angular_factories`` module and written in
Typescript.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git
commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/textualize/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
