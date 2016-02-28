require "rails_helper"

describe ProcessInvoice do
  let(:params) { attributes_for(:invoice).slice(:custom_id, :price_cents, :currency) }
  let(:interactor_call) { described_class.call(params: params) }

  describe "#call", vcr: { cassette_name: "cryptopay_api/post_invoices" } do
    it { expect(interactor_call).to be_a_success }
  end
end
