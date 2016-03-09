require "rails_helper"

describe Invoice do
  describe "class methods" do
    it { is_expected.to define_enum_for(:status).with(%i(pending paid confirmed partpaid overpaid timeout)) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_presence_of(:currency) }
  end

  describe "StatusAASM" do
    let(:subject) { described_class.new }

    it { is_expected.to have_state(:pending) }
    it { is_expected.to transition_from(:pending).to(:paid).on_event(:pay) }
    it { is_expected.to transition_from(*%i(pending partpaid)).to(:overpaid).on_event(:overpay) }
    it { is_expected.to transition_from(:pending).to(:partpaid).on_event(:partpay) }
    it { is_expected.to transition_from(:paid).to(:confirmed).on_event(:confirm) }
    it { is_expected.to transition_from(*%i(pending paid partpaid overpaid)).to(:timeout).on_event(:expire) }
    it { is_expected.to transition_from(:timeout).to(:pending).on_event(:requote) }
  end
end
