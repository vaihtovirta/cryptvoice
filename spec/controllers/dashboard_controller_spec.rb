require "rails_helper"

describe DashboardController do
  describe "#index" do
    subject { get :index }

    it { is_expected.to render_template(:index) }
  end
end
