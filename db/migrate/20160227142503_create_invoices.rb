class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices, id: false do |t|
      t.uuid :uuid, primary_key: true, default: "uuid_generate_v4()"
      t.string :custom_id
      t.string :name
      t.string :description
      t.string :validation_hash
      t.jsonb :callback_params
      t.integer :status, default: 0
      t.integer :currency, default: 0
      t.string :btc_address
      t.monetize :price, currency: { present: false }
      t.datetime :valid_till

      t.timestamps null: false
    end
  end
end
