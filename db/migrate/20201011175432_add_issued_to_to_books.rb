class AddIssuedToToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :issued_to, :string, default: ""
  end
end
