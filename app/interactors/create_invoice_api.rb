class CreateInvoiceApi
  include Interactor

  delegate :params, to: :context

  def call
    rename_mappings
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
    @invoice ||= Api::Invoice.new(params)
  end

  def rename_mappings
    key_aliases.each do |k, v|
      params[v] = params.delete(k)
    end
  end

  def key_aliases
    {
      custom_id: :id,
      price_cents: :price
    }
  end
end
