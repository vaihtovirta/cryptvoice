require File.expand_path("../boot", __FILE__)
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
Bundler.require(*Rails.groups)
module Cryptvoice
  class Application < Rails::Application
    config.quiet_assets = true
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = ENV["TIMEZONE"] || "UTC"
  end
end
