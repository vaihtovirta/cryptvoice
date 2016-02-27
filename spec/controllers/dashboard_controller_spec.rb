require "rails_helper"

describe DashboardController do
  render_views

  describe "#GET index" do
    before { get :index }

    it { is_expected.to render_template(:index) }
  end
end
