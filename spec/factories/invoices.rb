FactoryGirl.define do
  factory :invoice do
    uuid { SecureRandom.uuid }
    custom_id { Faker::Lorem.word }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    validation_hash { SecureRandom.hex(10) }
    callback_params { { format: "anything" }.to_json }
    status "pending"
    currency "usd"
    btc_address { Faker::Bitcoin.address }
    price_cents 10_000
    valid_till { Time.now + 10.minutes }
  end
end
