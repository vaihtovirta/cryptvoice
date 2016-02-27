require "rails_helper"

describe Invoice do
  describe "class methods" do
    it { is_expected.to define_enum_for(:status).with(%i(pending paid confirmed partpaid overpaid timeout)) }
    it { is_expected.to define_enum_for(:currency).with(%i(usd eur gbp btc)) }
  end
end
