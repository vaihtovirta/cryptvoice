module Invoices
  class ModelAttributesConverter
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

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      prepare_attributes
    end

    def prepare_attributes
      attributes[:custom_id] = attributes[:id]
      attributes[:price] = to_money

      attributes.slice(*MODEL_ATTRIBUTES)
    end

    def to_money
      Money.from_amount(attributes[:price].to_f, attributes[:currency])
    end
  end
end