# Rails Wipe

A rake task for Rails to truncate your database without having to drop it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_wipe"
```

## Usage

You'll have two additional rake tasks, `rake -T`:

```
…
rake db:wipe                            # Truncate the database (from rails_wipe gem)
rake db:wipe:environment                # An overridable environment for rails_wipe gem
…
```

**Warning:** this will wipe your database, be careful! By default `db:wipe:environment` will
abort in production.

### Overriding environment check

Sometimes you want to wipe in production, e.g. if you run staging on the production environment. While
scary, it is possible to override the environment check by putting the following code in your Rakefile:

```ruby
Rake::Task["db:wipe:environment"].clear

task "db:wipe:environment" => [:environment] do
  # Replace the below code with whatever madness you prefer.
  abort "[ERROR] Cannot wipe #{Rails.env} environment." if Rails.env.production?
end
```

## Contributing

After checking out the repo, run `bin/setup` to install dependencies.

Bug reports and pull requests are welcome on GitHub at <https://github.com/Burgestrand/rails_wipe>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
