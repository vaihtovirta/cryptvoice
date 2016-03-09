class Invoice < ActiveRecord::Base
  include PresenterWrapper, StatusAasm

  monetize :price_cents,
    with_model_currency: :currency,
    numericality: { greater_than: 0 }

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

  scope :unconfirmed, -> { where.not(status: statuses[:confirmed]) }

  def bitcoin_uri_valid?
    valid_till < Time.zone.now
  end
end
