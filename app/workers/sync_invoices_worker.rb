class SyncInvoicesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    walk_through_invoice_ids
  end

  private

  def walk_through_invoice_ids
    invoice_uuids.each do |invoice_uuid|
      SyncInvoiceJob.perform_later(invoice_uuid)
    end
  end

  def invoice_uuids
    @invoice_uuids ||= Invoice.unconfirmed.pluck(:uuid)
  end
end
