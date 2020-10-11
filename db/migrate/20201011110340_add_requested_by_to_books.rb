class AddRequestedByToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :requested_by, :string, default: ""
  end
end
