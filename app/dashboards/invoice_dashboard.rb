require "administrate/base_dashboard"

class InvoiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    uuid: Field::String.with_options(searchable: false),
    custom_id: Field::String,
    name: Field::String,
    description: Field::String,
    validation_hash: Field::String,
    callback_params: Field::String.with_options(searchable: false),
    status: EnumField.with_options(searchable: false),
    currency: EnumField.with_options(searchable: false),
    btc_address: Field::String,
    bitcoin_uri: Field::String,
    price: Field::String,
    valid_till: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i(uuid custom_id name description updated_at).freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i(
    uuid
    custom_id
    name
    description
    validation_hash
    callback_params
    status
    currency
    btc_address
    bitcoin_uri
    price
    valid_till
    created_at
    updated_at
  ).freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i(
    uuid
    custom_id
    name
    description
    validation_hash
    callback_params
    status
    currency
    btc_address
    bitcoin_uri
    price
    valid_till
  ).freeze

  # Overwrite this method to customize how invoices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(invoice)
  #   "Invoice ##{invoice.id}"
  # end
end
