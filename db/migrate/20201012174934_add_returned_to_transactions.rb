class AddReturnedToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :returned, :boolean, default: false
  end
end
