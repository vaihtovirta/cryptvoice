class SynchronizeInvoiceAttributes
  ATTRIBUTES_FOR_SYNC = %i(status).freeze

  attr_reader :invoice_uuid

  def initialize(invoice_uuid)
    @invoice_uuid = invoice_uuid
  end

  def call
    sync_attributes
  end

  private

  def sync_attributes
    return unless invoice_from_db

    invoice_from_db.assign_attributes(attributes_for_sync)

    invoice_from_db.save if invoice_from_db.changed?
  end

  def invoice_from_api
    @invoice_from_api ||= API::Invoice.find(invoice_uuid)
  end

  def invoice_from_db
    @invoice_from_db ||= Invoice.find_by(uuid: invoice_uuid)
  end

  def attributes_for_sync
    invoice_from_api.attributes.slice(*ATTRIBUTES_FOR_SYNC)
  end
end
