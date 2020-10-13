class RemoveIssuedToFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :issued_to, :string
  end
end
