class AddIssuedToIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :issued_to_id, :integer, default: -1
  end
end
