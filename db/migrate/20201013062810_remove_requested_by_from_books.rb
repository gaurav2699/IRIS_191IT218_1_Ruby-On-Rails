class RemoveRequestedByFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :requested_by, :string
  end
end
