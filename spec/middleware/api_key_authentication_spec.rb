require "rails_helper"

describe ApiKeyAuthentication do
  let(:middleware) { described_class.new }
  let(:env) { { request_headers: {} } }
  let(:app) { double(:app, call: nil) }

  describe "#call" do
    before do
      middleware.instance_variable_set(:@app, app)
      middleware.call(env)
    end

    it { expect(env[:request_headers]["X-Api-Key"]).to eq(ENV["CRYPTOPAY_API_KEY"]) }
  end
end
