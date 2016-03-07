module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    private

    def authenticate_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
      end
    end
  end
end
