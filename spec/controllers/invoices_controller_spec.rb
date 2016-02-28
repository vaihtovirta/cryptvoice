require "rails_helper"

describe InvoicesController do
  describe "#GET new" do
    before { get :new }

    it { is_expected.to render_template(:new) }
  end

  describe "#POST create", vcr: { cassette_name: "cryptopay_api/post_invoices" } do
    let(:attributes) { attributes_for(:invoice).slice(:custom_id, :price_cents, :currency) }
    before { post :create, invoice: attributes }

    it { is_expected.to redirect_to(invoice_path(Invoice.last)) }
    it { is_expected.to respond_with(302) }
  end
end
