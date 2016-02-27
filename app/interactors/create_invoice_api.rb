class CreateInvoiceApi
  include MoneyRails::ActionViewExtension, Interactor

  delegate :params, to: :context

  def call
    create_invoice
    
    context.invoice_from_api = saved_invoice
  end

  private

  def create_invoice
    context.fail! unless saved_invoice
  end

  def saved_invoice
    return @saved_invoice if defined?(@saved_invoice)

    @saved_invoice = new_invoice.save
  end

  def new_invoice
    @invoice ||= Api::Invoice.new(prepared_params)
  end

  def prepared_params
    params[:id] = params[:custom_id]
    params[:price] = params[:price_cents]
    params[:currency] = params[:currency].upcase
    params.except!(:custom_id, :price_cents)
  end
end
