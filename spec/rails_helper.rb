ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "rspec/rails"
require "spec_helper"
require "webmock/rspec"
require "sidekiq/testing"
require "vcr"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.before do
    Sidekiq::Testing.fake!
    Sidekiq::Testing.inline!
  end
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/support/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = {
    re_record_interval: 3.days
  }
end

ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect!(allow_localhost: true)
