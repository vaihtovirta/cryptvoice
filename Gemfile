source "https://rubygems.org"

ruby "2.3.0"

gem "bulma-rails", "~> 0.0.14"
gem "coffee-rails"
gem "decent_exposure"
gem "her"
gem "interactor-rails", "~> 2.0"
gem "jquery-rails"
gem "money-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.5.2"
gem "recipient_interceptor"
gem "responders"
gem "rqrcode"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "slim-rails"
gem "uglifier"
gem "sidekiq"
gem "sidetiq"

source "https://rails-assets.tenex.tech" do
  gem "rails-assets-jquery-maskmoney"
  gem "rails-assets-jquery.countdown"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman"
  gem "quiet_assets"
  gem "rubocop-rspec", require: false
  gem "rubocop", require: false
  gem "slim_lint", require: false
  gem "spring-commands-rspec"
  gem "spring"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "vcr"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_12factor"
end
