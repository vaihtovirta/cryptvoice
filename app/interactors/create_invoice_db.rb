class CreateInvoiceDb
  include Interactor

  MODEL_ATTRIBUTES = %i(
    custom_id
    currency
    name
    description
    validation_hash
    callback_params
    status
    btc_address
    price_cents
    valid_till
  ).freeze

  delegate :params, :invoice_from_api, to: :context

  before do
    context.bitcoin_uri = invoice_from_api.bitcoin_uri
  end

  def call
    context.fail! unless save_invoice_to_db
  end

  private

  def save_invoice_to_db
    Invoice.create(normalized_attributes)
  end

  def normalized_attributes
    attributes[:price_cents] = params[:price]
    attributes[:custom_id] = attributes[:id]
    attributes[:currency] = attributes[:currency].downcase

    attributes.slice(*MODEL_ATTRIBUTES)
  end

  def attributes
    @attributes ||= invoice_from_api.attributes
  end
end
