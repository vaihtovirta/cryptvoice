require "rails_helper"

describe Invoice do
  describe "class methods" do
    it { is_expected.to define_enum_for(:status).with(%i(pending paid confirmed partpaid overpaid timeout)) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_presence_of(:currency) }
  end
end
