class AddBtcPriceToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :btc_price, :string
  end
end
