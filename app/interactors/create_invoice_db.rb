class CreateInvoiceDb
  include Interactor

  MODEL_ATTRIBUTES = %i(
    uuid
    btc_address
    bitcoin_uri
    callback_params
    custom_id
    description
    name
    price
    status
    valid_till
    validation_hash
  ).freeze

  delegate :params, :invoice_from_api, to: :context

  def call
    context.fail! unless invoice

    context.invoice = invoice
  end

  private

  def invoice
    @invoice ||= Invoice.create(prepared_attributes)
  end

  def prepared_attributes
    attributes[:custom_id] = attributes[:id]
    attributes[:price] = calc_money(attributes[:price], attributes[:currency])

    attributes.slice(*MODEL_ATTRIBUTES)
  end

  def attributes
    @attributes ||= invoice_from_api.attributes
  end

  def calc_money(price, currency)
    Money.from_amount(price.to_f, currency)
  end
end
