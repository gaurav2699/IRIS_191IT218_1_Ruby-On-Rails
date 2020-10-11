class AddRequestedByIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :requested_by_id, :integer, default: -1
  end
end
