class AddRequestedToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :requested, :boolean, default: false
  end
end
