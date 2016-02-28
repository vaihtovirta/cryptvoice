class CreateInvoiceDb
  include Interactor

  delegate :invoice, :invoice_attributes, to: :context

  def call
    context.fail! unless save_invoice
  end

  private

  def save_invoice
    invoice.assign_attributes(prepared_attributes)
    invoice.save
  end

  def prepared_attributes
    Invoices::ModelAttributesConverter.new(invoice_attributes).call
  end
end
