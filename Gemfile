source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'pg'
gem 'thin'

# assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

group :development, :test do
  # `pry` to replace `byebug` because it includes prettier formatting and
  # same debugging options with `binding.pry` command
  gem 'pry'
  gem 'better_errors'
  gem 'rspec-rails'
  gem 'responders'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  # make tests run on change with `guard` :)
  gem 'guard-rspec'
  # syntactic sugar for simpler tests courtesy of our friendly neighbourhood
  # thoughtbot robots
  gem 'shoulda-matchers'
end
