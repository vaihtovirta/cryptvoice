class CreateInvoiceApi
  include Interactor

  delegate :params, to: :context

  after do
    context.invoice_attributes = saved_invoice.attributes
  end

  def call
    create_invoice
  end

  private

  def create_invoice
    context.fail! unless saved_invoice
  end

  def saved_invoice
    @saved_invoice ||= new_invoice.save
  end

  def new_invoice
    @invoice ||= Api::Invoice.new(prepared_params)
  end

  def prepared_params
    @prepared_params ||= Invoices::ApiParamsConverter.new(params).call
  end
end
