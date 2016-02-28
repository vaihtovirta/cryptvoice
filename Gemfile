source "https://rubygems.org"

ruby "2.3.0"

gem "bourbon", "~> 4.2.0"
gem "coffee-rails"
gem "decent_exposure"
gem "her"
gem "interactor-rails", "~> 2.0"
gem "jquery-rails"
gem "money-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.5.1"
gem "recipient_interceptor"
gem "responders"
gem "rqrcode"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "slim-rails"
gem "uglifier"

source "https://rails-assets.tenex.tech" do
  gem "rails-assets-jquery.countdown"
  gem "rails-assets-jquery-maskmoney"
  gem "rails-assets-selectize"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman"
  gem "quiet_assets"
  gem "refills"
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
  gem "webmock"
  gem "vcr"
end

group :staging, :production do
  gem "rack-timeout"
end
