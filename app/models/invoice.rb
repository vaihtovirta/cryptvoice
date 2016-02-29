class Invoice < ActiveRecord::Base
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
    usd: "USD",
    eur: "EUR",
    gbp: "GBP",
    btc: "BTC"
  }

  validates :price_cents, :currency, presence: true
end
