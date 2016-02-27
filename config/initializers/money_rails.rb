MoneyRails.configure do |config|
  # TODO: Add exchange rates
  config.register_currency = {
    priority: 1,
    iso_code: "btc",
    name: "BTC with subunit of 8 digits",
    symbol: "BTC",
    symbol_first: false,
    subunit: "Satoshi",
    subunit_to_unit: 100_000_000,
    thousands_separator: ",",
    decimal_mark: "."
  }
end
