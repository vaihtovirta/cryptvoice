class Invoice < ActiveRecord::Base
  self.primary_key = "uuid"

  monetize :price_cents, with_model_currency: :currency

  enum status: {
    pending:   0,
    paid:      1,
    confirmed: 2,
    partpaid:  3,
    overpaid:  4,
    timeout:   5
  }
  enum currency: {
    usd: 0,
    eur: 1,
    gbp: 2,
    btc: 3
  }
end
