class SyncInvoiceJob < ActiveJob::Base
  queue_as :default

  def perform(invoice_uuid)
    SynchronizeInvoiceAttributes.new(invoice_uuid).call
  end
end
