class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices, id: :uuid do |t|
      t.string :custom_id
      t.string :name
      t.string :description
      t.string :validation_hash
      t.jsonb :callback_params
      t.integer :status, default: 0
      t.string :currency, default: "USD"
      t.string :btc_address
      t.string :bitcoin_uri
      t.monetize :price, currency: { present: false }, null: false
      t.datetime :valid_till

      t.timestamps null: false
    end
  end
end
