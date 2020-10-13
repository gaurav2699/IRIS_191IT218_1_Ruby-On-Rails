class RemoveRequestedByIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :requested_by_id, :integer
  end
end
