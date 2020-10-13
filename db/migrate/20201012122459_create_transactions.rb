class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.boolean :requested, default: false
      t.string :requested_by, default: ""
      t.integer :requested_by_id, default: -1
      t.integer :status, default: 0
      t.string :issued_to, default: ""
      t.integer :issued_to_id, default: -1
      t.date :issue_date
      t.date :return_date

      t.timestamps
    end
  end
end
