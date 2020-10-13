class RemoveColumnsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :status, :integer
    remove_column :books, :requested, :boolean
  end
end
