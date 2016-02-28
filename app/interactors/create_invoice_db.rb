class CreateInvoiceDb
  include Interactor

  delegate :invoice, :invoice_attributes, to: :context

  def call
    context.fail! unless save_invoice
  end

  private

  def save_invoice
    invoice.update(prepared_attributes)
  end

  def prepared_attributes
    Invoices::ModelAttributesConverter.new(invoice_attributes).call
  end
end
