FactoryGirl.define do
  factory :invoice do
    uuid { SecureRandom.uuid }
    custom_id { Faker::Lorem.word }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    validation_hash { SecureRandom.hex(10) }
    callback_params { { format: "anything" }.to_json }
    status "pending"
    currency "USD"
    btc_address { Faker::Bitcoin.address }
    price_cents 10_000
    price { Money.new(10_000) }
    valid_till { Time.zone.now + 10.minutes }
    bitcoin_uri { "bitcoin:#{btc_address}?amount=0.1&label=#{custom_id}" }
  end
end
