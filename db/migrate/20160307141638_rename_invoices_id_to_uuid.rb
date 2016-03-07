class RenameInvoicesIdToUuid < ActiveRecord::Migration
  def change
    rename_column :invoices, :id, :uuid
  end
end
