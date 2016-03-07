require "codeclimate-test-reporter"

if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails" do
    add_filter ".bundle"
    add_filter "app/controllers/admin"
    add_filter "app/fields"
    add_filter "app/dashboards"
  end
end

CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random
end
