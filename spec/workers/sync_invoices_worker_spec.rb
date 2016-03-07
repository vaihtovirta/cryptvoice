require "rails_helper"

describe SyncInvoicesWorker do
  UUID = "bc90ab25-155c-4342-ae8c-e835abdfd8e1".freeze

  let!(:invoice_db) { create(:invoice, uuid: UUID, status: Invoice.statuses[:pending]) }
  let(:worker) { described_class.new }

  describe "#perform", vcr: { cassette_name: "cryptopay_api/get_invoice", erb: { uuid: UUID } } do
    it do
      expect { worker.perform }
        .to change { invoice_db.reload.status }.from("pending").to("confirmed")
    end
  end
end
