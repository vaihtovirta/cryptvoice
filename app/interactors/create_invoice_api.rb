class CreateInvoiceApi
  include Interactor

  delegate :params, to: :context

  after do
    context.invoice_attributes = invoice.attributes
  end

  def call
    create_invoice
  end

  private

  def create_invoice
    context.fail! unless invoice.save
  end

  def invoice
    @invoice ||= API::Invoice.new(prepared_params)
  end

  def prepared_params
    Invoices::ApiParamsConverter.new(params).call
  end
end
