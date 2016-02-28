module Invoices
  class ApiParamsConverter
    API_KEY_MAPPINGS = {
      custom_id: :id,
      price_cents: :price
    }.freeze

    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      rename_params!

      params
    end

    def rename_params!
      API_KEY_MAPPINGS.each do |k, v|
        params[v] = params.delete(k)
      end
    end
  end
end
