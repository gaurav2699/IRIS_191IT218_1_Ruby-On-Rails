class AddBookToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :book, foreign_key: true
  end
end
